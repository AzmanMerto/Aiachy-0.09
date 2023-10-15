//
//  GalaxyInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import Foundation
import Combine
private protocol TuneHandlerProtocol {
    func deleteAllFilesInAiachyTuneFolder()
}
//MARK: GalaxyInteractor - protocol - TuneServerProtocol -
private protocol TuneServerProtocol {
    func fillTuneInfoToCoreData(aiachy aiachyState: AiachyState)
    func checkVersion(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ())
}
//MARK: GalaxyInteractor - protocol - TuneCoreDataProtocol -
private protocol TuneCoreDataProtocol {
    func setCoreData(tuneEntity: ACYTuneEntity)
    func deleteCoreData()
    func getCoreData(completion: @escaping ([ACYTuneEntity]) -> ())
}

class GalaxyInteractor: ObservableObject {
    
    private let coreDataManager: CoreDataManager
    private let executiveServerManager: ExecutiveServerManager
    private let tuneServerManager: TuneServerManager
    let errorType: CurrentValueSubject<Int,Error>
    
    init(coreDataManager: CoreDataManager = CoreDataManager(),
         executiveServerManager: ExecutiveServerManager = ExecutiveServerManager(),
         tuneServerManager: TuneServerManager = TuneServerManager(),
         errorType: Int = 0) {
        self.coreDataManager = coreDataManager
        self.executiveServerManager = executiveServerManager
        self.tuneServerManager = tuneServerManager
        self.errorType = CurrentValueSubject(errorType)
    }
    
    func updateTuneEntityData(aiachy aiachyState: AiachyState, completion: @escaping ([ACYTuneEntity]) -> ()) {
        checkVersion(aiachy: aiachyState) { [self] isVersionSame in
            if isVersionSame {
                controlCoreData { [self] isHaveAnyData in
                    if isHaveAnyData {
                        getCoreData { completion($0) }
                    } else {
                        fillTuneInfoToCoreData(aiachy: aiachyState)
                    }
                }
            } else {
                /// new version then result funcs
                deleteCoreData()
                deleteAllFilesInAiachyTuneFolder()
                fillTuneInfoToCoreData(aiachy: aiachyState)
            }
        }
    }
    
}
//MARK: GalaxyInteractor - extension - TuneHandlerProtocol -
extension GalaxyInteractor: TuneHandlerProtocol {
    
    func deleteAllFilesInAiachyTuneFolder() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let aiachyTuneFolderURL = documentsDirectory.appendingPathComponent("AiachyTunes")
        
        do {
            let fileURLs = try FileManager.default.contentsOfDirectory(at: aiachyTuneFolderURL, includingPropertiesForKeys: nil)
            
            for fileURL in fileURLs {
                try FileManager.default.removeItem(at: fileURL)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
//MARK: GalaxyInteractor - extension - TuneServerProtocol -
extension GalaxyInteractor: TuneServerProtocol {
    /// <#Description#>
    /// - Parameter aiachyState: <#aiachyState description#>
    fileprivate func fillTuneInfoToCoreData(aiachy aiachyState: AiachyState) {
        tuneServerManager.getTunesInfoFromServer { [self] result in
            switch result {
            case .success(let success):
                setCoreData(tuneEntity: success)
            case .failure(let failure):
                errorType.send(2)
                print(failure.localizedDescription)
            }
        }
    }
    
    /// <#Description#>
    /// - Parameter aiachyState: <#aiachyState description#>
    /// - Returns: <#description#>
    fileprivate func checkVersion(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ()) {
        executiveServerManager.checkIsSameTuneVersion(aiachy: aiachyState) { [self] isSameTuneVersion in
            guard isSameTuneVersion else {
                executiveServerManager.setLocalUserTuneDataVersion(aiachy: aiachyState)
                executiveServerManager.updateServerUserTuneDataVersion(aiachy: aiachyState)
                completion(false)
                return }
            completion(true)
        }
    }
}

//MARK: GalaxyInteractor - extension - CoreDataProtocol -
extension GalaxyInteractor: TuneCoreDataProtocol {
    fileprivate func setCoreData(tuneEntity: ACYTuneEntity) {
        coreDataManager.saveTuneInfo(entity: tuneEntity)
    }
    fileprivate func getCoreData(completion: @escaping ([ACYTuneEntity]) -> ()) {
        coreDataManager.fetchAllTuneInfo { ACYTuneEntity in
            completion(ACYTuneEntity)
        }
    }
    fileprivate func deleteCoreData() {
        coreDataManager.deleteAllData(type: .tuneEntity)
    }
    fileprivate func controlCoreData(completion: @escaping (Bool) -> ()) {
        completion(coreDataManager.checkDataExists(type: .tuneEntity))
    }
}
