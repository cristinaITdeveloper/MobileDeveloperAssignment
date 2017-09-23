//
//  Utility.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import UIKit

let ITEM_CELL_IDENTIFIER : String = "itemCell"


func showAlert(inViewController: UIViewController, title: String, message: String, buttonCancelText: String?, buttonOKText: String?, actionOK: Selector?, actionCancel : Selector? ) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    if buttonCancelText != nil {
        let cancelAction = UIAlertAction(title: buttonCancelText!, style: .cancel) { action in
            // ...
            if (actionCancel != nil) {
                inViewController.perform(actionCancel!)
                
            }
            alertController.dismiss(animated: true, completion: {
                
            })
        }
        alertController.addAction(cancelAction)
    }
    
    if buttonOKText != nil {
        
        let OKAction = UIAlertAction(title: buttonOKText!, style: .default) { action in
            // ...
            if (actionOK != nil) {
                inViewController.perform(actionOK!)
            }
            alertController.dismiss(animated: true, completion: {
                
            })
            
        }
        alertController.addAction(OKAction)
    }
    
    
    inViewController.present(alertController, animated: true) {
        
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8), options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
