//
//  ACYChakraStatus.swift
//  Aiachy
//
//  Created by Mert Türedü on 27.08.2023.
//

import SwiftUI
//MARK: - ACYChakraStatus - View -
struct ACYChakraStatus: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var isOracled: Bool
    @Binding var currentIndex: Int
    let entity: [ACYChakraStatusEntity]
    
    var body: some View {
        VStack(spacing:0) {
            TabView(selection: $currentIndex.animation(.easeInOut(duration: 0.5))) {
                statusView(statusColor: .firstChackra,
                           statusText: .universe,
                           tier: 0)
                .tag(0)
                statusView(statusColor: .secondChackra,
                           statusText: .enlightenment,
                           tier: 1)
                .tag(1)
                
                
                statusView(statusColor: .thirdChackra,
                           statusText: .touch,
                           tier: 2)
                .tag(2)
                
                
                statusView(statusColor: .fourthChackra,
                           statusText: .love,
                           tier: 3)
                .tag(3)
                
                statusView(statusColor: .fifthChackra,
                           statusText: .strength,
                           tier: 4)
                .tag(4)
                
                .modifier(BlockStatusModifier(isOracled: isOracled))
                statusView(statusColor: .sixthChackra,
                           statusText: .creative,
                           tier: 5)
                .tag(5)
                
                .modifier(BlockStatusModifier(isOracled: isOracled))
                statusView(statusColor: .seventhChackra,
                           statusText: .foundation,
                           tier: 6)
                .tag(6)
                
                .modifier(BlockStatusModifier(isOracled: isOracled))
            }
            .frame(height: ACYdh(aiachyState, d: 0.12))
            .tabViewStyle(.page(indexDisplayMode: .never))
            index
                .background(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                    .cornerRadius(12)
                    .padding(-5))
                .padding()
        }
        .frame(height: ACYdh(aiachyState, d: 0.2))
        .animation(.spring(), value: entity.count)
        .environmentObject(aiachyState)
    }
}
//MARK: - ACYChakraStatus - Preview -
#Preview("ACYChakraStatus") {
    ACYChakraStatus(isOracled: .constant(false),
                    currentIndex: .constant(0),
                    entity: ACY_CHAKRA_STATUS_ENTITY_TODAY)
    .environmentObject(ACY_PREVIEWS_STATE)
}
//MARK: - ACYChakraStatus - extension -
extension ACYChakraStatus {
    private func statusView(statusColor: ColorHelper.Chackra,
                            statusText: TextHelper.HomeCompletion.status,
                            tier: Int) -> some View {
        ZStack {
            Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                .cornerRadius(10)
                .frame(width: ACYdw(aiachyState, d: 0.91))
            
            HStack(spacing: 0) {
                let confirmendEntity = entity.filter { $0.tier == tier }
                circleAndName(statusColor: statusColor,
                              rate: confirmendEntity.map({ $0.rate }).first ?? 0.1 ,
                              statusText: statusText)
                comment(text: confirmendEntity.map({ $0.comment }).first ?? "")
            }
        }
    }
    
    
}
//MARK: - ACYChakraStatus - extension -
extension ACYChakraStatus {
    //MARK: ACYChakraStatus - circleAndName
    private func circleAndName(statusColor: ColorHelper.Chackra,
                               rate: Double,
                               statusText: TextHelper.HomeCompletion.status ) -> some View {
        VStack(spacing: 10) {
            //MARK: ACYChakraStatus - chakraStatusCircle
            chakraStatusCircle(rate: rate)
            Text(TextHandler.makeHomeStatusString(aiachy: aiachyState, homeStatus: statusText))
                .font(FontHandler.aiachyFont(.roundedBold12))
        }
        .frame(width: ACYdw(aiachyState, d: 0.25),
               height: ACYdh(aiachyState, d: 0.1))
        .foregroundStyle(Color(ColorHandler.makeAiachyColorsChacka(aiachy: aiachyState, chackra: statusColor)))
    }
    //MARK: ACYChakraStatus - chakraStatusCircle
    private func chakraStatusCircle(rate: Double) -> some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4)
                .opacity(0.1)
            Circle()
                .stroke(lineWidth: 4)
                .opacity(0.3)
            Circle()
                .trim(from: 0,to: rate)
                .stroke(lineWidth: 4)
                .rotationEffect(.degrees(90))
            
            Text(Int(100 * rate).description)
                .font(FontHandler.aiachyFont(.roundedMedium10))
            
        }
        .frame(width: ACYdw(aiachyState, d: 0.12))
    }
    @ViewBuilder
    //MARK: ACYChakraStatus - comment
    private func comment(text: String) -> some View {
        ScrollView(.vertical) {
            Text(text)
                .font(FontHandler.aiachyFont(.oldRegular10))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)))
                .multilineTextAlignment(.center)
        }
        .frame(width: ACYdw(aiachyState, d: 0.634),height: ACYdh(aiachyState, d: 0.1))
        .padding(.trailing,5)
    }
    
    private var index: some View {
        HStack {
            ForEach(ColorHelper.Chackra.allCases.indices, id: \.self) { index in
                let chackra = ColorHelper.Chackra.allCases[index]
                ZStack {
                    if index == currentIndex {
                        Circle()
                            .foregroundStyle(Color(ColorHandler.makeAiachyColorsChacka(aiachy: aiachyState, chackra: chackra)))
                    } else {
                        Circle()
                            .stroke(Color(ColorHandler.makeAiachyColorsChacka(aiachy: aiachyState, chackra: chackra)), lineWidth: 1)
                        Circle()
                            .scaledToFit()
                            .foregroundStyle(Color(ColorHandler.makeAiachyColorsChacka(aiachy: aiachyState, chackra: chackra)))
                            .frame(width: ACYdw(aiachyState, d: 0.01))
                    }
                }
                .scaledToFit()
                .frame(width: ACYdw(aiachyState, d: 0.03))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        currentIndex = index
                    }
                }
            }
        }
        
        
        
        
    }
}

private struct BlockStatusModifier: ViewModifier {
    
    @EnvironmentObject var aiachyState: AiachyState
    let isOracled: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if !isOracled {
                    Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                        .cornerRadius(8)
                        .opacity(0.8)
                    Text(TextHandler.makeHomeString(aiachy: aiachyState, home: .notUsable))
                        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)))
                        .font(FontHandler.aiachyFont(.cinzelBlack20))
                        .multilineTextAlignment(.center)
                }
            }
    }
}
