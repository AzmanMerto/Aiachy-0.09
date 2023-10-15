//
//  ACYAlertView.swift
//  Aiachy
//
//  Created by Mert Türedü on 20.05.2023.
//

import SwiftUI

struct ACYAlertView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var alertTitle: ACYTextHelper.ACYAppText.ACYappAlertMassageText
    @State var alertImage: ImageHelper.ACYAppImage.ACYalertImage?
    @State var isNeedImage: Bool
    @State var isNeedSecondButton: Bool
    @State var alertFirstButtonText: ACYTextHelper.ACYAppText.ACYappButtonText
    @State var secondButtonText: (ACYTextHelper.ACYAppText.ACYappButtonText)? = nil
    var firstButtonAction: () -> ()
    var secondButtonAction: (() -> ())? = nil
    
    var body: some View {
        ZStack {
            //MARK: ACYAlert - Blurbackground
            Color.AiachyColor(aiachyState,
                              aiachyColor: .backgroundBlurColor)
            .ignoresSafeArea()
            Group{
                if isNeedImage == false  {
                    titleButtonView
                } else if isNeedImage == true && isNeedSecondButton == false {
                    titleImageButtonView
                } else if isNeedImage == true && isNeedSecondButton == true {
                    titleImageTwoButtonView
                }
            }
            .background {
                alertViewBackground
            }
        }
        .makeAccessibilitysForUITest(identifier: "ACYAlertViewID")
    }
}

struct alertView_Previews: PreviewProvider {

    static let aiachyState = ACY_PREVIEWS_STATE

    static var previews: some View {
        ZStack(content: {
            AuthBackground()
            //titleButtonView
//            ACYAlertView(alertTitle: .notUserHaveConnection, firstButtonText: .TryAgainButton, firstButtonAction: {})
            //titleImageButtonView
            //titleImageButtonView
//            ACYAlertView(alertTitle: .notUserHaveConnection,
//                         alertImage: .notUserHaveConnection,
//                         isNeedImage: true,
//                         firstButtonText: .TryAgainButton) { }
            //titleImageTwoButtonView
            ACYAlertView(alertTitle: .notUserHaveConnection,
                         alertImage: .notUserHaveConnection,
                         isNeedImage: true,
                         isNeedSecondButton: true,
                         alertFirstButtonText: .TryAgainButton,
                         secondButtonText: .ContinueButton) { } secondButtonAction: {}

        })
            .environmentObject(aiachyState)
    }
}

extension ACYAlertView {
    
    var titleButtonView: some View {
        VStack {
            Spacer()
            alertTitleView
            Spacer()
            alertFirstButtonView
            Spacer()
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MED_SIZE))
    }
    
    var titleImageButtonView: some View {
        VStack(spacing: 20) {
            alertTitleView
            alertImageView
            alertFirstButtonView
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MED_SIZE))
    }
    
    var titleImageTwoButtonView: some View {
        VStack {
            alertTitleView
            alertImageView
            HStack(spacing: 10) {
                alertFirstButtonView
                alertSecondButtonView
            }
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MED_SIZE))
    }
    
}

extension ACYAlertView {
    
    @ViewBuilder
    private var alertTitleView: some View {
        //MARK: ACYAlert - Title
        Text(alertTitle.rawValue.locale())
            .padding(.horizontal)
            .font(.aiachyFont(.cinzelBold14))
            .multilineTextAlignment(.center)

    }
    //MARK: ACYAlert - first Button
    private var alertFirstButtonView: some View {
        ACYMinorButton(text: alertFirstButtonText.rawValue) {
            firstButtonAction()
        }
    }
    //MARK: ACYAlert - second Button
    private var alertSecondButtonView: some View {
        ACYMinorButton(text: secondButtonText!.rawValue) {
            secondButtonAction!()
        }
    }
    //MARK: ACYAlert - image
    private var alertImageView: some View {
        Image.setACYAlertImage(aiachyState, alert: alertImage!)
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: ACY_LNG_SIZE), height: ACYdh(aiachyState, d: 0.1))
            .padding(.vertical)
    }
    //MARK: ACYAlert - Alert View background
    private var alertViewBackground: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(Color.AiachyColor(aiachyState,
                                      aiachyColor: .secondColor),lineWidth: 1)
            .background {
                Color.AiachyColor(aiachyState, aiachyColor: .backgroundColor)
                    .padding(.all,1)
                    .cornerRadius(15)
            }
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
                   height: ACYdh(aiachyState, d: ACY_MED_SIZE))
    }
}
