//
//  TuneColumn.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.08.2023.
//

import SwiftUI
import AVFoundation

struct TuneColumn: View {
    
    @EnvironmentObject var aiachyState: AiachyState
    @Binding var playingTune: String
    @State var isPlaying: Bool
    var acyTuneEntity: ACYTuneEntity
    let action: () -> ()
    
    init(playingTune: Binding<String>,
         isPlaying: Bool = false,
         acyTuneEntity: ACYTuneEntity,
         action: @escaping () -> ()) {
        self._playingTune = playingTune
        self._isPlaying = State(initialValue: isPlaying)
        self.acyTuneEntity = acyTuneEntity
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                //MARK: TuneColumn - backgroundCloumn
                backgroundCloumn
                VStack(spacing: 10) {
                    //MARK: TuneColumn - imageAndText
                    imageAndText
                    //MARK: TuneColumn - playPauseText
                    playPauseText
                }
                .padding(.vertical,5)
            }
            .frame(width: ACYdw(aiachyState, d: 0.9), height: ACYdw(aiachyState, d: 0.3))
        }
        .onChange(of: playingTune, perform: { [self] newValue in
            if newValue == acyTuneEntity.tuneId! {
                isPlaying = true
            } else {
                isPlaying = false
            }
        })
        .buttonStyle(PlainButtonStyle())
    }
}
#Preview {
    TuneColumn(playingTune: .constant(""),
               isPlaying: false,
               acyTuneEntity: ACYTuneEntity(tuneId: "Tune",
                                            name: "Tune",
                                            determinedZodiac: 1)) { }
        .environmentObject(ACY_PREVIEWS_STATE)
}
extension TuneColumn {
    @ViewBuilder
    //MARK: TuneColumn - imageAndText
    var imageAndText: some View {
        makeImageWithZodiacInt(aiachy: aiachyState, zodiac: acyTuneEntity.determinedZodiac!,isAlternative: false)
            .resizable()
            .scaledToFit()
            .frame(width: ACYdw(aiachyState, d: 0.1))
        Text(acyTuneEntity.name!)
            .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)))
            .font(FontHandler.aiachyFont(.cinzelBlack22))
            .shadow(color: Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)).opacity(0.5), radius: 4, x: 0, y: 4)
    }
    //MARK: TuneColumn - backgroundCloumn
    var backgroundCloumn: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundAlternativeColor)), lineWidth: 2)
            .background(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .fifthColor))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .firstColor)), radius: 4, x: 0, y: 4))
    }
    @ViewBuilder
    //MARK: TuneColumn - playPauseText
    var playPauseText: some View {
        if isPlaying {
            Text(TextHandler.makeGalaxyTune(aiachy: aiachyState, galaxyTune: .stop))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)))
                .font(FontHandler.aiachyFont(.roundedBlack8))
        } else {
            Text(TextHandler.makeGalaxyTune(aiachy: aiachyState, galaxyTune: .play))
                .foregroundStyle(Color(ColorHandler.makeAiachyColor(aiachyState, aiachyColor: .backgroundColor)))
                .font(FontHandler.aiachyFont(.roundedBlack8))
        }
    }
}
