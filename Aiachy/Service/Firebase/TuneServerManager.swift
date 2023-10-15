//
//  TuneManager.swift
//  Aiachy
//
//  Created by Mert Türedü on 18.08.2023.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
//MARK: TuneServerManager - protocol - ServerProtocol -
private protocol ServerProtocol {
    func getTunesInfoFromServer(completion: @escaping (Result<ACYTuneEntity,Error>) -> ())
    func downloadTuneFromServer(entity acyTuneEntity: ACYTuneEntity, completion: @escaping (DownloadResult) -> Void)
}

enum DownloadResult {
    case progress(Double)
    case completion(URL)
    case failure(Error)
}

class TuneServerManager: ObservableObject {
    
    private let storage = Storage.storage()
    private let firestore = Firestore.firestore()
    private let decoder = JSONDecoder()

    init() {    }
}
//MARK: TuneServerManager - extension - ServerProtocol -
extension TuneServerManager: ServerProtocol {
    /// <#Description#>
    /// - Parameter completion: <#completion description#>
    func getTunesInfoFromServer(completion: @escaping (Result<ACYTuneEntity, Error>) -> ()) {
        firestore.collection(ACY_TUNE_COLLECTION).getDocuments { snap, error in
            if error != nil { print(ACYErrorDataFetching.notWorkingServer.printDataFetching("AiachyExecutiveServerManager")) }
            
            guard let docs = snap?.documents else { return }
            
            for doc in docs {
                let tuneData = doc.data()
                do {
                    
                    let jsonTuneData = try JSONSerialization.data(withJSONObject: tuneData, options: .prettyPrinted)
                    let decodedData = try self.decoder.decode(ACYTuneEntity.self, from: jsonTuneData)
                    completion(.success(decodedData))
                } catch {
                    //NextPatchTODO: error
                }
            }
        }
    }
    /// <#Description#>
    /// - Parameters:
    ///   - acyTuneEntity: <#acyTuneEntity description#>
    ///   - completion: <#completion description#>
    func downloadTuneFromServer(entity acyTuneEntity: ACYTuneEntity, completion: @escaping (DownloadResult) -> Void) {
        let url = acyTuneEntity.url
        guard let checkedURL = url, let tuneId = acyTuneEntity.tuneId else { return }
        let reference = storage.reference(forURL: checkedURL)
        let maxSize: Int64 = 10 * 1024 * 1024
        let data = reference.getData(maxSize: maxSize) { data, error in
            if error != nil {
                completion(.failure(error!))
                print(ACYErrorDataFetching.notWorkingServer.printDataFetching("AiachyExecutiveServerManager"))
                return
            }

            guard let checkedData = data else { return }

            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let aiachyTunesFolderURL = documentsDirectory.appendingPathComponent("AiachyTunes")

            if !FileManager.default.fileExists(atPath: aiachyTunesFolderURL.path) {
                do {
                    try FileManager.default.createDirectory(at: aiachyTunesFolderURL, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print(error.localizedDescription)
                    return
                }
            }
            let fileURL = aiachyTunesFolderURL.appendingPathComponent("\(tuneId).mp3")
            
            do {
                try checkedData.write(to: fileURL, options: .atomic)
                completion(.completion(fileURL))
            } catch {
                print(error.localizedDescription)
            }

        }

        data.observe(.progress) { snapshot in
            guard let progress = snapshot.progress else { return }
            let percentComplete = 100.0 * Double(progress.completedUnitCount) / Double(progress.totalUnitCount)

            DispatchQueue.main.async {
                completion(.progress(percentComplete))
            }
        }
    }
}
