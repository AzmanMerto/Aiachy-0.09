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
        ZStack {
            AuthBackground()
            VStack(spacing: 20) {
                //NextPatchTODO: Fix this
                HStack {
                    Spacer()
                }
                //MARK: AttentionView - Attention Image
                attentionImage
                //MARK: AttentionView - Title And Description
                titleAndDescription
                //MARK: AttentionView - Twitter
                twitterDescription
                Spacer()
                //MARK: AttentionView - Continue Button
                continueButton
                Spacer()
            }
        }
        .overlay {
            if presenter.acyAlertEntity.isShowingAlert {
                ACYAlertView(acyAlertEntity: presenter.acyAlertEntity)
            }
        }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "AttentionViewID")
    }
}
//MARK: AttentionView - Preview
#Preview {
    AttentionView(router: AuthRouterPresenter())
        .background(AuthBackground())
        .environmentObject(ACY_PREVIEWS_STATE)
}
//MARK: AttentionView - extension
extension AttentionView {
    //MARK: AttentionView - Image
    private var attentionImage: some View {
        Image(ImageHandler.makeAuthString(aiachyState, 
                                          auth: .attention))
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.8))
            .padding(.bottom)
    }
    //MARK: AttentionView - Title And Description
    private var titleAndDescription: some View {
        VStack(spacing: 20) {
            Text(TextHandler.makeAuthTitleString(aiachy: aiachyState,
                                            title: .attentionTitle))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                                  aiachyColor: .firstColor)))
                .font(FontHandler.aiachyFont(.cinzelBlack20))
            
            Text(TextHandler.makeAuthDescriptionString(aiachy: aiachyState,
                                            description: .attentionDescription))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                                  aiachyColor: .firstColor)))
                .font(FontHandler.aiachyFont(.oldBold14))
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
    //MARK: AttentionView - Twitter
    private var twitterDescription: some View {
        Text(TextHandler.makeAuthDescriptionString(aiachy: aiachyState,
                                             description: .attentionSecondDescription))
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                              aiachyColor: .secondColor)))
            .font(FontHandler.aiachyFont(.roundedBold16))
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .onTapGesture {
                presenter.openAppTwitter()
            }
    }
    //MARK: AttentionView - Continue Button
    private var continueButton: some View {
        ACYButton(text: .continue) {
            presenter.makeReadyToApp(aiachy: aiachyState) {
                guard $0 else { return }
                router.isUserComplateAuthCompletion = true
            }
        }
        .disabledOpacited(bool: presenter.isReadyForApp, disabledOpacity: 0.4)
    }
}
