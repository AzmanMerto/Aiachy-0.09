//
//  SplashPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 14.05.2023.
//

import SwiftUI
import Combine
//MARK: SplashPresenter - protocol - SplashPresenterSetterProtocol
private protocol SplashPresenterSetterProtocol {
    func setterCompletion(color colorScheme: ColorScheme, aiachy aiachyState: AiachyState)
    func setAiachyTheme(color colorScheme: ColorScheme, aiachy aiachyState: AiachyState)
    func setIdFromCache(aiachy aiachyState: AiachyState)
    func setDeviceInfo(aiachy aiachyState: AiachyState)
}
//MARK: SplashPresenter - protocol - SplashPresenterPrintProtocol
private protocol SplashPresenterPrintProtocol {
    func makePrintCompletion(aiachy aiachyState: AiachyState)
    func makeDeviceInfoPrint(aiachy aiachyState: AiachyState)
    func makeUserInfoPrint(aiachy aiachyState: AiachyState)
}
//MARK: SplashPresenter - Presenter
class SplashPresenter: ObservableObject {
    
    @Published var alertTitle: ACYTextHelper.ACYAppText.ACYappAlertMassageText?
    @Published var alertImage: ImageHelper.ACYAppImage.ACYalertImage?
    @Published var alertFirstButtonText: ACYTextHelper.ACYAppText.ACYappButtonText?
    @Published var isNeedImage: Bool?
    @Published var isShowingACYAlert: Bool?
    @Published var alertLevel: Int?
    
    @Published var isCurrentUser: Bool
    @Published var isNewUser: Bool
    @Published var cycleErrorCount: Int
    let indicator: SplashInteractor
    var cancellable: AnyCancellable?
    
