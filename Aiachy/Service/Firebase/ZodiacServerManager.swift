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
    @Published private var fetchedSerialNumbers: Set<Int> = []
    private let fireStore = Firestore.firestore()
    private let decoder = JSONDecoder()
    
    init() {    }
    
}

extension ZodiacServerManager {
    func getUserZodiacEntityFromServer(completion: @escaping (ACYUserAllEntity) -> ()) {
        self.fireStore.collection(ACY_ZODIAC_TR_COLLECTION).getDocuments { [self] snap, error in
            if let error = error {
                print(ACYErrorDataFetching.notWorkingServer.printDataFetching("ZodiacServerManager"), error)
                return
            }
            
            guard let docs = snap?.documents else { return }
            
            for doc in docs {
                guard let serialNumber = doc.get("serialNumber") as? Int else { continue }
                
                if fetchedSerialNumbers.contains(serialNumber) {
                    continue
                }
                
                fetchedSerialNumbers.insert(serialNumber)
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: doc.data(), options: [])
                    let zodiacEntity = try self.decoder.decode(ACYZodiacEntity.self, from: jsonData)
                    
                    fetchCompatibilityEntities(for: serialNumber) { compatibilityEntities in
                        self.fetchAscendiantEntities(for: serialNumber) { ascendiantEntities in
                            self.fetchStatusEntities(for: serialNumber) { statusEntities in
                                let userZodiacEntity = ACYUserAllEntity(zodiac: zodiacEntity,
                                                                           ascendiant: ascendiantEntities,
                                                                           compatibility: compatibilityEntities,
                                                                           chakraStatus: statusEntities)
                                completion(userZodiacEntity)
                            }
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // Yardımcı fonksiyonlar
    private func fetchCompatibilityEntities(for serialNumber: Int, completion: @escaping ([ACYCompatibilityEntity]) -> ()) {
        fetchEntities(from: ACY_COMPATIBILITY_TR_COLLECTION, for: serialNumber, completion: completion)
    }
    
    private func fetchAscendiantEntities(for serialNumber: Int, completion: @escaping ([ACYAscendiantEntity]) -> ()) {
        fetchEntities(from: ACY_ASCENDIANT_TR_COLLECTION, for: serialNumber, completion: completion)
    }
    
    private func fetchStatusEntities(for serialNumber: Int, completion: @escaping ([ACYChakraStatusEntity]) -> ()) {
        fetchEntities(from: ACY_STATUS_TR_COLLECTION, for: serialNumber, completion: completion)
    }
    
    private func fetchEntities<T: Decodable>(from collection: String, for serialNumber: Int, completion: @escaping ([T]) -> ()) {
        self.fireStore.collection(collection)
            .whereField("serialNumber", isEqualTo: serialNumber)
            .getDocuments { snap, error in
                if let error = error {
                    print(ACYErrorDataFetching.notWorkingServer.printDataFetching("ZodiacServerManager"), error)
                    completion([])
                    return
                }
                
                guard let docs = snap?.documents else {
                    print("No documents found for serial number \(serialNumber) in \(collection)")
                    completion([])
                    return
                }
                
                do {
                    let entities = try docs.map { doc -> T in
                        let jsonData = try JSONSerialization.data(withJSONObject: doc.data(), options: [])
                        return try self.decoder.decode(T.self, from: jsonData)
                    }
                    completion(entities)
                } catch {
                    print("Error decoding entities:", error)
                    completion([])
                }
            }
    }
    
}
