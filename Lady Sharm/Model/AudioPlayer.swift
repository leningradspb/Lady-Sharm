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
    
    
    
}
