//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Deepika Onteru on 11/8/19.
//  Copyright © 2019 Deepika Onteru. All rights reserved.
//

import UIKit

struct Post {
    let image: UIImage
    let caption: String
}

class PostTableViewCell: UITableViewCell {

    var postImageView: UIImageView
    
    var postCaption:  UILabel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        postImageView =  UIImageView()
        postCaption = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpImageView()
        setUpCaptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpImageView() {
        
        contentView.addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.backgroundColor = .red
        
        let constraints = [
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            postImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            postImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            postImageView.heightAnchor.constraint(equalToConstant: 400)
        ]
        
        for c in constraints {
            c.isActive = true
        }
        
    }
    
    func setUpCaptionLabel() {
        contentView.addSubview(postCaption)
        postCaption.translatesAutoresizingMaskIntoConstraints = false
               
        postCaption.text = "vajdvnkaj"
        let constraints = [
            postCaption.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 20),
            postCaption.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            postCaption.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
               
        for c in constraints {
            c.isActive = true
        }
        
        
       
    }
    
}
