//
//  ZodiacServerManager.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import Foundation
import FirebaseFirestore
//MARK: ZodiacServerManager - Manager
class ZodiacServerManager: ObservableObject {
    
    private let fireStore = Firestore.firestore()
    private let decoder = JSONDecoder()
    
    init() {
        
    }
    /// Get zodiac data from server.
    /// - Parameter completion: Either the error will return or the zodiac will return.
    func getZodiacFromServer(completion: @escaping (Result<Zodiac,ACYErrorDataFetching>) -> ()) {
        fireStore.collection(ACY_ZODIAC_COLLECTION).getDocuments { [self] snap, error in
            /// error
            if error != nil {print(ACYErrorDataFetching.notWorkingServer.printDataFetching("ZodiacServerManager"))}
            /// docs
            guard let docs = snap?.documents else { return }
            /// fetcing doc
            for doc in docs {
                let zodiacData = doc.data()
                do {
                    let dailyZodiacData = try JSONSerialization.data(withJSONObject: zodiacData, options: .prettyPrinted)
                    let dailyZodiac = try decoder.decode(Zodiac.self, from: dailyZodiacData)
                    completion(.success(dailyZodiac))
                } catch {
                    completion(.failure(ACYErrorDataFetching.noZodiacLeftToBring))
                }
            }
        }
    }
}
