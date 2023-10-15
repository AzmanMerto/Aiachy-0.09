//
//  ACYPassButton.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.07.2023.
//

import SwiftUI
//MARK: - ACYPassButton - View -
struct ACYPassButton: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var isFirstAppear: Bool = false
    @State var isSecondAppear: Bool = false
    @State var movingValue: Double = 0
    @State var isItBackButton: Bool
    var text : TextHelper.GeneralCompletion.button
    var action: () -> ()
    
    var body: some View {
        Button { action() } label: {
            buttonCompletion
                .background(GeometryReader { geometry in
                    Color.clear
                        .onChange(of: geometry.size.width, perform: { data in
                            if movingValue == 0  {
                                if isItBackButton {
                                    withAnimation(.easeIn(duration: 1)) {
                                        self.movingValue = data / 10 - 5
                                    }
                                } else {
                                    withAnimation(.easeIn(duration: 2)) {
                                        self.movingValue = data / 10 + 5 * -1   }
                                }
                            } else {
                                if isItBackButton {
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        self.movingValue = data / 10 + 5 * -1
                                    }
                                } else {
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        self.movingValue = data / 10 - 5
                                    }
                                }
                            }
                        })
                })
        }
        .buttonStyle(ACYPassButtonStyle())
        .offset(x: movingValue, y: 0)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { withAnimation(.easeIn(duration: 1)) { isFirstAppear = true } }
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) { withAnimation(.easeOut(duration: 0.2)) { isSecondAppear = true } }
        }
        .makeAccessibilitysForUITest(identifier: "ACYPassButtonID")
        
    }
}
//MARK: - ACYPassButton - Preview -
#Preview("ACYPassButton") {
    ACYPassButton(isItBackButton: true, text: .guest) {}
        .background {
            Color(ColorHandler.makeAiachyColor(ACY_PREVIEWS_STATE,
                                               aiachyColor: .backgroundColor))
            .ignoresSafeArea()
            .frame(width: ACY_UI_WIDTH_SIZE,
                   height: ACY_UI_HEIGHT_SIZE)
        }
        .environmentObject(ACY_PREVIEWS_STATE)
}
//MARK: - ACYPassButton - extension -
extension ACYPassButton {
    //MARK: ACYPassButton - buttonCompletion
    private var buttonCompletion: some View {
        HStack {
            if isSecondAppear {
                //MARK: ACYPassButton - buttonArrow
                buttonArrow
            } else {
                //MARK: ACYPassButton - buttonArrow
                if isFirstAppear { if isItBackButton { buttonArrow } }
                //MARK: ACYPassButton - buttonText
                buttonText
                //MARK: ACYPassButton - buttonArrow
                if isFirstAppear { if !isItBackButton { buttonArrow } }
            }
        }
        .frame(height: ACYdh(aiachyState, d: 0.04))
        .padding(.horizontal)
    }
    //MARK: ACYPassButton - buttonArrow
    private var buttonArrow: some View {
        Image(ImageHandler.makeGeneralButtonString(aiachyState, button: .rightArrowButton))
            .resizable()
            .frame(width: ACYdw(aiachyState, d: 0.013),
                   height: ACYdh(aiachyState, d: 0.014))
            .scaledToFit()
            .rotate(isItBackButton ? 180 : 0)
    }
    //MARK: ACYPassButton - buttonText
    private var buttonText: some View {
        Text(TextHandler.makeGeneralButtonString(aiachy: aiachyState, button: text))
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .padding(.horizontal,5)
    }
}
