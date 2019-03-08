//
//  SignUpViewController.swift
//  sign-in
//
//  Created by Tryston Hoyes on 2019-03-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
//    Collection of UI attributes that allow interaction
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
   @IBOutlet weak var confirmPass: UITextField!
    
//    Makes sure that the view controller has loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // Function that is called when the UI button is pressed
    @IBAction func signUpAction(_ sender: Any) {
        
        //  Code retrieved from https: //medium.com/@ashikabala01/how-to-build-login-and-sign-up-functionality-for-your-ios-app-using-firebase-within-15-mins-df4731faf2f7
        
//        Looks to see if the password is the same in both fields - when they are correct it continues if not it provides them with an error
        if password.text != confirmPass.text{
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            // Send the resgister request to Firebase and brings the user to the first page
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "signupToHome", sender: self)
                }
                else{
//                    If it cannot send the request to the database returns error message
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }

}
