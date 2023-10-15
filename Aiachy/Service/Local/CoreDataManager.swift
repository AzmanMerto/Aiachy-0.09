//
//  CoreDataManager.swift
//  Aiachy
//
//  Created by Mert Türedü on 27.07.2023.
//

import Foundation
import CoreData
import UIKit

private protocol UserAllEntityProtocol {
    
}
//MARK: CoreDataManager - protocol - ZodiacEntityProtocol -
private protocol ZodiacEntityProtocol {
}
private protocol AscendiantEntityProtocol {
    
}
private protocol CompatibilityEntityProtocol {
    
}
private protocol ChakraStatusEntityProtocol {
    
}
//MARK: CoreDataManager - protocol - TuneEntityProtocol -
private protocol TuneEntityProtocol {
    func fetchAllTuneInfo(completion: @escaping ([ACYTuneEntity]) -> ())
    func getTuneInfo(predicate: NSPredicate, forKey key: String, completion: @escaping (ACYTuneEntity) -> ())
    func saveTuneInfo(entity acyTuneEntity: ACYTuneEntity)
}
//MARK: CoreDataManager - protocol - HandlerProtocol -
private protocol HandlerProtocol {
    func updateCoreData(type fetchRequestType: CoreDataManager.FetchRequestTypes, predicate: NSPredicate, updatedValue: Any, forKey key: String)
    func checkDataExists(type FetchRequestTypes: CoreDataManager.FetchRequestTypes) -> Bool
    func deleteAllData(type: CoreDataManager.FetchRequestTypes)
    func saveCoreData()
}
//MARK: CoreDataManager - Manager -
class CoreDataManager: ObservableObject {
    
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
    private let encoder = JSONEncoder()
    
    init() {
        self.container = NSPersistentContainer(name: "AiachyData")
        self.container.loadPersistentStores { description, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                
            }
        }
        context = container.viewContext
    }
    
    //MARK: CoreDataManager - FetchRequestTypes -
    enum FetchRequestTypes {
        case zodiacEntity
        case tuneEntity
        case ascendiantEntity
        case compatibilityEntity
        case chakraStatusEntity
        
        func makeContextEntity(context: NSManagedObjectContext) -> NSManagedObject {
            switch self {
            case .zodiacEntity:
                return ZodiacEntity(context: context)
            case .tuneEntity:
                return TuneEntity(context: context)
            case .ascendiantEntity:
                return AscendiantEntity(context: context)
            case .compatibilityEntity:
                return CompatibilityEntity(context: context)
            case .chakraStatusEntity:
                return ChakraStatusEntity(context: context)
            }
        }
        
        func makeFetchRequestResult() -> NSFetchRequest<NSFetchRequestResult> {
            switch self {
            case .zodiacEntity:
                return NSFetchRequest<ZodiacEntity>(entityName: String(describing: ZodiacEntity.self)) as! NSFetchRequest<NSFetchRequestResult>
            case .tuneEntity:
                return NSFetchRequest<TuneEntity>(entityName: String(describing: TuneEntity.self)) as! NSFetchRequest<NSFetchRequestResult>
            case .ascendiantEntity:
                return NSFetchRequest<AscendiantEntity>(entityName: String(describing: AscendiantEntity.self)) as! NSFetchRequest<NSFetchRequestResult>
            case .compatibilityEntity:
                return NSFetchRequest<CompatibilityEntity>(entityName: String(describing: CompatibilityEntity.self)) as! NSFetchRequest<NSFetchRequestResult>
            case .chakraStatusEntity:
                return NSFetchRequest<ChakraStatusEntity>(entityName: String(describing: ChakraStatusEntity.self)) as! NSFetchRequest<NSFetchRequestResult>
            }
        }
    }
}

extension CoreDataManager: UserAllEntityProtocol {
    
    /// <#Description#>
    /// - Returns: <#description#>
    func fetchAllUserEntities() -> [ACYUserAllEntity]? {
        var acyUserAllEntities: [ACYUserAllEntity] = []
        
        do {
            let zodiacEntities = try context.fetch(FetchRequestTypes.zodiacEntity.makeFetchRequestResult()) as! [ZodiacEntity]
            
            for zodiacEntity in zodiacEntities {
                if let acyZodiacEntity = createZodiacEntity(from: zodiacEntity) {
                    let acyChakraStatusEntities = createChakraStatusEntities(from: zodiacEntity)
                    let acyAscendiantEntites = createAscendiantEntities(from: zodiacEntity)
                    let acyCompatibilityEntites = createCompatibilityEntites(from: zodiacEntity)
                    
                    acyUserAllEntities.append(ACYUserAllEntity(zodiac: acyZodiacEntity,
                                                               ascendiant: acyAscendiantEntites,
                                                               compatibility: acyCompatibilityEntites,
                                                               chakraStatus: acyChakraStatusEntities))
                }
            }
            
            return acyUserAllEntities
            
        } catch let error {
            print("Hata: \(error)")
            return nil
        }
    }
    
