//
//  CustomCell.swift
//  Beauty God Mother
//
//  Created by Jessica Owusu on 3/25/19.
//  Copyright © 2019 BGM. All rights reserved.
//

//import Foundation
//import UIKit
//
//class CustomCell: UITableViewCell {
//
//    let serviceImage: UIImage?
//    let service: String?
//    let price: Int?
//    let time: Int?
//    let serviceDescription: String?
//
//  var serviceImageView : UIImageView = {
//        var imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//
//    var serviceView : UITextView = {
//        var textView = UITextView()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
//
//    var serviceDescriptionView : UITextView = {
//        var textView = UITextView()
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        return textView
//    }()
//
//
//
//    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        self.addSubview(serviceImageView)
//        self.addSubview(serviceView)
//        self.addSubview(serviceDescriptionView)
//
//        serviceImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        serviceImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        serviceImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        serviceImageView.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//
//        serviceView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
//        serviceView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        serviceView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        serviceView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//
//}
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        if let service = service {
//            serviceView.text = service
//        }
//        if let image = serviceImage {
//            serviceImageView.image = image
//
//        }
//    }
//
//    required init(coder aDecoder: NSCoder){
//        fatalError("init has not been blah")
//    }
//}
