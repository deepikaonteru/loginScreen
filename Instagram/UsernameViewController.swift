//
//  UsernameViewController.swift
//  Instagram
//
//  Created by Deepika Onteru on 10/18/19.
//  Copyright © 2019 Deepika Onteru. All rights reserved.
//

import Foundation
import UIKit

// new class represents new screen
class UsernameViewController: UIViewController {
    
    // optional sttring username, username label
    var username: String?
    let userNameLabel : UILabel = UILabel()
    let newButton = UIButton(type: .system)

    init(username: String){
        //setting username =  username
        self.username = username
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // call add userNameLabel method
        addUserNameLabel()
        addNewButtton()
        
    }
    
    func addUserNameLabel() {
        // Create text field
        
        
        if let username = self.username {
            userNameLabel.text = username
        }
        
        // Add userNameField as subview
        view.addSubview(userNameLabel)
        
        // Set translatesAutoreesiasjhd to false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        let yConstraint = userNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        let leftConstraint = userNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 160)
        let rightConstraint = userNameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        // activate constraints
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    
    func addNewButtton() {
        
        // Steps to add a button
        // globally create newButton using UIButton
        
          newButton.setTitle("back", for: .normal)
              newButton.setTitleColor(.white, for: .normal)

              newButton.backgroundColor  = .blue
              
              newButton.addTarget(self, action: #selector(newButtonPressed), for: .touchUpInside)
              
              // Add userNameField as subview
                     view.addSubview(newButton)
              
              // Set translatesAutoreesiasjhd to false
                     newButton.translatesAutoresizingMaskIntoConstraints = false
              
              // Add constraints
              let yConstraint = newButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 150)
              let leftConstraint = newButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
              let rightConstraint = newButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)

              // Activate constraints
              yConstraint.isActive = true
              leftConstraint.isActive = true
              rightConstraint.isActive = true
    }
    
    @objc
    func newButtonPressed() {
        print("Button pressed")
        //pops screen to main screen
        self.navigationController?.popViewController(animated: true)

        }
        
}
