//
//  AudioPlayer.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer {
    
    private var url = Bundle.main.url(forResource: "Mush", withExtension: "wav")
    
    
    
    private var audioPlayer: AVAudioPlayer?
    
    func playMusic() {
        if audioPlayer == nil {
            if url != nil {
                do {
                    try audioPlayer = AVAudioPlayer(contentsOf: url!)
                    audioPlayer?.numberOfLoops = -1
                } catch {
                    print("Something's gone wrong with AVPlayer")
                }
            }
        }
        if let player = audioPlayer, !player.isPlaying {
            player.play()
        }
        
    }
    
    func stopMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
    // звуки
    
    enum SoundEffect {
        case flip
        case shuffle
        case match
        case nomatch
    }
    
    func playSound(_ effect: SoundEffect) {
        var soundfileName = ""
        
        switch effect {
        case .flip :
        soundfileName = "cardflip"
        case .shuffle:
        soundfileName =  "shuffle"
        case .match:
        soundfileName = "dingcorrect"
        case .nomatch:
        soundfileName = "dingwrong"
        }
        
        // бандл
        let bundlePath = Bundle.main.path(forResource: soundfileName, ofType: "wav")
        
        guard  bundlePath != nil else {
            print("Невозможно найти имя файла \(soundfileName) in Bundle")
        return
        }
        // юрл
        let soundURL = URL(fileURLWithPath: bundlePath!)
        do {
        audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            audioPlayer?.play()
        } catch {
            print("error in do - catch in AudioPlayer")
        }
    }
    
    func stopSound() {
        audioPlayer?.stop()
    }

} // конец класса аудио плеер


