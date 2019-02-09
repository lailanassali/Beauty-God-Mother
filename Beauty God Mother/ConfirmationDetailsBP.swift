//
//  ConfirmationDetailsBP.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 07/02/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class confirmationDetailsBPViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.frame = view.frame
        
    }
    
    
    
    
    
}




