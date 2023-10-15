//
//  OracleView.swift
//  Aiachy
//
//  Created by Mert Türedü on 22.08.2023.
//

import SwiftUI
//MARK: OracleView - View
struct OracleView: View {
    
    @StateObject var presenter: OraclePresenter
    let aiachyState: AiachyState
    let router: SettingsRouterPresenter
    
    init(aiachy aiachyState: AiachyState,
         router: SettingsRouterPresenter) {
        self._presenter = StateObject(wrappedValue: OraclePresenter(aiachy: aiachyState,
                                                                    router: router))
        self.aiachyState = aiachyState
        self.router = router
    }
    
    var body: some View {
        ZStack {
            HomeBackground()
            VStack {
                //MARK: OracleView - backButton
                backButton
                //MARK: OracleView - oracleSection
                oracleSection
                TabView(selection: $presenter.currentIndex, content:  {
                    oracleZodiac.tag(0)
                    oracleOracle.tag(1)
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
               Spacer()
            }
        }
        .overlay(content: {
            if presenter.acyAlertEntity.isShowingAlert {
                ACYAlertView(acyAlertEntity: presenter.acyAlertEntity)
            }
        })
        .environmentObject(aiachyState)
    }
}
// WillAdded:
/*
//MARK: OracleView - Preview
#Preview {
    OracleView(aiachy: ACY_PREVIEWS_STATE, router: SettingsRouterPresenter())
}
 */
//MARK: OracleView - Extension
extension OracleView {
    //MARK: OracleView - backButton
    private var backButton: some View {
            ZStack{
                ACYViewTitleText(title: TextHandler.makeSettingsString(aiachy: aiachyState,
                                                                       settings: .oracleTitle))
                HStack {
                    ACYPassButton(isItBackButton: true, text: .back) {
                        router.navigate(to: .settings)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.all)
    }
    //MARK: OracleView - oracleSection
    private var oracleSection: some View {
        HStack {
            // zodiac package
            Text(TextHandler.makeSettingsOracleString(aiachy: aiachyState, oracle: .packageZodiacTitle))
                .underline(presenter.currentIndex == 0, color: Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                .onTapGesture {
                    withAnimation(.linear) {
                        presenter.currentIndex = 0
                    }
                }
            // oracle package
            Text(TextHandler.makeSettingsOracleString(aiachy: aiachyState, oracle: .packageOracleTitle))
                .underline(presenter.currentIndex == 1, color: Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                .onTapGesture {
                    withAnimation(.linear) {
                        presenter.currentIndex = 1
                    }                }
        }
        .font(.aiachyFont(.roundedBold16))
    }
    //MARK: OracleView - oracleZodiac
    private var oracleZodiac: some View {
        ZStack {
            Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor)
                .cornerRadius(20)
            VStack {
                HStack {
                    Spacer()
                }
                Image(ImageHandler.makeSettingsOracleString(aiachyState, oracle: .oracleZodiac))
                    .resizable()
                    .scaledToFit()
                    .frame(height: ACYdh(aiachyState, d: 0.3))
                ScrollView(.vertical, showsIndicators: false) {
                    makeOracleItem(.packageZodiacItem1)
                    makeOracleItem(.packageZodiacItem2)
                    makeOracleItem(.packageZodiacItem3)
                }
            }
        }
        .padding(.horizontal)
    }
    private var oracleOracle: some View {
        ZStack {
            Color.makeAiachyColor(aiachyState, aiachyColor: .fifthColor)
                .cornerRadius(20)
            VStack {
                HStack {
                    Spacer()
                    Text("31")
                        .foregroundStyle(Color.red)
                        .padding()
                }
                Image(ImageHandler.makeSettingsOracleString(aiachyState, oracle: .oracleOracle))
                    .resizable()
                    .scaledToFit()
                    .frame(height: ACYdh(aiachyState, d: 0.3))
                ScrollView(.vertical, showsIndicators: false) {
                    makeOracleItem(.packageOracleItem1)
                    makeOracleItem(.packageOracleItem2)
                    makeOracleItem(.packageOracleItem3)
                    makeOracleItem(.packageOracleItem4)
                }
            }
        }
        .padding(.horizontal)
    }
    
    func makeOracleItem(_ item: TextHelper.SettingsCompletion.oracle) -> some View {
        VStack(spacing: 0) {
            Image(ImageHandler.makeSettingsOracleString(aiachyState, oracle: .oracleltem))
                .resizable()
                .scaledToFit()
                .frame(width: ACYdw(aiachyState, d: 0.15))
            Text(TextHandler.makeSettingsOracleString(aiachy: aiachyState, oracle: item))
                .foregroundStyle(Color.makeAiachyColor(aiachyState, aiachyColor: .backgroundAlternativeColor))
                .font(.aiachyFont(.roundedBold16))
                .multilineTextAlignment(.center)
                .padding()
        }
        
    }
}
