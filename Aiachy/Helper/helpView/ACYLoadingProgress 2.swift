//
//  ACYLoadingProgress.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import SwiftUI

struct ACYLoadingProgress: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @State var rotateDouble: Double = 0.0
    
    var body: some View {
        //MARK: ACYLoadingProgress - Image
        Image.setACYAppImage(aiachyState, app: .appLogo)
            .resizable()
            .scaledToFit()
            .frame(width: ACY_UI_WIDTH_SIZE * ACY_LRG_SIZE)
            .rotate(rotateDouble)
            .onAppear {
                withAnimation(.linear(duration: 30)) {
                    self.rotateDouble = 720
                }
            }
    }
}

struct ACYLoadingProgress_Previews: PreviewProvider {
    
    static let aiachyState = ACY_PREVIEWS_STATE
    
    static var previews: some View {
        ACYLoadingProgress()
            .environmentObject(aiachyState)
    }
}
