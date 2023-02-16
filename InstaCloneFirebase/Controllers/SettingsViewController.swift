//
//  SettingsViewController.swift
//  InstaCloneFirebase
//
//  Created by Tolga Sarikaya on 11.12.22.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
   // MARK: - Actions
    @IBAction func logoutClicked(_ sender: Any) {
      
        do {
           try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch {
            print("error")
        }
    }
   

}