    /// will setting zodiac datas to Core Data .
    /// - Parameter acyZodiacEntity: type zodaic datas.
    func saveUserAllEntity(entity acyUserAllEntity: ACYUserAllEntity) {
        
        let entity = FetchRequestTypes.zodiacEntity.makeContextEntity(context: context) as! ZodiacEntity
        
        entity.date = acyUserAllEntity.zodiac.date
        entity.zodiac = Int16((acyUserAllEntity.zodiac.zodiac)!)
        entity.serialNumber = Int64((acyUserAllEntity.zodiac.serialNumber)!)
        entity.comment = acyUserAllEntity.zodiac.comment
        entity.zodiacDataVersion = acyUserAllEntity.zodiac.zodiacDataVersion
        for ascendiant in acyUserAllEntity.ascendiant {
            saveAscendiantEntity(entity: ascendiant, zodiacEntity: entity)
        }

        for compatibility in acyUserAllEntity.compatibility {
            saveCompatibilityEntity(entity: compatibility, zodiacEntity: entity)
        }
        
        for chakraStatus in acyUserAllEntity.chakraStatus {
            saveChakraStatusEntity(entity: chakraStatus, zodiacEntity: entity)
        }
        
        saveCoreData()
        print(ACYPrintAppInfo.ableToWriteToCoreData.printAppInfo())
    }
    
}

//MARK: - CoreDataManager - extension - ZodiacEntityProtocol -
extension CoreDataManager: ZodiacEntityProtocol {
    /// <#Description#>
    /// - Parameter entity: <#entity description#>
    /// - Returns: <#description#>
    fileprivate func createZodiacEntity(from entity: ZodiacEntity) -> ACYZodiacEntity? {
        guard let date = entity.date,
              let zodiac = Int(exactly: entity.zodiac),
              let serialNumber = Int(exactly: entity.serialNumber),
              let comment = entity.comment,
              let zodiacDataVersion = entity.zodiacDataVersion else { return nil }
        
        return ACYZodiacEntity(date: date,
                               zodiac: zodiac,
                               serialNumber: serialNumber,
                               comment: comment,
                               zodiacDataVersion: zodiacDataVersion)
    }
}
//MARK: - CoreDataManager - extension - AscendiantEntityProtocol -
extension CoreDataManager: AscendiantEntityProtocol {
    /// <#Description#>
    /// - Parameters:
    ///   - acyAscendiantEntity: <#acyAscendiantEntity description#>
    ///   - zodiacEntity: <#zodiacEntity description#>
    fileprivate func saveAscendiantEntity( entity acyAscendiantEntity: ACYAscendiantEntity, zodiacEntity: ZodiacEntity) {
        let entity = FetchRequestTypes.ascendiantEntity.makeContextEntity(context: context) as! AscendiantEntity
        
        entity.serialNumber = Int64(acyAscendiantEntity.serialNumber)
        entity.comment = acyAscendiantEntity.comment
        entity.determinedZodiac = Int16(acyAscendiantEntity.determinedZodiac)
        entity.ascendiantDataVersion = acyAscendiantEntity.ascendiantDataVersion
        entity.zodiacEntity = zodiacEntity
        saveCoreData()
    }
    /// <#Description#>
    /// - Parameter entity: <#entity description#>
    /// - Returns: <#description#>
    func createAscendiantEntities(from entity: ZodiacEntity) -> [ACYAscendiantEntity] {
        var acyAscendiantEntities: [ACYAscendiantEntity] = []
        
        let ascendiantEntities = entity.ascendiantEntity?.allObjects as! [AscendiantEntity]
        
        for ascendiantEntity in ascendiantEntities {
            guard let serialNumber = Int(exactly: ascendiantEntity.serialNumber),
                  let determinedZodiac = Int(exactly: ascendiantEntity.determinedZodiac),
                  let comment = ascendiantEntity.comment,
                  let ascendiantDataVersion = ascendiantEntity.ascendiantDataVersion else { continue }
            
            let acyAscendiantEntity = ACYAscendiantEntity(serialNumber: serialNumber,
                                                          determinedZodiac: determinedZodiac,
                                                          comment: comment,
                                                          ascendiantDataVersion: ascendiantDataVersion)
            acyAscendiantEntities.append(acyAscendiantEntity)
            
        }
        return acyAscendiantEntities
    }
}
//MARK: - CoreDataManager - extension - CompatibilityEntityProtocol -
extension CoreDataManager: CompatibilityEntityProtocol {
    /// <#Description#>
    /// - Parameters:
    ///   - acyCompatibilityEntity: <#acyCompatibilityEntity description#>
    ///   - zodiacEntity: <#zodiacEntity description#>
    fileprivate func saveCompatibilityEntity(entity acyCompatibilityEntity: ACYCompatibilityEntity, zodiacEntity: ZodiacEntity) {
        
        let entity = FetchRequestTypes.compatibilityEntity.makeContextEntity(context: context) as! CompatibilityEntity

        entity.serialNumber = Int64(acyCompatibilityEntity.serialNumber)
        entity.zodiac = Int16(acyCompatibilityEntity.zodiac)
        entity.compatibilityDataVersion = acyCompatibilityEntity.compatibilityDataVersion
        entity.zodiacEntity = zodiacEntity
        saveCoreData()
    }
    
