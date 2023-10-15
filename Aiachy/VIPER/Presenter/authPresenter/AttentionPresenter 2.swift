//
//  AttentionPresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import UIKit
import Combine
//MARK: AttentionPresenter - Presenter
class AttentionPresenter: ObservableObject {
    
    @Published var alertTitle: ACYTextHelper.ACYAppText.ACYappAlertMassageText?
    @Published var alertImage: ImageHelper.ACYAppImage.ACYalertImage?
    @Published var alertFirstButtonText: ACYTextHelper.ACYAppText.ACYappButtonText?
    @Published var isShowingACYAlert: Bool
    @Published var isReadyForApp: Bool
    private let interactor: AttentionInteractor
    private let url = URL(string: "https://twitter.com/AiachyApp")

    init(isShowingACYAlert: Bool = false,
        isReadyForApp: Bool = false,
         interactor: AttentionInteractor = AttentionInteractor()) {
        self.interactor = AttentionInteractor()
        self.isShowingACYAlert = isShowingACYAlert
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
            alertTitle = .notUserHaveConnection
            alertImage = .notUserHaveConnection
            alertFirstButtonText = .TryAgainButton
            completion(false)
        }
    }
    /// This func will open twitter
    func openAppTwitter() {
        guard url != nil else { return }
        UIApplication.shared.open(url!)
    }
}
