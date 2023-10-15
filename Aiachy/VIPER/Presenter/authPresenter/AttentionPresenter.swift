//
//  AttentionPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import UIKit
import Combine

private protocol AttentionPresenterAlertProtocol {
    
}

//MARK: AttentionPresenter - Presenter
class AttentionPresenter: ObservableObject {
    
    @Published var acyAlertEntity = ACYAlertEntity()
    @Published var isReadyForApp: Bool
    private let interactor: AttentionInteractor
    private let url = URL(string: "https://twitter.com/AiachyApp")

    init(isReadyForApp: Bool = false,
         interactor: AttentionInteractor = AttentionInteractor()) {
        self.interactor = AttentionInteractor()
        self.isReadyForApp = isReadyForApp
    }
    /// It shows that it is ready by completing all the values and prepares the application usage.
    /// - Parameters:
    ///   - aiachyState: Here we get the values to be saved.
    ///   - completion: If true, not ready to apply, not ready.
    func makeReadyToApp(aiachy aiachyState: AiachyState,completion: @escaping (Bool) -> ()) {
        interactor.makeUser(aiachy: aiachyState) { [self] in
            guard !$0 else {
                    self.isReadyForApp = true
                    completion(true)
                return
            }
            makeAlert()
            completion(false)
        }
    }
    /// This func will open twitter
    func openAppTwitter() {
        guard url != nil else { return }
        UIApplication.shared.open(url!)
    }
}
//NextPatchTODO: make again
extension AttentionPresenter: AttentionPresenterAlertProtocol {
    
    fileprivate func makeAlert() {
        acyAlertEntity.title = .notUserHaveConnection
        acyAlertEntity.image = .notUserHaveConnection
        acyAlertEntity.firstButtonText = .tryAgain
        acyAlertEntity.typeError = 2
        acyAlertEntity.levelError = 0
        acyAlertEntity.isShowingAlert = true
        acyAlertEntity.firstAction = {
            self.makeTryAgain()
        }
    }
    
    fileprivate func makeTryAgain() {
        acyAlertEntity.isShowingAlert = false
    }
}
