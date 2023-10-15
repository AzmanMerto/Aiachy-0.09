//
//  ACYAlertView.swift
//  Aiachy
//
//  Created by Mert Türedü on 20.05.2023.
//

import SwiftUI

struct ACYAlertView: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var acyAlertEntity: ACYAlertEntity
    
    var body: some View {
        ZStack {            
            //MARK: ACYAlert - Blurbackground
            Color.makeAiachyColor(aiachyState,
                              aiachyColor: .backgroundBlurColor)
            .ignoresSafeArea(.all, edges: .all)
            Group{
                if acyAlertEntity.typeError == 0 {
                    titleButtonView
                } else if acyAlertEntity.typeError == 1 {
                    titleTwoButtonView
                } else if acyAlertEntity.typeError == 2 {
                    titleImageButtonView
                } else if acyAlertEntity.typeError == 3 {
                    titleImageTwoButtonView
                } else if acyAlertEntity.typeError == 4 {
                    descriptionImageButtonView
                }
            }
            .background {
                background
            }
            .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
                   height: ACYdh(aiachyState, d: ACY_MED_SIZE))
        }
        .makeAccessibilitysForUITest(identifier: "ACYAlertViewID")
    }
}
// WillAdded:
/*
#Preview("AlertView") {
    ACYAlertView(acyAlertEntity: ACYAlertEntity(description: .notReady, image: .notReady, firstButtonText: .okey, isShowingAlert: true, typeError: 4, firstAction: {
        
    }, secondAction: {
        
    }))
        .environmentObject(ACY_PREVIEWS_STATE)
}
*/
extension ACYAlertView {
    
    var titleButtonView: some View {
        VStack {
            Spacer()
            title
            Spacer()
            firstButton
            Spacer()
        }
      
    }
    
    var titleTwoButtonView: some View {
        VStack(spacing: 40) {
            title
            HStack(spacing: 10) {
                firstButton
                secondButton
            }
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MED_SIZE))
    }
    
    var titleImageButtonView: some View {
        VStack(spacing: 20) {
            title
            image
            firstButton
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MED_SIZE))
    }
    
    var titleImageTwoButtonView: some View {
        VStack {
            title
            image
            HStack(spacing: 10) {
                firstButton
                secondButton
            }
        }
        .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
               height: ACYdh(aiachyState, d: ACY_MED_SIZE))
    }
    
    var descriptionImageButtonView: some View {
        VStack {
            description
            image
            firstButton
        }
    }
    
}

extension ACYAlertView {
    
    @ViewBuilder
    //MARK: ACYAlertView - Title
    private var title: some View {
        Text(TextHandler.makeAlertString(aiachy: aiachyState, alert: acyAlertEntity.title!))
            .padding(.horizontal)
            .font(.aiachyFont(.cinzelBold14))
            .multilineTextAlignment(.center)

    }
    //MARK: ACYAlertView - description
    private var description: some View {
        Text(TextHandler.makeAlertString(aiachy: aiachyState,
                                         alert: acyAlertEntity.description!))
        .padding(.horizontal)
        .font(.aiachyFont(.roundedMedium16))
        .multilineTextAlignment(.center)
    }
    //MARK: ACYAlertView - first Button
    private var firstButton: some View {
        ACYMinorButton(text: acyAlertEntity.firstButtonText!) 
        {   acyAlertEntity.firstAction!()   }
    }
    //MARK: ACYAlertView - second Button
    private var secondButton: some View {
        ACYMinorButton(text: acyAlertEntity.secondButtonText!)
        {   acyAlertEntity.secondAction!()  }
    }
    //MARK: ACYAlertView - image
    private var image: some View {
        Image(ImageHandler.makeAlertString(aiachyState,
                                           alert: acyAlertEntity.image!))
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: ACY_LNG_SIZE), height: ACYdh(aiachyState, d: 0.15))
            .padding(.vertical)
    }
    //MARK: ACYAlertView - Alert View background
    private var background: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(Color.makeAiachyColor(aiachyState,
                                      aiachyColor: .secondColor),lineWidth: 1)
            .background {
                Color.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)
                    .padding(.all,1)
                    .cornerRadius(15)
            }
            .frame(width: ACYdw(aiachyState, d: ACY_MAX_SIZE),
                   height: ACYdh(aiachyState, d: ACY_MED_SIZE))
            .scaledToFit()
    }
}
