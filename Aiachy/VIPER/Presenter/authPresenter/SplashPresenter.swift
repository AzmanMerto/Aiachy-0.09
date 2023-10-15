//
//  SplashPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 14.05.2023.
//

import SwiftUI
import Combine
//MARK: - SplashPresenter - protocol - HandlerProtocol -
private protocol HandlerProtocol {
    func setterCompletion(color colorScheme: ColorScheme)
    func setAiachyTheme(color colorScheme: ColorScheme)
    func setIdFromCache()
    func setDeviceInfo()
}
//MARK: - SplashPresenter - protocol - StoreProtocol -
private protocol StoreProtocol {
    
}
//MARK: - SplashPresenter - protocol - PrintProtocol -
private protocol PrintProtocol {
    func makePrintCompletion()
    func makeDeviceInfoPrint()
    func makeUserInfoPrint()
}
//MARK: SplashPresenter - Presenter
class SplashPresenter: ObservableObject {
        
    @Published var acyAlertEntity = ACYAlertEntity()
    @Published var isCurrentUser: Bool
    @Published var isNewUser: Bool
    @Published var cycleErrorCount: Int
    private let aiachyState: AiachyState
    private let interactor: SplashInteractor
    private var cancellable: AnyCancellable?
    
    init(isCurrentUser: Bool = false,
         isNewUser: Bool = false ,
         cycleErrorCount: Int = 0,
         aiachy aiachyState: AiachyState,
         interactor: SplashInteractor = SplashInteractor())
    {
        self.isCurrentUser = isCurrentUser
        self.isNewUser = isNewUser
        self.cycleErrorCount = cycleErrorCount
        self.aiachyState = aiachyState
        self.interactor = interactor
        
        interactor.fetchProducts(aiachy: aiachyState)
        checkUserSubscription()
    }
    /// The user is downloading the data, the user is to find out if it is new or old, and CoreData is for uploading the data.
    /// - Parameters:
    ///   - colorScheme: We want learn colorScheme for change theme.
    ///   - aiachyState: We update aiachyState.
    func startApp(colorScheme: ColorScheme) {
        
        guard isCurrentUser == false, isNewUser == false else { return }
        
        interactor.checkNetwork { [self] isCheckedNetwork in
            setterCompletion(color: colorScheme)
            self.interactor.controlUser(aiachy: aiachyState) { [self] result in
                if result {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                        self.isCurrentUser = true
                    }
                    self.makePrintCompletion()
                } else {
                    handeledError(colorScheme: colorScheme)
                }
            }
        }
    }
    /// help to startApp function
    func handeledError(colorScheme: ColorScheme) {
        
        cancellable = interactor.isHaveError
            .removeDuplicates()
            .subscribe(on: DispatchQueue.main)
            .sink(receiveValue: { [self] errorType in
                print("Received error type: \(errorType)")
                guard errorType != 0 else {
                    acyAlertEntity.title = .notUserHaveConnection
                    acyAlertEntity.image = .notUserHaveConnection
                    acyAlertEntity.firstButtonText = .tryAgain
                    acyAlertEntity.levelError = 0
                    acyAlertEntity.isShowingAlert = true
                    return
                }
                guard errorType != 1 else {
                    isNewUser = true
                    self.makePrintCompletion()
                    return
                }
                guard errorType != 2 else {
                    if cycleErrorCount < 5 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + ACY_MAX_TIME) {
                            self.startApp(colorScheme: colorScheme)
                            self.cycleErrorCount += 1
                        }
                    } else {
                        acyAlertEntity.title = .appError
                        acyAlertEntity.firstButtonText = .tryAgain
                        acyAlertEntity.levelError = 1
                        acyAlertEntity.isShowingAlert = true
                    }
                    return
                }
                guard errorType != 3 else {
                    isNewUser = true
                    self.makePrintCompletion()
                    return
                }
            })
    }
    
    func definitionErrorAction(colorScheme: ColorScheme) {
        let alert = acyAlertEntity.levelError
        
        if alert == 0 {
            acyAlertEntity.isShowingAlert = false
            interactor.cancelNetwork()
            DispatchQueue.main.asyncAfter(deadline: .now() + ACY_MED_TIME) { [self] in
                startApp(colorScheme: colorScheme)
                
            }
        } else if alert == 1 {
            acyAlertEntity.isShowingAlert = false
            DispatchQueue.main.asyncAfter(deadline: .now() + ACY_LRG_TIME) {
                self.startApp(colorScheme: colorScheme)
            }
        }
    }
}
//MARK: - SplashPresenter - HandlerProtocol -
extension SplashPresenter: HandlerProtocol {
    /// All set functions run event.
    /// - Parameters:
    ///   - colorScheme: To determine the application theme.
    ///   - aiachyState: aiachy state values will be updated
    fileprivate func setterCompletion(color colorScheme: ColorScheme) {
        setAiachyTheme(color: colorScheme)
        setDeviceInfo()
        setIdFromCache()
        setLangauge()
    }
    /// Without the user choosing any theme, we get the information about which theme the phone is in and assign it to the themeString.
    /// - Parameters:
    ///   - colorScheme: To get colorScheme
    ///   - aiachyState: To be able to set to currentTheme
    fileprivate func setAiachyTheme(color colorScheme: ColorScheme) {
        
        guard aiachyState.user.aiachyInfo.theme == nil else { return }
        
        if colorScheme == .dark {
            aiachyState.user.aiachyInfo.theme = "Dark"
        } else {
            aiachyState.user.aiachyInfo.theme = "Light"
        }
        ACYUserDefaults.set(aiachyState.user.aiachyInfo.theme, forKey: ACYThemeKey)
        
    }
    /// We learn everything about the user's phone.
    /// - Parameter aiachy: phone current state
    /// - Returns: The getDeviceInfo method indicates that it is working and that it has received device information.
    fileprivate func setDeviceInfo() {
        aiachyState.user.deviceInfo.phoneHeight = ACY_UI_HEIGHT_SIZE
        aiachyState.user.deviceInfo.phoneWidth = ACY_UI_WIDTH_SIZE
        aiachyState.user.deviceInfo.phoneModel = UIDevice.current.model
        aiachyState.user.deviceInfo.phoneLanguage = Locale.current.identifier
        aiachyState.user.deviceInfo.phoneVersion = UIDevice.current.systemVersion
        aiachyState.user.deviceInfo.phoneSystem = UIDevice.current.systemName
    }
    /// The purpose of this function is to get the id from the cache and allow us to call it.
    /// - Returns: It returns id as return
    fileprivate func setIdFromCache() {
        let cachedId = ACYUserDefaults.string(forKey: ACYUserID)
        guard cachedId != nil, cachedId != "" else {
            print(ACYErrorUserInfo.userIdNotFound.printUserInfo("SplashPresenter"))
            return }
        aiachyState.user.userInfo.id = cachedId
    }
    fileprivate func setLangauge() {
        let userID = aiachyState.user.userInfo.id
        guard userID == nil else { return }
        aiachyState.user.aiachyInfo.language = String(Locale.current.identifier.suffix(2))
        aiachyState.user.aiachyInfo.languageIdentifier = String(Locale.current.identifier)
    }
}
//MARK: - SplashPresenter - StoreProtocol -
extension SplashPresenter: StoreProtocol {
    func checkUserSubscription() {
        interactor.fetchProducts(aiachy: aiachyState)
    }
}
//MARK: - SplashPresenter - extension - PrintProtocol -
extension SplashPresenter: PrintProtocol {
    /// All the print functions are gathered in one place.
    /// - Parameter aiachyState: To collect data.
    fileprivate func makePrintCompletion() {
        makeDeviceInfoPrint()
        makeUserInfoPrint()
    }
    /// This func checking Aiachystate current Device printing
    /// - Parameter aiachy: AiachyState, This means the user is where we store all the data.
    fileprivate func makeDeviceInfoPrint() {
        print("------ Aiachy Current Device Informations ------")
        
        print(ACYPrintUserDeviceInfo.phoneWidth.printDeviceInfo(aiachyState))
        print(ACYPrintUserDeviceInfo.phoneHeight.printDeviceInfo(aiachyState))
        print(ACYPrintUserDeviceInfo.phoneModel.printDeviceInfo(aiachyState))
        print(ACYPrintUserDeviceInfo.phoneLanguage.printDeviceInfo(aiachyState))
        print(ACYPrintUserDeviceInfo.phoneSystem.printDeviceInfo(aiachyState))
        print(ACYPrintUserDeviceInfo.phoneVersion.printDeviceInfo(aiachyState))
    }
    /// This func checking Aiachystate current User Info printing
    /// - Parameter aiachy: AiachyState, This means the user is where we store all the data.
    fileprivate func makeUserInfoPrint() {
        let infoUser = aiachyState.user.userInfo
        guard !infoUser.wrappedId.isEmpty else {
            print("------ Aiachy New Account ------")
            return
        }
        
        print("------ Aiachy Current Account Informations ------")
        print(ACYPrintUserInfoWithLogin.id.printUserInfo(aiachyState))
        print(ACYPrintUserInfoWithLogin.fullName.printUserInfo(aiachyState))
        print(ACYPrintUserInfoWithLogin.birthDay.printUserInfo(aiachyState))
        print(ACYPrintUserInfoWithLogin.location.printUserInfo(aiachyState))
    }
}
