//
//  ViewController.swift
//  InstaCloneFirebase
//
//  Created by Tolga Sarikaya on 11.12.22.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
}
    

    
    // MARK: - Actions
    @IBAction func signInClicked(_ sender: Any) {
        
        if nameText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: nameText.text!, password: passwordText.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
               
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
            
        }else {
            makeAlert(titleInput: "Error", messageInput: "Username/Password")
        }
        
    }
    
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if nameText.text != "" && passwordText.text != "" {
            
            // Veri Tabaninda Kullanici olusturma
            Auth.auth().createUser(withEmail: nameText.text!, password: passwordText.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                 
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                    
                }
            }
            

            
        }else {
           makeAlert(titleInput: "Error", messageInput: "Username/Password")
        }
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

