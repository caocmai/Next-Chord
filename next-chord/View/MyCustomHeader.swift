//
//  MyCustomHeader.swift
//  next-chord
//
//  Created by Cao Mai on 3/20/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

// Got from Apple's documentation
class MyCustomHeader: UITableViewHeaderFooterView {
    
    static var identifier: String = "sectionHeader"

    
    let title : UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 24.0)
        title.textColor = #colorLiteral(red: 0.1329008341, green: 0.1329008341, blue: 0.1329008341, alpha: 1)
        return title
    }()
    
    let image = UIImageView()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        contentView.backgroundColor = #colorLiteral(red: 0.7134668231, green: 0.7134668231, blue: 0.7134668231, alpha: 1)
//        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false

//        contentView.addSubview(image)
        contentView.addSubview(title)

        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

