//
//  TuneInteractor.swift
//  Aiachy
//
//  Created by Mert Türedü on 17.08.2023.
//

import Foundation
import Combine
//MARK: TuneInteractor - protocol - ServerProtocol -
private protocol ServerProtocol {
    
}
//MARK: TuneInteractor - protocol - AudioPlayerProtocol -
private protocol AudioPlayerProtocol {
}
//MARK: TuneInteractor - protocol - CoreDataProtocol -
private protocol CoreDataProtocol {
    func getCoreData(completion: @escaping ([ACYTuneEntity]) -> ())
}
//MARK: TuneInteractor - Interactor -
class TuneInteractor: ObservableObject {

    private let coreDataManager: CoreDataManager
    private let tuneServerManager: TuneServerManager
    private let audioPlayerManager: AudioPlayerManager
    var progressCount: CurrentValueSubject<Double,Error>
    
    init(coreDataManager: CoreDataManager = CoreDataManager(),
         tuneServerManager: TuneServerManager = TuneServerManager(),
         audioPlayerManager: AudioPlayerManager = AudioPlayerManager()) {
        self.coreDataManager = coreDataManager
        self.tuneServerManager = tuneServerManager
        self.audioPlayerManager = audioPlayerManager
        self.progressCount = CurrentValueSubject(0)
    }
}
//MARK: TuneInteractor - extension - ServerProtocol -
extension TuneInteractor: ServerProtocol {
    
    func downloadTune(entity acyTuneEntity: ACYTuneEntity, completion: @escaping (Bool) -> ()) {
        tuneServerManager.downloadTuneFromServer(entity: acyTuneEntity) { [self] result in
            switch result {
            case .progress(let double):
                progressCount.send(double)
            case .completion(let url):
                audioPlayerManager.playLocalAudio(url: url)
                completion(true)
            case .failure(let error):
                progressCount.send(completion: .failure(error))
                completion(false)
            }
        }
    }
}
extension TuneInteractor: AudioPlayerProtocol {
    func pauseTune() {
        audioPlayerManager.pauseAudio()
    }
}
//MARK: TuneInteractor - extension - CoreDataManager -
extension TuneInteractor: CoreDataProtocol {
    func getCoreData(completion: @escaping ([ACYTuneEntity]) -> ()) {
        coreDataManager.fetchAllTuneInfo { acyTuneEntityData in
            completion(acyTuneEntityData)
        }
    }
}

