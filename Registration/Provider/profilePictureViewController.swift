//
//  Swipe3ViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 18/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class profilePictureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let rs = RegistrationService.shared
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var bioLabel: UITextField!
    @IBOutlet weak var imageAlert: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageAlert.isHidden = true
        
    }
    
     func imageIsSelected(profilePicture: UIImageView) -> Bool {
        
        if (profilePicture.image != nil){
            return true
        } else {
            imageAlert?.isHidden = false
            return false }
    }
    
    @IBAction func NextButton(_ sender: Any) {
        // stage 1
        guard let profileImageView = myImageView, let bio = bioLabel.text else {return}
        
        // stage 2
        if !imageIsSelected(profilePicture: profileImageView) { return }
        
        // save details to registration service
        rs.profileImage = profileImageView
        rs.bio = bio
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "ConnectionsVC")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func `import`(_ sender: Any) 
    
    {
        let image = UIImagePickerController()
        image.allowsEditing = true
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image,animated: true )
        {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.editedImage] as? UIImage {
            myImageView.image = image
        }else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            myImageView.image = image
        }
        else
        {
            //error message
        }
        self.dismiss(animated: true, completion: nil)
    }
}
