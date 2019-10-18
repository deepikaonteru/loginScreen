//
//  ViewController.swift
//  Instagram
//
//  Created by Deepika Onteru on 10/11/19.
//  Copyright © 2019 Deepika Onteru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        // Creating fields
        let userNameField = UITextField()
        let passWordField = UITextField()
        var logoView = UIImageView()
        let loginButton = UIButton(type: .system)


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
        
        // Create UIImageView
        
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
        
        // Set properties
        passWordField.placeholder = "Password"
        passWordField.delegate = self
        passWordField.textAlignment = .center
        passWordField.isSecureTextEntry = true
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
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)

        loginButton.backgroundColor  = .blue
        
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
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
    
    
    @objc
    func loginButtonPressed() {
        print("Button pressed")
        
        // optional unwrapping, checking for null
        // if username field is not empty, username is whatever is in the username text field
        if let username: String = userNameField.text,
            let password = passWordField.text {
            if(!username.isEmpty && !password.isEmpty){
                print(username)
                // upper case Username... refers to class
                // (username is from other file : this username is from the username we get above)
                let usernameViewController = UsernameViewController(username: username)
                    //UsernameViewController(username: username)
                
               self.navigationController?.pushViewController(usernameViewController, animated: true)
                
            } else{
                print("Not Entered")

            }
        }
        
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
