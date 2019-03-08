//
//  LoginViewController.swift
//  sign-in
//
//  Created by Tryston Hoyes on 2019-03-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    //    Collection of UI attributes that allow interaction
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Function that is called when the UI button is pressed
    @IBAction func logIn(_ sender: Any) {
        
//  Code retrieved from https: //medium.com/@ashikabala01/how-to-build-login-and-sign-up-functionality-for-your-ios-app-using-firebase-within-15-mins-df4731faf2f7
        
         // Send the login request to Firebase and brings the user to the first page (checks to see if credentials are right)
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
//                  If it cannot send the request to the database returns error message
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
