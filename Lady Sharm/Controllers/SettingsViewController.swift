//
//  SettingsViewControllerViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit
import MessageUI


class SettingsViewController: UIViewController {
    
    @IBOutlet weak var lableSettings: UILabel!
    
    
    @IBAction func feedBack(_ sender: UIButton) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients(["Feedback.2019@gmail.com"])
        composeVC.setSubject("LadysSharm обратная связь")
        composeVC.setMessageBody("Добрый день! ", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var changeSoundOutlet: UISwitch!
    @IBAction func changeSoundSettings(_ sender: UISwitch) {
        audioSettings?.isSoundOn = sender.isOn
        
      //  UserDefaults.standard.set(sender.isOn, forKey: "soundSwitch")
        print("audioSoundSettings is: \(sender.isOn)")
        
    }
    @IBOutlet weak var changeMusicOutlet: UISwitch!
    @IBAction func changeMusicSettings(_ sender: UISwitch) {
        audioSettings?.isMusicOn = sender.isOn
        UserDefaults.standard.set(sender.isOn, forKey: "saveSwitch")
        print("audioSettings is: \(audioSettings != nil)")

    }
    var audioSettings: AudioSettings?

    override func viewDidLoad() {
        super.viewDidLoad()
       // lable настройки
        lableSettings.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        
       if let saveSwitch = UserDefaults.standard.value(forKey: "saveSwitch") {
            changeMusicOutlet.isOn = saveSwitch as! Bool
           // audioSettings?.isMusicOn = changeMusicOutlet.isOn
        }
        
       /* if let soundSwitch = UserDefaults.standard.value(forKey: "soundSwitch") {
            changeMusicOutlet.isOn = soundSwitch as! Bool
            audioSettings?.isSoundOn = changeSoundOutlet.isOn
        } */
       
        if audioSettings?.isMusicOn == true {
            changeMusicOutlet.setOn(true, animated: true)
           // UserDefaults.standard.bool(forKey: "saveValue")
        } else {
            changeMusicOutlet.setOn(false, animated: false)
          //  UserDefaults.standard.bool(forKey: "saveValue")
        }
        
        if audioSettings?.isSoundOn == true {
            changeSoundOutlet.setOn(true, animated: true)
            // UserDefaults.standard.bool(forKey: "saveValue")
        } else {
            changeSoundOutlet.setOn(false, animated: false)
            //  UserDefaults.standard.bool(forKey: "saveValue")
        }
    }

}



extension SettingsViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            print("Отправка отменена")
            case .sent:
            print("Сообщение отправлено")
        case .failed:
            print("Ошибка отправки")
        case .saved:
            print("Черновик сохранен")
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
