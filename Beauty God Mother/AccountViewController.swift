//
//  AccountViewController.swift
//  Beauty God Mother
//
//  Created by Anisha  KATUMBA  on 14/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ImageIO



class AccountViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    @IBOutlet weak var accountPic: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picLoader: UIActivityIndicatorView!
    
    
    var loggedInUser: AnyObject? = .none
    var databaseRef = Database.database().reference()
    var storageRef = Storage.storage().reference()
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.loggedInUser = Auth.auth().currentUser
        self.databaseRef.child("users").child(self.loggedInUser!.uid).observeSingleEvent(of: .value) { (snapshot:DataSnapshot)in
            
            
            self.email.text = ((snapshot.value as? NSDictionary)? ["email"] as! String)
            self.name.text = ((snapshot.value as? NSDictionary)? ["name"] as! String)

            
            if((snapshot.value as? NSDictionary)? ["account_picture"] != nil){
                let databaseAccountPic = (snapshot.value as? NSDictionary)?["account_picture"]
                as! String
                
                let data = NSData(contentsOf: NSURL(string: databaseAccountPic)! as URL)
                self.setAccountPic(imageView: self.accountPic, imageToSet: UIImage(data: data! as Data,scale:1.0)!
           ) }
            
        }

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    
    }
    @IBAction func logoutTapped(_ sender: Any) {
        do {
                try Auth.auth().signOut()
            } catch let logoutError {
                print(logoutError)
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let signInVC = storyboard.instantiateViewController(withIdentifier: "LoginPageID")
            self.present(signInVC, animated: true, completion: nil)
        }
    
    
    internal func setAccountPic(imageView: UIImageView, imageToSet:UIImage)
    {
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        imageView.image = imageToSet
        
    }
    
    
    @IBAction func didTapAccountPic(_ sender: UITapGestureRecognizer) {
        let myActionSheet = UIAlertController(title: "Account Picture", message: "Select", preferredStyle: UIAlertController.Style.actionSheet)
        
        let ViewPicture = UIAlertAction(title:"View Picture", style: UIAlertAction.Style.default){ (action) in
            
            let imageView = sender.view as! UIImageView
            let newImageView = UIImageView(image: imageView.image)
            
            newImageView.frame = self.view.frame
            newImageView.backgroundColor = UIColor.black
            newImageView.contentMode = .scaleAspectFit
            newImageView.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissFullScreenImage))
            
            newImageView.addGestureRecognizer(tap)
            self.view.addSubview(newImageView)
        }
        
        let photoGallery = UIAlertAction(title: "Photos", style: UIAlertAction.Style.default) {(action) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)
            {
                    self.imagePicker.delegate = self
                self.imagePicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
                
            }
            }
            
        let camera = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default)
        { (action) in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
            {
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.imagePicker.allowsEditing = true
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        myActionSheet.addAction(ViewPicture)
        myActionSheet.addAction(photoGallery)
        myActionSheet.addAction(camera)
        
        myActionSheet.addAction(UIAlertAction(title:"cancel", style: UIAlertAction.Style.cancel, handler:nil))

        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    @objc func dismissFullScreenImage(sender:UITapGestureRecognizer)
    {
        sender.view?.removeFromSuperview()
    }
    

//
 //   self.dismiss(animated: true, completion: nil)

}




