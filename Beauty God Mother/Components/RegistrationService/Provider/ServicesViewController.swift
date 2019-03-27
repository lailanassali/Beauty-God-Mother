//
//  ServicesViewController.swift
//  Beauty God Mother
//
//  Created by Shanju Bakeerathan on 07/03/2019.
//  Copyright © 2019 BGM. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController  {
    
    var button = DropDownBtn()
    let rs = RegistrationService.shared
    
    @IBOutlet weak var nameOfService: UITextField!
    @IBOutlet weak var priceLabel: UITextField!
    @IBOutlet weak var durationLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    @IBOutlet weak var addtionalnfoLabel: UITextField!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        button = DropDownBtn.init(frame:  CGRect(x: 0, y: 0, width: 0, height: 0))
        button.setTitle("Select a beauty service", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 24).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor) .isActive = true
        button.widthAnchor.constraint(equalToConstant: 350).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        button.dropView.dropDownOptions = ["Hair","Nails","Grooming","Massage"]
        
    }
    
    
    @IBAction func NextButton(_ sender: Any) {
        // stage 1
        guard let serviceName = nameOfService.text, let price = priceLabel.text, let duration = durationLabel.text, let description = descriptionLabel.text, let additionalInformation = addtionalnfoLabel.text else {return}
        
        // stage 2
        if !rs.fieldsAreNotEmpty(name: serviceName, password: price, confirmPassword: duration, email: description) { return }
        
        // save details to registration service
        rs.serviceName = serviceName
        rs.price = price
        rs.duration = duration
        rs.description = description
        rs.additionalInformation = additionalInformation
        
        let controller = storyboard!.instantiateViewController(withIdentifier: "Swipe3VC")
        self.present(controller, animated: true, completion: nil)
    }
    
    
}

protocol dropDownProtocol{
    func dropDownPressed(String: String)
}

class DropDownBtn: UIButton,dropDownProtocol{
    func dropDownPressed(String string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    
    var dropView = DropDownView()
    var height = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        dropView =  DropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self
        
        dropView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront( dropView)
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    
    var isOpen =  false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false  {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            NSLayoutConstraint.activate( [self.height])
            
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
                
            }else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:
                {
                    self.dropView.layoutIfNeeded()
                    self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil )
            
            
        } else  {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate( [self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:
                {
                    self.dropView.center.y -= self.dropView.frame.height / 2
                    self.dropView.layoutIfNeeded()
            }, completion: nil )
            
            
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func dismissDropDown(){
         isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate( [self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations:
            {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
        }, completion: nil )
        
    }

}

class DropDownView: UIView,UITableViewDelegate,UITableViewDataSource{
    
    var dropDownOptions = [String]()
    
    var tableView = UITableView()
    
    var delegate : dropDownProtocol!
    
    
    override init(frame: CGRect) {
      super.init(frame:  frame)
        
    tableView.backgroundColor = UIColor.lightGray
    self.backgroundColor = UIColor.white
     
    tableView.delegate = self
    tableView.dataSource = self
        
    tableView.translatesAutoresizingMaskIntoConstraints = false
        
    self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell =  UITableViewCell()
        
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor =  UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        self.delegate.dropDownPressed(String: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        print(dropDownOptions[indexPath.row])
        rs.serviceType = dropDownOptions[indexPath.row]
    }
    let rs = RegistrationService.shared
    
}






