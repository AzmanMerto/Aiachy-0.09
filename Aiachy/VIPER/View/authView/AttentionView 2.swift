//
//  AttentionView.swift
//  Aiachy
//
//  Created by Mert Türedü on 19.07.2023.
//

import SwiftUI

struct AttentionView: View {

    @EnvironmentObject var aiachyState: AiachyState
    @ObservedObject var presenter = AttentionPresenter()
    let router: AuthRouterPresenter
    
    var body: some View {
        VStack(spacing: 20) {
            //MARK: AttentionView - Image
            attentionImage
            VStack(spacing: 20) {
                //MARK: AttentionView - Title And Description
                titleAndDescription
                //MARK: AttentionView - Twitter
                twitterDescription
            }
            .padding(.vertical)
            //MARK: AttentionView - Button
            button
        }
        .overlay {
            if presenter.isShowingACYAlert {
                ACYAlertView(alertTitle: presenter.alertTitle!,
                             alertImage: presenter.alertImage!,
                             isNeedImage: true,
                             isNeedSecondButton: false,
                             alertFirstButtonText: presenter.alertFirstButtonText!) {
                }
            }
        }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "AttentionViewID")
    }
}

struct AttentionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AuthBackground()
            AttentionView(router: AuthRouterPresenter())
        }
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}


extension AttentionView {
    //MARK: AttentionView - Image
    private var attentionImage: some View {
        Image.setACYAuthCompletion(aiachyState, auth: .attention)
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.8))
            .padding(.bottom)
    }
    //MARK: AttentionView - Title And Description
    private var titleAndDescription: some View {
        VStack(spacing: 20) {
            Text(ACYTextHelper.ACYAuthText.ACYauthTitleText.AttentionViewTitle.rawValue.locale())
                .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .firstColor))
                .font(.aiachyFont(.cinzelBlack20))
            
            Text(ACYTextHelper.ACYAuthText.ACYauthDescriptionText.AttentionViewDescription.rawValue.locale())
                .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .firstColor))
                .font(.aiachyFont(.oldBold14))
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
    //MARK: AttentionView - Twitter
    private var twitterDescription: some View {
        Text(ACYTextHelper.ACYAuthText.ACYauthDescriptionText.AttentionViewDescriptionLink.rawValue.locale())
            .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .secondColor))
            .font(.aiachyFont(.roundedBold16))
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .onTapGesture {
                presenter.openAppTwitter()
            }
    }
    //MARK: AttentionView - Button
    private var button: some View {
        ACYButton(text: ACYTextHelper.ACYAppText.ACYappButtonText.ContinueButton.rawValue) {
            presenter.makeReadyToApp(aiachy: aiachyState) {
                guard $0 else { return }
                router.isUserComplateAuthCompletion = true
                
            }
        }
        .disabledOpacited(bool: presenter.isReadyForApp, disabledOpacity: 0.4)
    }
}
