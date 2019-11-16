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

struct InstaPost: Codable {
    var caption: String
    var user: String
}

struct PostResponse: Codable {
    var posts: [InstaPost]
}

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // 1. make an instance of UITableView
    var tableView: UITableView
    
//    var posts: [Post] = [
//        Post(image: UIImage(named: "pancakes.png")!, caption: "yumm I love pancakes"),
//        Post(image: UIImage(named: "cookies.png")!, caption: "yumm I love cookies"),
//        Post(image: UIImage(named: "oreos.png")!, caption: "yumm I love oreos"),
//        Post(image: UIImage(named: "cupcake.png")!, caption: "yumm I love cupcake"),
//    ]
    
    var posts: [InstaPost] = []
    
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
//        getInstaPosts()
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCellID", for: indexPath)
            cell.textLabel?.text = posts[indexPath.row].caption
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 465
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected\(indexPath.row)")
    }
    
    func getInstaPosts() {
        // url that we want to make the request to
            guard let url = URL(string: "https://api.myjson.com/bins/1djp56") else {
                print("invalid url")
                return
            }
        // create the request object using our url
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            //start new session everytime its a new post
            let session = URLSession(configuration: URLSessionConfiguration.default)
            
            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("There was an error")
                    return
                }
                guard let data = data else {
                    print ("data is nil")
                    return
                }
                
                print(data)
                let decoder = JSONDecoder()
                
                do {
                    let postResponse = try decoder.decode(PostResponse.self, from: data)
                    self.posts = postResponse.posts
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
    //                print(postResponse)
    //                for post in postResponse.posts {
    //                    print(post.caption)
                } catch {
                    print("There was an errror.")
                }
    //            print("completed network request")
            }
            task.resume()
            print("sdskjjasn")
        }

}
    

