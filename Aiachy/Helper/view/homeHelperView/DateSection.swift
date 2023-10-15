//
//  DateSection.swift
//  Aiachy
//
//  Created by Mert Türedü on 26.08.2023.
//

import SwiftUI

struct DateSection: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var selectedCurrentTime: TextHelper.HomeCompletion.date
    @Binding var isOracled: Bool
    var currentTime: TextHelper.HomeCompletion.date
    var action: () -> ()
    
    
    init(selectedCurrentTime: Binding<TextHelper.HomeCompletion.date>,
         isOracled: Binding<Bool>,
         currentTime: TextHelper.HomeCompletion.date,
         action: @escaping () -> ()) {
        self._selectedCurrentTime = selectedCurrentTime
        self._isOracled = isOracled
        self.currentTime = currentTime
        self.action = action
    }
    
    var body: some View {
        HStack {
            Text(TextHandler.makeHomeDateString(aiachy: aiachyState, date: currentTime))
            if !isOracled {
                Image(ImageHandler.makeHomeString(aiachyState, home: .lock))
            }
        }
        .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState,
                                                   aiachyColor: selectedCurrentTime == currentTime ? .backgroundAlternativeColor : .fifthColor)))
            .font(FontHandler.aiachyFont(.roundedBold14))
            .background {   backgroundRectangle   }
            .padding(.horizontal)
            .frame(height: ACYdh(aiachyState, d: 0.05))
            .onTapGesture {
                if isOracled {
                    withAnimation(.easeIn) {
                        selectedCurrentTime = currentTime
                        action()
                    }
                }
            }
            .environmentObject(aiachyState)
    }
}
#Preview {
    DateSection(selectedCurrentTime: .constant(.today),
                isOracled: .constant(false),
                currentTime: .today) { }
        .environmentObject(ACY_PREVIEWS_STATE)
}
extension DateSection {
    //MARK: DateSection - backgroundRectangle
    var backgroundRectangle: some View {
        RoundedRectangle(cornerRadius: 18)
            .stroke(Color(ColorHandler.makeAiachyColor(aiachyState, 
                                                       aiachyColor: .secondColor)), lineWidth: 1)
            .background { Color(ColorHandler.makeAiachyColor(aiachyState, 
                                                             aiachyColor: selectedCurrentTime == currentTime ?  .fifthColor : .backgroundAlternativeColor))
                    .cornerRadius(18)
                .shadow(color: Color(ColorHandler.makeAiachyColor(aiachyState, 
                                                                  aiachyColor: .firstColor)).opacity(0.5),radius: 4,x: 0,y: 5)}
            .frame(height: ACYdh(aiachyState, d: 0.05))
            .padding(.horizontal,-10)
    }
}
