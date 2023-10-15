//
//  PrivacyPolicyView.swift
//  Aiachy
//
//  Created by Mert Türedü on 20.05.2023.
//

import SwiftUI
//NEXTPatchTODO: change everything
struct PrivacyPolicyView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @ObservedObject var presenter = PrivacyPolicyPresenter()
    let router: AuthRouterPresenter
    
    var body: some View {
        ZStack {
            Image.setACYBackgroundImage(aiachyState, background: .privacyTermsBackground)
                .resizable()
                .scaledToFit()
            VStack {
                HStack {
                    ACYPassButton(isItBackButton: true,
                                  text: ACYTextHelper.ACYAppText.ACYappButtonText.BackButton.rawValue) {
                        router.navigate(to: .onboardingView)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
                VStack {
                    ACYAlternativeButton(text: ACYTextHelper.ACYAuthText.ACYprivacyPolicyText.PrivacyPolicyTitle.rawValue) {
                        presenter.selectedPolicy = .PrivacyPolicy
                    }
                    .padding(.vertical)
                    ACYAlternativeButton(text: ACYTextHelper.ACYAuthText.ACYprivacyPolicyText.TermsConditionsTitle.rawValue) {
                        presenter.selectedPolicy = .TermsConditions
                    }
                }
                .padding(.bottom)
                Spacer()
            }
            .fullScreenCover(item: $presenter.selectedPolicy) { data in
                switch data {
                case .PrivacyPolicy:
                    privacyPolicyTemplate(model: privacyPolicyTemplateModel(title: ACYTextHelper.ACYAuthText.ACYprivacyPolicyText.PrivacyPolicyTitle.rawValue,
                                                                            description: ACYTextHelper.ACYAuthText.ACYprivacyPolicyText.PrivacyPolicyDescrpition.rawValue))
                case .TermsConditions:
                    privacyPolicyTemplate(model: privacyPolicyTemplateModel(title: ACYTextHelper.ACYAuthText.ACYprivacyPolicyText.TermsConditionsTitle.rawValue,
                                                                            description: ACYTextHelper.ACYAuthText.ACYprivacyPolicyText.TermsConditionsDescription.rawValue))
                }
            }
        }
        .environmentObject(aiachyState)
        .makeAccessibilitysForUITest(identifier: "PrivacyPolicyViewID")
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
        
    static var previews: some View {
        ZStack {
            AuthBackground()
            PrivacyPolicyView(router: AuthRouterPresenter())
        }
        .environmentObject(ACY_PREVIEWS_STATE)
    }
}

private struct privacyPolicyTemplate: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    let model: privacyPolicyTemplateModel
    
    var body: some View {
        ZStack {
            Color.AiachyColor(aiachyState, aiachyColor: .backgroundColor)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text(model.title.locale())
                    .font(.aiachyFont(.cinzelBlack20))
                    .padding(.vertical)
                Text(model.description.locale())
                    .font(.aiachyFont(.roundedBold14))
                    .padding(.horizontal)
                Spacer()
            }
            .foregroundColor(.AiachyColor(aiachyState, aiachyColor: .firstColor))
            .multilineTextAlignment(.center)
        }
    }
}

private struct privacyPolicyTemplateModel {
    var title: String
    var description: String
}
