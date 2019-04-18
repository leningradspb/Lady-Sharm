//
//  SettingsViewControllerViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit
import MessageUI
import FBSDKLoginKit


class SettingsViewController: UIViewController {
    
    
//  var loginButtonSVC = FBButtonClass()
    
    
    @IBOutlet weak var fbUserLabel: UILabel!
    @IBOutlet weak var fbUserImageView: UIImageView!
    @IBAction func fbLoginButtonAction(_ sender: Any) {
        
        fetchProfile()
      
       // loginButton.loginButtonDidLogOut(loginButton)
        // Hiding the button
    }
    
    @IBOutlet weak var fbLoginButtonOutlet: FBSDKLoginButton!
    
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
        
        fbLoginButtonOutlet.delegate = self
        fetchProfile()
        
        if(FBSDKAccessToken.current() != nil) {
            let buttonTextLogin = NSAttributedString(string: "Выйти из ФБ")
            fbLoginButtonOutlet.setAttributedTitle(buttonTextLogin, for: .normal)
            
        } else {
            let buttonTextLogout = NSAttributedString(string: "Войти в ФБ")
            fbLoginButtonOutlet.setAttributedTitle(buttonTextLogout, for: .normal)
        }
        
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
    
    func fetchProfile() {
        
        if(FBSDKAccessToken.current() != nil) {
            
            
            
            // print(FBSDKAccessToken.current().permissions)
            let parametrs = ["fields" : "first_name, last_name, email, picture.type(large), id"]
            FBSDKGraphRequest(graphPath: "me", parameters: parametrs)?.start(completionHandler: {  (connection, result, error) in
                
                
                //  self.loginButton.isHidden = true
                
                let data = result as! [String : AnyObject]
                
                let name = data["first_name"] as? String
                let secondName = data["last_name"] as? String
                self.fbUserLabel.text = "\(name!) \(secondName!)"
                
                let FBid = data["id"] as? String
                //  self.idLable.text = FBid
                
              //  let email = data["email"] as? String
                // self.lable.text = email
                
                
                let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
                self.fbUserImageView.isHidden = false
                self.fbUserLabel.isHidden = false
                self.fbUserImageView.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
                self.fbUserImageView.layer.cornerRadius = self.fbUserImageView.frame.height / 2
                
            })
        }
    }
} // end of the class



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


extension SettingsViewController: FBSDKLoginButtonDelegate {
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if FBSDKAccessToken.current() != nil {
            // lable.text = "Залогинился"
            fetchProfile()
            
            if(FBSDKAccessToken.current() != nil) {
                let buttonTextLogin = NSAttributedString(string: "Выйти из ФБ")
                fbLoginButtonOutlet.setAttributedTitle(buttonTextLogin, for: .normal)
            
            //  lable.text = FBSDKAccessToken.current()?.
            
        } else {
                let buttonTextLogout = NSAttributedString(string: "Войти в ФБ")
                fbLoginButtonOutlet.setAttributedTitle(buttonTextLogout, for: .normal)
            
            }
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
        fbUserImageView.isHidden = true
        fbUserLabel.isHidden = true
        
        if(FBSDKAccessToken.current() != nil) {
            let buttonTextLogin = NSAttributedString(string: "Выйти из ФБ")
            fbLoginButtonOutlet.setAttributedTitle(buttonTextLogin, for: .normal)
        
        } else {
            let buttonTextLogout = NSAttributedString(string: "Войти в ФБ")
            fbLoginButtonOutlet.setAttributedTitle(buttonTextLogout, for: .normal)
        }
    
    
    }

}
