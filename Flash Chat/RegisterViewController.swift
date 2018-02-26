//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

        
        //TODO: Set up a new user on our Firbase database
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: "Try again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Error", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                print(error!)
                SVProgressHUD.dismiss()
               
            } else {
                //success
                print("Registration Successful")
//                let alert = UIAlertController(title: "Successful", message: "You are registered successfully", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Exit", style: .cancel, handler: nil))
//
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
//                self.present(alert, animated: true)
                
            }
        }
        

        
        
    } 
    
    
}
