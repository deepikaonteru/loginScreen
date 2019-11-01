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
    
    var tableView: UITableView
    
    var posts: [[String]] = [["section 1 post1", "section 1 post2", "section 1 post3"],
                             ["section 2 post1", "section 2 post2", "section 2 post3", "section 2 post4"]
    ]
    
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
    
    func setUpTableView() {
        //add tableview as a subview
        view.addSubview(tableView)
        
        //set translates autoresizineajsbd = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //create our constraints
        let topConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        let leftConstraint = tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        let rightConstraint = tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        let bottomConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
               
        //activate constraints
        topConstraint.isActive = true
        leftConstraint.isActive = true
        rightConstraint.isActive = true
        bottomConstraint.isActive = true
        
        //set tableView's delegate and datasource, delegating where it gets data from (cells) = self
        tableView.delegate = self
        tableView.dataSource = self
        
        //register cells
        //our table view can display any cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "postCellId")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int  {
        return posts.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section:\(section)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellId", for: indexPath)
        //cell.textLabel?.text = "section: \(indexPath.section) row: \(indexPath.row)"
        //cell.textLabel?.text = posts[indexPath.row]
        cell.textLabel?.text = posts[indexPath.section][indexPath.row]
        return cell
    }
    
}
