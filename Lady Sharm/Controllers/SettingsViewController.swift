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
    
    @IBAction func feedBack(_ sender: UIButton) {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        composeVC.setToRecipients(["Feedback.2019@gmail.com"])
        composeVC.setSubject("LadysSharm обратная связь")
        composeVC.setMessageBody("Добрый день! ", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    @IBOutlet weak var changeMusicOutlet: UISwitch!
    @IBAction func changeMusicSettings(_ sender: UISwitch) {
        audioSettings?.isMusicOn = sender.isOn
        print("audioSettings is: \(audioSettings != nil)")
        
    }
    var audioSettings: AudioSettings?

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
