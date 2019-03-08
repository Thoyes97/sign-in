//
//  StartViewController.swift
//  sign-in
//
//  Created by Tryston Hoyes on 2019-03-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import Firebase

class StartViewController: UIViewController {

    //    Collection of UI attributes that allow interaction
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //  Code retrieved from https: //medium.com/@ashikabala01/how-to-build-login-and-sign-up-functionality-for-your-ios-app-using-firebase-within-15-mins-df4731faf2f7
        
        // Looks to see if the user is already logged in - if it does brings them right to the Homeview
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
        }
    }

}