    init(isCurrentUser: Bool = false,
         isNewUser: Bool = false ,
         cycleErrorCount: Int = 0,
         indicator: SplashInteractor = SplashInteractor())
    {
        
        self.isCurrentUser = isCurrentUser
        self.isNewUser = isNewUser
        self.cycleErrorCount = cycleErrorCount
        self.indicator = indicator
    }
    /// The user is downloading the data, the user is to find out if it is new or old, and CoreData is for uploading the data.
    /// - Parameters:
    ///   - colorScheme: We want learn colorScheme for change theme.
    ///   - aiachyState: We update aiachyState.
    func startApp(colorScheme: ColorScheme,aiachy aiachyState: AiachyState) {
        indicator.checkNetwork { [self] isCheckedNetwork in

            setterCompletion(color: colorScheme, aiachy: aiachyState)
            
            self.indicator.controlSplashProcess(aiachy: aiachyState) { [self] result in
                if result {
                    isCurrentUser = true
                    self.makePrintCompletion(aiachy: aiachyState)
                } else {
                    handeledError(colorScheme: colorScheme, aiachy: aiachyState)
                }
            }
        }
    }
    /// help to startApp function
    func handeledError(colorScheme: ColorScheme,aiachy aiachyState: AiachyState) {
        
        cancellable = indicator.isHaveError
            .removeDuplicates()
            .subscribe(on: DispatchQueue.main)
            .sink(receiveValue: { [self] errorType in
                print("Received error type: \(errorType)")
                guard errorType != 0 else {
                    alertTitle = .notUserHaveConnection
                    alertImage = .notUserHaveConnection
                    alertFirstButtonText = .TryAgainButton
                    isNeedImage = true
                    alertLevel = 0
                    isShowingACYAlert = true
                    return
                }
                guard errorType != 1 else {
                    isNewUser = true
                    self.makePrintCompletion(aiachy: aiachyState)
                    return
                }
                guard errorType != 2 else {
                    if cycleErrorCount < 5 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + ACY_MAX_TIME) {
                            self.startApp(colorScheme: colorScheme, aiachy: aiachyState)
                            self.cycleErrorCount += 1
                        }
                    } else {
                        alertTitle = .appError
                        alertFirstButtonText = .TryAgainButton
                        isNeedImage = false
                        alertLevel = 1
                        isShowingACYAlert = true
                    }
                    return
                }
                guard errorType != 3 else {
                    isNewUser = true
                    self.makePrintCompletion(aiachy: aiachyState)
                    return
                }
            })
    }
    
    func definitionErrorAction(colorScheme: ColorScheme, aiachy aiachyState: AiachyState) {
        let alert = alertLevel
        
        if alert == 0 {
            isShowingACYAlert = false
            indicator.cancelNetwork()
            DispatchQueue.main.asyncAfter(deadline: .now() + ACY_MED_TIME) { [self] in
                startApp(colorScheme: colorScheme, aiachy: aiachyState)
                
            }
        } else if alert == 1 {
            isShowingACYAlert = false
            DispatchQueue.main.asyncAfter(deadline: .now() + ACY_LRG_TIME) {
                self.startApp(colorScheme: colorScheme, aiachy: aiachyState)
            }
        }
    }
}
//MARK: SplashPresenter - SplashPresenterSetterProtocol
extension SplashPresenter: SplashPresenterSetterProtocol {
    /// All set functions run event.
    /// - Parameters:
    ///   - colorScheme: To determine the application theme.
    ///   - aiachyState: aiachy state values will be updated
    fileprivate func setterCompletion(color colorScheme: ColorScheme, aiachy aiachyState: AiachyState) {
        
        setAiachyTheme(color: colorScheme, aiachy: aiachyState)
        setDeviceInfo(aiachy: aiachyState)
        setIdFromCache(aiachy: aiachyState)
        
    }
    /// Without the user choosing any theme, we get the information about which theme the phone is in and assign it to the themeString.
    /// - Parameters:
    ///   - colorScheme: To get colorScheme
    ///   - aiachyState: To be able to set to currentTheme
    fileprivate func setAiachyTheme(color colorScheme: ColorScheme, aiachy aiachyState: AiachyState) {
        
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
    fileprivate func setDeviceInfo(aiachy aiachyState: AiachyState) {
        aiachyState.user.deviceInfo.phoneHeight = ACY_UI_HEIGHT_SIZE
        aiachyState.user.deviceInfo.phoneWidth = ACY_UI_WIDTH_SIZE
        aiachyState.user.deviceInfo.phoneModel = UIDevice.current.model
        aiachyState.user.deviceInfo.phoneLanguage = Locale.current.identifier
        aiachyState.user.deviceInfo.phoneVersion = UIDevice.current.systemVersion
        aiachyState.user.deviceInfo.phoneSystem = UIDevice.current.systemName
    }
    /// The purpose of this function is to get the id from the cache and allow us to call it.
    /// - Returns: It returns id as return
    fileprivate func setIdFromCache(aiachy aiachyState: AiachyState) {
        let cachedId = ACYUserDefaults.string(forKey: ACYUserID)
        guard cachedId != nil, cachedId == "" else {
            print(ACYErrorUserInfo.userIdNotFound.printUserInfo("SplashPresenter"))
            return }
        aiachyState.user.userInfo.id = cachedId
    }
}
//MARK: SplashPresenter - extension - SplashPresenterPrintProtocol
extension SplashPresenter: SplashPresenterPrintProtocol {
    /// All the print functions are gathered in one place.
    /// - Parameter aiachyState: To collect data.
    fileprivate func makePrintCompletion(aiachy aiachyState: AiachyState) {
        makeDeviceInfoPrint(aiachy: aiachyState)
        makeUserInfoPrint(aiachy: aiachyState)
    }
    /// This func checking Aiachystate current Device printing
    /// - Parameter aiachy: AiachyState, This means the user is where we store all the data.
    fileprivate func makeDeviceInfoPrint(aiachy aiachyState: AiachyState) {
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
    fileprivate func makeUserInfoPrint(aiachy aiachyState: AiachyState) {
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