    /// <#Description#>
    /// - Parameter entity: <#entity description#>
    /// - Returns: <#description#>
    fileprivate func createCompatibilityEntites(from entity: ZodiacEntity) -> [ACYCompatibilityEntity] {
        
        var acyCompatibilityEntites: [ACYCompatibilityEntity] = []
        
        let compatibilityEntites = entity.compatibilityEntity?.allObjects as! [CompatibilityEntity]
        
        for compatibilityEntity in compatibilityEntites {
            guard let serialNumber = Int(exactly: compatibilityEntity.serialNumber),
                  let zodiac = Int(exactly: compatibilityEntity.zodiac),
                  let compatibilityDataVersion = compatibilityEntity.compatibilityDataVersion else { continue }
            
            let acyCompatiblityEntity = ACYCompatibilityEntity(serialNumber: serialNumber,
                                                               zodiac: zodiac,
                                                               compatibilityDataVersion: compatibilityDataVersion)
            acyCompatibilityEntites.append(acyCompatiblityEntity)
        }
        return acyCompatibilityEntites
        
    }
}
extension CoreDataManager: ChakraStatusEntityProtocol {

    /// <#Description#>
    /// - Parameters:
    ///   - acyChakraStatusEntity: <#acyChakraStatusEntity description#>
    ///   - zodiacEntity: <#zodiacEntity description#>
    fileprivate func saveChakraStatusEntity(entity acyChakraStatusEntity: ACYChakraStatusEntity, zodiacEntity: ZodiacEntity) {
        let entity = FetchRequestTypes.chakraStatusEntity.makeContextEntity(context: context) as! ChakraStatusEntity

        entity.comment = acyChakraStatusEntity.comment
        entity.rate = acyChakraStatusEntity.rate
        entity.serialNumber = Int64(acyChakraStatusEntity.serialNumber)
        entity.statusDataVersion = acyChakraStatusEntity.statusDataVersion
        entity.tier = Int16(acyChakraStatusEntity.tier)
        entity.zodiacEntity = zodiacEntity
        saveCoreData()
    }
    /// <#Description#>
    /// - Parameter entity: <#entity description#>
    /// - Returns: <#description#>
    fileprivate func createChakraStatusEntities(from entity: ZodiacEntity) -> [ACYChakraStatusEntity] {
        var acyChakraStatusEntities: [ACYChakraStatusEntity] = []
        let chakraStatusEntities = entity.chakraStatusEntity?.allObjects as! [ChakraStatusEntity]
        
        for chakraStatsEntity in chakraStatusEntities {
            guard let serialNumber = Int(exactly: chakraStatsEntity.serialNumber),
                  let tier = Int(exactly: chakraStatsEntity.tier),
                  let comment = chakraStatsEntity.comment,
                  let statusDataVersion = chakraStatsEntity.statusDataVersion else { continue }
            
            let rate = chakraStatsEntity.rate
            let acyChakraStatusEntity = ACYChakraStatusEntity(serialNumber: serialNumber,
                                                              tier: tier,
                                                              rate: rate,
                                                              comment: comment,
                                                              statusDataVersion: statusDataVersion)
            acyChakraStatusEntities.append(acyChakraStatusEntity)
        }
        
        return acyChakraStatusEntities
    }
}
//MARK: CoreDataManager - extension - CoreDataManagerTuneDataProtocol -
extension CoreDataManager: TuneEntityProtocol {
    /// <#Description#>
    /// - Parameter completion: <#completion description#>
    func fetchAllTuneInfo(completion: @escaping ([ACYTuneEntity]) -> ()) {
        do {
            var acyTuneEntityData: [ACYTuneEntity] = []
            let tuneEntity = try context.fetch(FetchRequestTypes.tuneEntity.makeFetchRequestResult()) as! [TuneEntity]
            
            for acyTuneEntity in tuneEntity {
                acyTuneEntityData.append(ACYTuneEntity(tuneId: acyTuneEntity.tuneId,
                                                       name: acyTuneEntity.name,
                                                       determinedZodiac: Int(acyTuneEntity.determinedZodiac),
                                                       isPremium: acyTuneEntity.isPremium,
                                                       url: acyTuneEntity.url,
                                                       statement: acyTuneEntity.statement,
                                                       tuneDataVersion: acyTuneEntity.tuneDataVersion,
                                                       duration: Int(acyTuneEntity.duration)))
            }
            completion(acyTuneEntityData)
        } catch {
            print("Error fetching tune info: \(error)")
        }
    }
    /// <#Description#>
    /// - Parameters:
    ///   - predicate: <#predicate description#>
    ///   - key: <#key description#>
    ///   - completion: <#completion description#>
    func getTuneInfo(predicate: NSPredicate, forKey key: String, completion: @escaping (ACYTuneEntity) -> ()) {
        do {
            let tuneEntity = try context.fetch(FetchRequestTypes.tuneEntity.makeFetchRequestResult()) as! [TuneEntity]
            for acyTuneEntity in tuneEntity {
                completion(ACYTuneEntity(tuneId: acyTuneEntity.tuneId,
                                         name: acyTuneEntity.name,
                                         determinedZodiac: Int(acyTuneEntity.determinedZodiac),
                                         isPremium: acyTuneEntity.isPremium,
                                         url: acyTuneEntity.url,
                                         statement: acyTuneEntity.statement,
                                         tuneDataVersion: acyTuneEntity.tuneDataVersion,
                                         duration: Int(acyTuneEntity.duration)))
            }
        } catch {
            print("Error fetching tune info: \(error)")
        }
    }
    /// <#Description#>
    /// - Parameter acyTuneEntity: <#acyTuneEntity description#>
    func saveTuneInfo(entity acyTuneEntity: ACYTuneEntity) {
        
        let coreData = TuneEntity(context: context)
        
        coreData.determinedZodiac = Int16(acyTuneEntity.determinedZodiac!)
        coreData.isPremium = acyTuneEntity.isPremium!
        coreData.statement = acyTuneEntity.statement!
        coreData.tuneDataVersion = acyTuneEntity.tuneDataVersion!
        coreData.tuneId = acyTuneEntity.tuneId!
        coreData.name = acyTuneEntity.name!
        coreData.url = acyTuneEntity.url!
        coreData.duration = Int16(acyTuneEntity.duration!)
        saveCoreData()
    }
}
//MARK: - CoreDataManager - extension - HandlerProtocol -
extension CoreDataManager: HandlerProtocol {
    /// <#Description#>
    /// - Parameters:
    ///   - fetchRequestType: <#fetchRequestType description#>
    ///   - predicate: <#predicate description#>
    ///   - updatedValue: <#updatedValue description#>
    ///   - key: <#key description#>
    ///   - Usage:
    ///
    ///         let predicate = NSPredicate(format: "name == %@", "Muhammet Mert")
    ///         updateData(type: .zodiacEntity, predicate: predicate, updatedValue: "Mert", forKey: "name")
    func updateCoreData(type fetchRequestType: FetchRequestTypes, predicate: NSPredicate, updatedValue: Any, forKey key: String) {
        /// fetch request
        let fetchRequest = fetchRequestType.makeFetchRequestResult()
        fetchRequest.predicate = predicate
        do {
            ///find tada
            let objects = try context.fetch(fetchRequest) as! [NSManagedObject]
            if let objectToUpdate = objects.first {
                /// update data
                objectToUpdate.setValue(updatedValue, forKey: key)
                /// save
                saveCoreData()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    /// <#Description#>
    /// - Parameter FetchRequestTypes: <#FetchRequestTypes description#>
    /// - Returns: <#description#>
    func checkDataExists(type FetchRequestTypes: FetchRequestTypes) -> Bool {
        let fetchRequest = FetchRequestTypes.makeFetchRequestResult()
        do {
            let result = try context.fetch(fetchRequest)
            return result.count > 0
        } catch {
            print(ACYErrorAppInfo.unknownErrorOnCoreData.printAppInfo("CoreDataManager"))
        }
        return false
    }
    /// Core data to save data.
    fileprivate func saveCoreData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        do {
            /// save
            try self.context.save()
                print(ACYPrintAppInfo.ableToWriteToCoreData.printAppInfo())
        } catch {
            /// error
            print(ACYErrorAppInfo.didntWriteToCoreData.printAppInfo("CoreDataManager"))
        }
        }
    }
    /// Delete all data on core data.
    func deleteAllData(type: FetchRequestTypes) {
        /// request
        let fetchRequest = type.makeFetchRequestResult()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            /// dalete & saved
            try context.execute(deleteRequest)
            saveCoreData()
        } catch {
            /// error
            print(ACYErrorAppInfo.didntDeleteCoreData.printAppInfo("CoreDataManager"))
        }
    }
}
