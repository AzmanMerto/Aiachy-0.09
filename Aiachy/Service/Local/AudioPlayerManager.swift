//
//  AudioPlayerManager.swift
//  Aiachy
//
//  Created by Mert Türedü on 21.08.2023.
//

import Foundation
import AVFoundation

class AudioPlayerManager: NSObject, AVAudioPlayerDelegate {
    private var audioPlayer: AVPlayer?
    
    // Data üzerinden ses dosyasını yüklemek için bir fonksiyon
    func playLocalAudio(url: URL) {
        
        let avm = AVPlayerItem(url: url)
            audioPlayer = AVPlayer(playerItem: avm)
            audioPlayer?.play()
    }
    
    func pauseAudio() {
        audioPlayer?.pause()
    }
    
}


//// AVAudioPlayerDelegate metotları (isteğe bağlı)
//func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//    // Ses dosyası oynatma tamamlandığında burası tetiklenir
//}
//
//func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
//    // Ses dosyası oynatılırken bir hata oluşursa burası tetiklenir
//}
