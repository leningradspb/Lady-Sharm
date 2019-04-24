//
//  ViewController.swift
//  Lady Sharm
//
//  Created by Eduard Sinyakov on 05/04/2019.
//  Copyright © 2019 Eduard Sinyakov. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController {
    
    @IBAction func toShop(_ sender: UIButton) {
        //(UserDefaults.standard.integer(forKey: "Scores")
        performSegue(withIdentifier: "showStore", sender: self)
    }
    var tutorialStatus = 0
    
    @IBAction func exitAction(_ sender: UIButton) {
        //fbLoginButton.isHidden = false
        
    }
    @IBOutlet weak var exitButtonOutlet: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
   var loginButtonn = FBSDKLoginButton()
   // let loginButton = FBButtonClass()
    
    @IBAction func fbButtonAction(_ sender: FBSDKLoginButton) {
        
      loginButtonn.delegate = self
        
        
        fetchProfile()
    
        
    }
    @IBOutlet weak var fbLoginButton: FBSDKLoginButton!
    // FBSDKLoginButton!
    // var score = Scores()
    
    let key = "keyCurrent"
    
   // var currentPoints = 0
    var currentPoints = Scores().score
    
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
    
    
    // скрыть кнопку по нажатию
    override func viewWillAppear(_ animated: Bool) {
        

        if FBSDKAccessToken.current() != nil {
            // lable.text = "Залогинился"
            fetchProfile()
            
            fbLoginButton.isHidden = true
            //  lable.text = FBSDKAccessToken.current()?.
            
            
        } else {
            fbLoginButton.isHidden = false
            let buttonTextLogout = NSAttributedString(string: "Войти в ФБ")
            fbLoginButton.setAttributedTitle(buttonTextLogout, for: .normal)
            
        }
    } // viewWillAppear
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: проверка туториала
    tutorialStatus = UserDefaults.standard.integer(forKey: "tut")
        
        if(FBSDKAccessToken.current() != nil) {
            let buttonTextLogin = NSAttributedString(string: "Выйти из ФБ")
            fbLoginButton.setAttributedTitle(buttonTextLogin, for: .normal)
            
        } else {
            fbLoginButton.isHidden = false
            let buttonTextLogout = NSAttributedString(string: "Войти в ФБ")
            fbLoginButton.setAttributedTitle(buttonTextLogout, for: .normal)
        }
        
        allPointsLabel.textColor = UIColor(red: 250/255, green: 253/255, blue: 2/255, alpha: 1)
        
        UserDefaults.standard.integer(forKey: "Scores")
        print(UserDefaults.standard.integer(forKey: "Scores"))
       allPointsLabel.text = "ОЧКИ: \(UserDefaults.standard.integer(forKey: "Scores"))"
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name.AudioSettingsDidChange, object: self.audioSettings, queue: OperationQueue.main) { [unowned self] (notification) in
            self.setupAudioPlayer()
        }
        setupAudioPlayer()
        
        fetchProfile()
       
    } // end ViewDidLoad
    
    
    // MARK: FB Button
/*    func setupFBloginButton() {
        fbLoginButton.readPermissions = ["public_profile", "email"]
       let image = UIImage(named: "btnLoginWithFb")
       
        
        fbLoginButton.setBackgroundImage(image, for: .normal)
        fbLoginButton.setBackgroundImage(image, for: .selected)
        fbLoginButton.setBackgroundImage(image, for: .application)
        fbLoginButton.imageView?.isHidden = true
        fbLoginButton.titleLabel?.isHidden = true
        
        
        fbLoginButton.delegate = self
       
    } */
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcToSettings", let dvc = segue.destination as? SettingsViewController {
            dvc.audioSettings = audioSettings
        }
        if segue.identifier == "showStore", let dvc = segue.destination as? StoreViewController {
            dvc.text = String((UserDefaults.standard.integer(forKey: "Scores")))
        }
    }
    
    // MARK: Переход к туториалу
    override func viewDidAppear(_ animated: Bool) {
       // if allPointsLabel.text == "ОЧКИ: 0" {
        if tutorialStatus == 0 {
        performSegue(withIdentifier: "vcToTutorial", sender: self)
            tutorialStatus = 1
            // если прошел, то установить
            UserDefaults.standard.set(tutorialStatus, forKey: "tut")
        }
    }
    
    @IBAction func didUnwindSegue(_ segue: UIStoryboardSegue) {
        
        if FBSDKAccessToken.current() != nil {
            // lable.text = "Залогинился"
            fetchProfile()
            
            fbLoginButton.isHidden = true
            //  lable.text = FBSDKAccessToken.current()?.
            
        } else {
            fbLoginButton.isHidden = false
            let buttonTextLogout = NSAttributedString(string: "Войти в ФБ")
            fbLoginButton.setAttributedTitle(buttonTextLogout, for: .normal)
            
        }
        
        guard let lblFromUnwind = segue.source as? EndGameViewController else { return }
        UserDefaults.standard.integer(forKey: "Scores")
        
        currentPoints = UserDefaults.standard.integer(forKey: "Scores") + lblFromUnwind.lableInt
        //currentPoints = currentPoints + Int(lblFromUnwind.pointsLabel.text ?? "0")!
        allPointsLabel.text = "ОЧКИ: \(currentPoints)"
        
        UserDefaults.standard.set(currentPoints, forKey: "Scores")
        
    }
    
    // MARK: fetchProfile()
    func fetchProfile() {
        
        if(FBSDKAccessToken.current() != nil) {
            
            
            
            // print(FBSDKAccessToken.current().permissions)
          //  let parametrs = ["fields" : "first_name, last_name, email, picture.type(large), id"]
          //  FBSDKGraphRequest(graphPath: "me", parameters: parametrs)?.start(completionHandler: {  (connection, result, error) in
                
                
              //  self.loginButton.isHidden = true
                
             //   let data = result as! [String : AnyObject]
                
               // let name = data["first_name"] as? String
              //  let secondName = data["last_name"] as? String
              //  self.nameLabel.text = "\(name!) \(secondName!)"
                
               // let FBid = data["id"] as? String
              // self.idLable.text = FBid
                
         //       let email = data["email"] as? String
               // self.lable.text = email
                
                
             //   let url = NSURL(string: "https://graph.facebook.com/\(FBid!)/picture?type=large&return_ssl_resources=1")
             //  self.imageView.image = UIImage(data: NSData(contentsOf: url! as URL)! as Data)
                
                self.fbLoginButton.isHidden = true
          //  })
        }

    }
} // end of the class

extension ViewController: FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
    
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
      
       
        
    }
    
    
}
