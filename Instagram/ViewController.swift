//
//  ViewController.swift
//  Instagram
//
//  Created by Deepika Onteru on 10/11/19.
//  Copyright © 2019 Deepika Onteru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Add logo
        addLogo()

        // Add text fields for username and password
        addUserNameField()
        addPassWordField()
        
        // Add login button
        addLoginButton()
    }

    func addLogo() {
        
        // Creeate UIImageView
        var logoView = UIImageView()
        
        // Add insta logo to UIImageView
        logoView.image = UIImage(named: "insta.png")
        
        // Set Aspect Ratio
        logoView.contentMode = .scaleAspectFit
        
        // Add imageview as subview
        view.addSubview(logoView)

        // Set translatesAutoreesiasjhd to false
        logoView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        let topConstraint = logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70)
        let xConstraint = logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let widthConstraint = logoView.widthAnchor.constraint(equalToConstant: 250)
        
        // Activate constraints
        topConstraint.isActive = true
        xConstraint.isActive = true
        widthConstraint.isActive = true
        
    }

    func addUserNameField() {
        // Create text field
        let userNameField = UITextField()
        
        // Set properties
        userNameField.placeholder = "Username"
        userNameField.delegate = self
        userNameField.textAlignment = .center
        
        // Add userNameField as subview
        view.addSubview(userNameField)
        
        // Set translatesAutoreesiasjhd to false
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        let yConstraint = userNameField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        let leftConstraint = userNameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = userNameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        // activate constraints
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    
    
    func addPassWordField() {
        // Create text field
        let passWordField = UITextField()
        
        // Set properties
        passWordField.placeholder = "Password"
        passWordField.delegate = self
        passWordField.textAlignment = .center
        
        // Add userNameField as subview
        view.addSubview(passWordField)
        
        // Set translatesAutoreesiasjhd to false
        passWordField.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        let yConstraint = passWordField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        let leftConstraint = passWordField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = passWordField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        
        // Activate constraints
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
    
    
    func addLoginButton() {
        let loginButton = UIButton(type: .system)
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)

        // Add userNameField as subview
               view.addSubview(loginButton)
               
        // Set translatesAutoreesiasjhd to false
               loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add constraints
        let yConstraint = loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80)
        let leftConstraint = loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        let rightConstraint = loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)

        // Activate constraints
        yConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
    }
}



extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("user started typing")
    }
    
    
}
