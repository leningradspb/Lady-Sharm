//
//  ViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let key = "keyCurrent"
    
    var currentPoints = 0
    
    var lableFromSegue = UILabel()
    
    @IBOutlet weak var allPointsLabel: UILabel!
    private var observer: NSObjectProtocol?
    private var audioSettings = AudioSettings()
    private func setupAudioPlayer() {
        if audioSettings.isMusicOn {
            audioPlayer.playMusic()
        } else {
        audioPlayer.stopMusic()
        }
    }
    
    @IBAction func policyButton(_ sender: UIButton) {
    }
    
    private var audioPlayer = AudioPlayer()

    @IBOutlet weak var newGame: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        allPointsLabel.text = "ОЧКИ: \(currentPoints)"
        
        UserDefaults.standard.set(currentPoints, forKey: key)
        observer = NotificationCenter.default.addObserver(forName: Notification.Name.AudioSettingsDidChange, object: self.audioSettings, queue: OperationQueue.main) { [unowned self] (notification) in
            self.setupAudioPlayer()
        }
        setupAudioPlayer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcToSettings", let dvc = segue.destination as? SettingsViewController {
            dvc.audioSettings = audioSettings
        }
    }
    
    @IBAction func didUnwindSegue(_ segue: UIStoryboardSegue) {
        
    }
    


}

