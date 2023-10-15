//
//  ExecutiveServerManager.swift
//  Aiachy
//
//  Created by Mert Türedü on 31.07.2023.
//

import Foundation
import FirebaseFirestore
//MARK: ExecutiveServerManager - protocol - UserProtocol
private protocol UserProtocol {
    func setLocalUserZodiacDataVersion(aiachy aiachyState: AiachyState)
    func setLocalUserTuneDataVersion(aiachy aiachyState: AiachyState)
}
//MARK: ExecutiveServerManager - protocol - ControlProtocol
private protocol ControlProtocol {
    func checkIsSameZodiacVersion(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ())
    func checkIsSameTuneVersion(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ())
}
//MARK: ExecutiveServerManager - protocol - ServerProtocol
private protocol ServerProtocol {
    func checkLastExecutiveDataVersion(completion: @escaping (Bool) -> ())
    func updateServerUserZodiacDataVersion(aiachy aiachyState: AiachyState)
    func updateServerUserTuneDataVersion(aiachy aiachyState: AiachyState)
}
//MARK: ExecutiveServerManager - Manager
class ExecutiveServerManager: ObservableObject {
    
    @Published private var lastZodiacDataVersion: String?
    @Published private var lastTuneDataVersion: String?
    private let firestore = Firestore.firestore()
    
    init() { }
}
//NextPatchTODO:  2323
//MARK: ExecutiveServerManager - extension - UserProtocol -
extension ExecutiveServerManager: UserProtocol {
    /// <#Description#>
    /// - Parameter aiachyState: <#aiachyState description#>
    func setLocalUserZodiacDataVersion(aiachy aiachyState: AiachyState) {
        aiachyState.user.aiachyInfo.aiachyDataInfo.zodiacDataVersion = self.lastZodiacDataVersion
    }
    /// <#Description#>
    /// - Parameter aiachyState: <#aiachyState description#>
    func setLocalUserTuneDataVersion(aiachy aiachyState: AiachyState) {
        aiachyState.user.aiachyInfo.aiachyDataInfo.tuneDataVersion = self.lastTuneDataVersion
    }
}
//MARK: ExecutiveServerManager - extension - ControlProtocol -
extension ExecutiveServerManager: ControlProtocol {
    /// <#Description#>
    /// - Parameters:
    ///   - aiachyState: <#aiachyState description#>
    ///   - completion: <#completion description#>
    func checkIsSameZodiacVersion(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ()) {
        checkLastExecutiveDataVersion { [self] isChecked in
            guard isChecked else { return }
            let currentZodiacDataVersion = aiachyState.user.aiachyInfo.aiachyDataInfo.wrappedZodiacDataVersion
            guard currentZodiacDataVersion == lastZodiacDataVersion else { completion(false); return }
            completion(true)
        }
    }
    /// <#Description#>
    /// - Parameters:
    ///   - aiachyState: <#aiachyState description#>
    ///   - completion: <#completion description#>
    func checkIsSameTuneVersion(aiachy aiachyState: AiachyState, completion: @escaping (Bool) -> ()) {
        checkLastExecutiveDataVersion { [self] isChecked in
            guard isChecked else { return }
            let currentZodiacDataVersion = aiachyState.user.aiachyInfo.aiachyDataInfo.wrappedTuneDataVersion
            guard currentZodiacDataVersion == lastTuneDataVersion else { completion(false); return }
            completion(true)
        }
    }
}
//MARK: ExecutiveServerManager - extension - ServerProtocol -
extension ExecutiveServerManager: ServerProtocol {
    /// <#Description#>
    func checkLastExecutiveDataVersion(completion: @escaping (Bool) -> ()) {
        firestore.collection(ACY_EXECUTIVE_COLLECTION).document(ACY_DATA_INFO_PATH).getDocument { [self] snap, error in
            if error != nil {completion(false); print(ACYErrorDataFetching.notWorkingServer.printDataFetching("AiachyExecutiveServerManager")) }
            guard let doc = snap else { completion(false); return }
            lastTuneDataVersion = doc.get("tuneDataVersion") as? String
            lastZodiacDataVersion = doc.get("zodiacDataVersion") as? String
            completion(true)
        }
    }
    /// <#Description#>
    func updateServerUserZodiacDataVersion(aiachy aiachyState: AiachyState) {
        checkLastExecutiveDataVersion { [self] isChecked in
            guard isChecked else { return }
            /// value
            let user = aiachyState.user
            let lastVersionZodiacData: [String: Any] = [
                "aiachyInfo": [
                    "version": aiachyState.user.aiachyInfo.version,
                    "language": aiachyState.user.aiachyInfo.language,
                    "languageIdentifier": aiachyState.user.aiachyInfo.languageIdentifier,
                    "theme": user.aiachyInfo.wrappedTheme,
                    "zodiacDataVersion": lastZodiacDataVersion,
                    "tuneDataVersion": user.aiachyInfo.aiachyDataInfo.wrappedZodiacDataVersion
                ]
            ]
            let userID: String = user.userInfo.wrappedId
            /// firestore process
            firestore.collection(ACY_USERS_COLLECTION).document(userID).setData(lastVersionZodiacData, merge: true)
        }
    }
    /// <#Description#>
    func updateServerUserTuneDataVersion(aiachy aiachyState: AiachyState) {
        checkLastExecutiveDataVersion { [self] isChecked in
            guard isChecked else { return }
            /// value
            let user = aiachyState.user
            let lastVersionTuneData: [String: Any] = [
                "aiachyInfo": [
                    "version": aiachyState.user.aiachyInfo.version,
                    "language": aiachyState.user.aiachyInfo.language,
                    "languageIdentifier": aiachyState.user.aiachyInfo.languageIdentifier,
                    "theme": user.aiachyInfo.theme,
                    "zodiacDataVersion": user.aiachyInfo.aiachyDataInfo.wrappedZodiacDataVersion,
                    "tuneDataVersion": lastTuneDataVersion
                ]
            ]
            let userID: String = user.userInfo.wrappedId
            /// firestore process
            firestore.collection(ACY_USERS_COLLECTION).document(userID).updateData(lastVersionTuneData)
        }
    }
}
