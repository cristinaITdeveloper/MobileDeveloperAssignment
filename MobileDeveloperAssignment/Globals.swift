//
//  Globals.swift
//  WordpressBlog
//
//  Created by Cristina on 19/07/16.
//  Copyright © 2016 MDSLab. All rights reserved.
//

import UIKit

class Globals: NSObject, URLSessionDelegate {
    
    let baseUrl = "https://demomobile.docebosaas.com/learn/v1/catalog"
    
    static let shared = Globals()
    
    var sharedSession : URLSession!
    
    override init() {
        super.init()
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120
        sharedSession = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    
    func getItemsUrl(itemName: String?, courseType: String? ) -> URL?{
        var urlString = baseUrl
        
        if itemName != nil && courseType != nil && itemName! != "" && courseType! != ""{
            urlString = "\(urlString)?item_name=\(itemName!)&course_type=\(courseType!)"
        }
        else if itemName != nil && itemName! != "" {
            urlString = "\(urlString)?item_name=\(itemName!)"
        }
        else if courseType != nil && courseType! != "" {
            urlString = "\(urlString)?course_type=\(courseType!)"
        }
        
        
        if let escapedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            print("URL String escaped \(escapedUrlString)")
            
            return URL(string: escapedUrlString)
        }
        return nil
        
    }
}

