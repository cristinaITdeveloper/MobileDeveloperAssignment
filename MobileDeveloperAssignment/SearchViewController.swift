//
//  SearchViewController.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var itemNameTextField : UITextField!
    @IBOutlet weak var courseTypeTextField : UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        itemNameTextField.delegate = self
        courseTypeTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == itemNameTextField {
            courseTypeTextField.becomeFirstResponder()
        }
    }
    
    @IBAction func didTapOnSearchButton() {
        
        let itemName = itemNameTextField.text
        let courseType = courseTypeTextField.text
        
        ConnectionManager.shared.getItems(itemName: itemName, courseType: courseType) { (response, error, items) in
            if error != nil {
                showAlert(inViewController: self, title: error!.domain , message: error!.localizedDescription, buttonCancelText: "OK", buttonOKText: nil, actionOK: nil, actionCancel: nil)
                return
            }
            guard items != nil else {
                showAlert(inViewController: self, title: "Errore", message: "Non ci sono dati", buttonCancelText: "OK", buttonOKText: nil, actionOK: nil, actionCancel: nil)
                return
            }
            
            let itemListViewController = ItemsViewController()
            itemListViewController.itemsList = items!
            
            self.navigationController?.pushViewController(itemListViewController, animated: true)
        }
    }
    
 

}
