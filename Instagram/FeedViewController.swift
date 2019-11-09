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

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // 1. make an instance of UITableView
    var tableView: UITableView
    
    var posts: [Post] = [
        Post(image: UIImage(named: "pancakes.png")!, caption: "yumm I love pancakes"),
        Post(image: UIImage(named: "cookies.png")!, caption: "yumm I love cookies"),
        Post(image: UIImage(named: "oreos.png")!, caption: "yumm I love oreos"),
        Post(image: UIImage(named: "cupcake.png")!, caption: "yumm I love cupcake"),
    ]
    
    // make initializer
    init() {
        self.tableView = UITableView()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTableView()
        
    }
    
    // 2. add constraints
    func setUpTableView() {
        //add tableview as a subview
        view.addSubview(tableView)
        
        //set translates autoresizineajsbd = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //create our constraints
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        //activate constraints
        for constraint in constraints {
            constraint.isActive = true
        }
        
        //  = self is setting dataSource for that table view to feedViewController
        tableView.delegate  = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "postCellID")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "customCellID")

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellID", for: indexPath) as! PostTableViewCell
        //cell.textLabel?.text = posts[indexPath.row]
        cell.postImageView.image = posts[indexPath.row].image
        cell.postCaption.text = posts[indexPath.row].caption
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 465
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected\(indexPath.row)")
    }
    
    
}
