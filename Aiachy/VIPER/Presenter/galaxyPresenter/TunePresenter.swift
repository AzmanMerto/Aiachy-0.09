//
//  TunePresenter.swift
//  Aiachy
//
//  Created by Mert Türedü on 16.08.2023.
//

import Foundation
import Combine
//MARK: TunePresenter - protocol - AiachyStateHandlerProtocol -
private protocol AiachyStateHandlerProtocol {
    func updateTuneEntityData(aiachy aiachyState: AiachyState)
}
//MARK: TunePresenter - protocol - HandlerProtocol -
private protocol HandlerProtocol {
    func setLocalTuneEntityData(aiachy aiachyState: AiachyState)
}
private protocol ServerProtocol {
    
}
//MARK: TunePresenter - protocol - AudioPlayerProtocol -
private protocol AudioPlayerProtocol {
    
}
//MARK: TunePresenter - Presenter -
class TunePresenter: ObservableObject {
    
    @Published var acyTuneEntityData: [ACYTuneEntity]?
    @Published var playingTune: String
    private let aiachyState: AiachyState
    private let interactor: TuneInteractor
    private var cancellable: AnyCancellable?
    
    init(playingTune: String = "",
         aiachyState: AiachyState,
         interactor: TuneInteractor = TuneInteractor()) {
        self.playingTune = playingTune
        self.aiachyState = aiachyState
        self.interactor = interactor
        setLocalTuneEntityData(aiachy: aiachyState)
    }
    
    /// <#Description#>
    /// - Parameter acyTuneEntity: <#acyTuneEntity description#>
    func actionTuneColumn(entity acyTuneEntity: ACYTuneEntity) {
        if acyTuneEntity.tuneId == playingTune {
            pauseTune()
            playingTune = ""
        } else if playingTune.isEmpty {
            downloadAndPlayTune(entity: acyTuneEntity)
            playingTune = acyTuneEntity.tuneId!
        } else if !playingTune.isEmpty {
            downloadAndPlayTune(entity: acyTuneEntity)
            playingTune = acyTuneEntity.tuneId!
        }
    }
    
}
//MARK: TunePresenter - extension - AiachyStateHandlerProtocol -
extension TunePresenter: AiachyStateHandlerProtocol {
    /// <#Description#>
    /// - Parameter aiachyState: <#aiachyState description#>
    func updateTuneEntityData(aiachy aiachyState: AiachyState) {
        interactor.getCoreData { aiachyState.acyAiachyRepo.acyTuneEntityRepo = $0    }
    }
}
//MARK: TunePresenter - extension - HandlerProtocol -
extension TunePresenter: HandlerProtocol {
    /// <#Description#>
    /// - Parameter aiachyState: <#aiachyState description#>
    func setLocalTuneEntityData(aiachy aiachyState: AiachyState) {
        self.acyTuneEntityData = aiachyState.acyAiachyRepo.acyTuneEntityRepo
    }
}
extension TunePresenter: ServerProtocol {
    fileprivate func downloadAndPlayTune(entity acyTuneEntity: ACYTuneEntity) {
        interactor.downloadTune(entity: acyTuneEntity) { isDownloadedTune in
            guard isDownloadedTune else { return }
        }
    }
}
//MARK: TunePresenter - extension - AudioPlayerProtocol -
extension TunePresenter: AudioPlayerProtocol {
    fileprivate func pauseTune() {
        interactor.pauseTune()
    }
}
