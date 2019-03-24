//
//  HomeViewController.swift
//  sign-in
//
//  Created by Tryston Hoyes on 2019-03-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    
//code retrieved from https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//       code retrieved from  https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
        view.addSubview(welcomeLabel)
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadUserData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    }
//     code retrieved from https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
    func loadUserData(){
        guard let uid =  Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child("users").child(uid).child("Full Name").observeSingleEvent(of: .value)
        {
            (snapshot) in
            guard let fullName = snapshot.value as? String else {return}
            self.welcomeLabel.text = "Welcome, \(fullName)"
            UILabel.animate(withDuration: 0.5 , animations: {
                self.welcomeLabel.alpha = 1
            })
        }
    }
//    This version will be used when a user logs in
//      code retrieved from https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
//    func loadUserData(){
//        guard let uid =  Auth.auth().currentUser?.uid else {return}
//        Database.database().reference().child("users").child(uid).child("Full Name").observeSingleEvent(of: .value)
//        {
//            (snapshot) in
//            guard let fullName = snapshot.value as? String else {return}
//            self.welcomeLabel.text = "Welcome back, \(fullName)"
//            UILabel.animate(withDuration: 0.5 , animations: {
//                self.welcomeLabel.alpha = 1
//            })
//        }
//    }

}
