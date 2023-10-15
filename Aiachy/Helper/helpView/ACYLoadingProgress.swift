//
//  ACYLoadingProgress.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.05.2023.
//

import SwiftUI

struct ACYLoadingProgress: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    
    var body: some View {
        //MARK: ACYLoadingProgress - Image
        Image(ImageHandler.makeGeneralAppString(aiachyState, app: .appLogo))
            .resizable()
            .scaledToFit()
            .frame(width: ACY_UI_WIDTH_SIZE * ACY_LRG_SIZE)
    }
}

struct ACYLoadingProgress_Previews: PreviewProvider {
    
    static let aiachyState = ACY_PREVIEWS_STATE
    
    static var previews: some View {
        ACYLoadingProgress()
            .environmentObject(aiachyState)
    }
}
