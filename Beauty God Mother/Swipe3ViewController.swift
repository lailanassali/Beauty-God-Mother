//
//  Swipe3ViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 18/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class Swipe3ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var addProfilePicture: UIButton!
  
    
    @IBAction func `import`(_ sender: Any)
    
    {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image,animated: true )
        {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
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
