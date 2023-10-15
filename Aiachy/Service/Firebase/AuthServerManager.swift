//
//  AuthServerManager.swift
//  Aiachy
//
//  Created by Mert Türedü on 15.05.2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth
//MARK: AuthServerManager - protocol - HandlerProtocol -
private protocol HandlerProtocol {
    func makeUserFrom(document: DocumentSnapshot) -> User
}
//MARK: AuthServerManager - protocol - AuthServerProtocol -
private protocol AuthServerProtocol {
    func createUser(user: User)
    func fetchUserWithId(id: String, completion: @escaping (Result<User,ACYErrorDataFetching>) -> () )
    func checkLoginWithEmail(userLogin userLoginInfo: UserLoginInfo, completion: @escaping (Result<User, ACYErrorDataFetching>) -> Void)
    
}
//MARK: AuthServerManager - protocol - ControlServerProtocol -
private protocol ControlServerProtocol {
    func controlUserInformationOnServer(dataField: String, whereField: String, userInformation: String, completion: @escaping (Bool) -> Void)
}
//MARK: AuthServerManager - protocol - UpdateServerProtocol -
private protocol UpdateServerProtocol {
    
}
//MARK: AuthServerManager - Manager -
class AuthServerManager {
    
    private let firestore = Firestore.firestore()
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    init(){ }
}
//MARK: AuthServerManager - extension - HandlerProtocol -
extension AuthServerManager: HandlerProtocol {
    // Helper function to convert Firestore document to User
    func makeUserFrom(document: DocumentSnapshot) -> User {
        
        guard let data = try? JSONSerialization.data(withJSONObject: document.data()!, options: []),
              let user = try? JSONDecoder().decode(User.self, from: data) else { return User()}
        return user
    }
}
//MARK: AuthServerManager - extension - AuthServerProtocol -
extension AuthServerManager: AuthServerProtocol {
    /// Creates a new user.
    /// - Parameter user: It is for uploading the values saved in the registration process to the server.
    func createUser(user: User) {
        guard let checkedID = user.userInfo.id else { return }
        do {
            let data = try encoder.encode(user)
            let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            
            firestore.collection(ACY_USERS_COLLECTION).document(checkedID).setData(dictionary!)
        } catch {
            print(ACYErrorUserInfo.userCantCreateUser.printUserInfo("AuthServerManager"))
        }
    }
    /// With the ID, the user's data is retrieved and the User formation is converted.
    /// - Parameters:
    ///   - id: The id saved by the cache will be written here.
    ///   - completion: Allows conversion to User formation or getting error.
    func fetchUserWithId(id: String, completion: @escaping (Result<User,ACYErrorDataFetching>) -> () ) {
        firestore.collection(ACY_USERS_COLLECTION).document(id).getDocument { [weak self] snap, error in
            ///error
            if error != nil {
                completion(.failure(ACYErrorDataFetching.notWorkingServer))
                print(ACYErrorDataFetching.notWorkingServer.printDataFetching("AuthServerManager"))
            }
            //TODO: 2323
            ///doc controlled
            guard let doc = snap else { completion(.failure(ACYErrorDataFetching.notWorkingServer)); return }
            guard doc.documentID == id else {completion(.failure(ACYErrorDataFetching.cantFetchUser)); return }
            /// decode
            let jsonUserData = try! JSONSerialization.data(withJSONObject: doc.data()!,options: .prettyPrinted)
            let decodedUser = try! self!.decoder.decode(User.self, from: jsonUserData)
            completion(.success(decodedUser))
        }
    }
    /// To login by mail.
    /// - Parameters:
    ///   - userLoginInfo: To query the user's mail and password on the server.
    ///   - completionHandler: True if user found else false.
    func checkLoginWithEmail(userLogin userLoginInfo: UserLoginInfo, completion: @escaping (Result<User, ACYErrorDataFetching>) -> Void) {
        let email = userLoginInfo.wrappedEmail
        let password = userLoginInfo.wrappedPassowrd
        
        firestore.collection(ACY_USERS_COLLECTION).getDocuments { snap, error in
            /// error
            if error != nil { completion(.failure(.notWorkingServer)); return }
            /// checking server
            guard let docs = snap?.documents else { completion(.failure(.notWorkingServer)); return }
            /// doc
            for doc in docs {
                /// values
                let docData = doc.data()
                let userLoginData = docData["userLoginInfo"] as! [String: Any]
                let emailValue = userLoginData["email"] as? String ?? ""
                let passwordValue = userLoginData["password"] as? String ?? ""
                /// guard check
                guard emailValue == email else {completion(.failure(.notFoundUser)); return }
                guard passwordValue == password else { completion(.failure(.cantFetchUser)); return }
                
                let user = self.makeUserFrom(document: doc)
                completion(.success(user))
                
            }
            
        }
    }
}
//MARK: AuthServerManager - extension - ControlServerProtocol -
extension AuthServerManager: ControlServerProtocol {
    /// To get the desired user value.
    /// - Parameters:
    ///   - dataField: The parent name of the value.
    ///   - whereField: The value itself.
    ///   - userInformation: The value to compare.
    ///   - completion: It will return true if the value is found, false otherwise.
    func controlUserInformationOnServer(dataField: String, whereField: String, userInformation: String, completion: @escaping (Bool) -> Void) {
        firestore.collection(ACY_USERS_COLLECTION).getDocuments { snap, error in
            /// error
            if error != nil { print(ACYErrorDataFetching.notWorkingServer.printDataFetching("AuthServerManager")); completion(false) }
            /// cheking snap
            guard let docs = snap?.documents else { return }
            /// for doc
            for doc in docs {
                
                let docData = doc.data()
                let dataFieldValue = docData[dataField] as? [String: Any]
                guard let checkedDataField = dataFieldValue else { continue }
                let whereFieldValue = checkedDataField[whereField] as? String ?? ""
                if whereFieldValue == userInformation {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}
//MARK: AuthServerManager - extension - UpdateServerProtocol -
extension AuthServerManager: UpdateServerProtocol {
    
    func updateUserInformationOnServer(aiachy aiachyState: AiachyState, data: [String: Any]) {
        let userId = aiachyState.user.userInfo.wrappedId
                
        firestore.collection(ACY_USERS_COLLECTION).document(userId).updateData(data)
    }
}
