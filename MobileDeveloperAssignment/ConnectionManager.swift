//
//  ConnectionManager.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import UIKit

class ConnectionManager: NSObject {
    
     static let shared = ConnectionManager()
    
     static let reachability: Reachability? = Reachability()
    
    func getItems(itemName: String?, courseType: String?, completionHandler: (( URLResponse?, NSError?, [Item]?) -> Void)?){
        
        if let requestUrl = Globals.shared.getItemsUrl(itemName: itemName, courseType: courseType) {
            
            print(NSString(format: "%@ - is requesting with URL '%@'", self, requestUrl as CVarArg))
            
            if ConnectionManager.reachability != nil && ConnectionManager.reachability!.isReachable == false {
                
                let errorToShow = NSError(domain: "Errore", code: 500, userInfo: [NSLocalizedDescriptionKey: "Errore di connessione"])
                if completionHandler != nil {
                    completionHandler!(nil, errorToShow, nil)
                }
                return
                
            }
            
            var request = URLRequest(url: requestUrl as URL)
            request.httpMethod = "GET"
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = Globals.shared.sharedSession.dataTask(with: request,
                                                             completionHandler: {data, response, error -> Void in
                                                                
                                                                
                                                                if error != nil{
                                                                    DispatchQueue.main.async(execute: { () -> Void in
                                                                        print(NSString(format:"%@ - received error:\n%@", self, error!.localizedDescription))
                                                                        if completionHandler != nil {
                                                                            completionHandler!(nil, error! as NSError?, nil);
                                                                        }
                                                                    })
                                                                    
                                                                    return
                                                                }
                                                                DispatchQueue.main.async(execute: { () -> Void in
                                                                    
                                                                    print(NSString(format: "%@ - request with URL '%@' received data (UTF8):\n%@", self, request.url! as CVarArg, NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!))
                                                                })
                                                                
                                                                
                                                                if data!.count == 0{
                                                                    let dataError = NSError(domain: NSLocalizedString("Errore", comment: ""), code: 0, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Nessun dato ricevuto", comment: "")])
                                                                    
                                                                    DispatchQueue.main.async(execute: { () -> Void in
                                                                        print(NSString(format:"%@ - received error:\n%@", self, dataError.localizedDescription))
                                                                        if completionHandler != nil {
                                                                            completionHandler!(nil, dataError,nil);
                                                                        }
                                                                    })
                                                                    
                                                                    return
                                                                }
                                                                
                                                                var jsonReadingError: NSError?
                                                                var json: Any?
                                                                do {
                                                                    json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves)
                                                                } catch let error as NSError {
                                                                    jsonReadingError = error
                                                                    json = nil
                                                                } catch {
                                                                    fatalError()
                                                                }
                                                                
                                                                
                                                                if(jsonReadingError != nil) {
                                                                    DispatchQueue.main.async(execute: { () -> Void in
                                                                        print(NSString(format:"%@ - received error:\n%@", self, jsonReadingError!.localizedDescription))
                                                                        if completionHandler != nil {
                                                                            completionHandler!(nil, jsonReadingError!,nil)
                                                                        }
                                                                    })
                                                                    return
                                                                }
                                                                
                                                                print(json ?? "json not valid")
                                                                
                                                                if let parseJSON : Dictionary<String,AnyObject> = json as? Dictionary<String,AnyObject> {
                                                                    
                                                                    
                                                                    let error = parseJSON["status"] as? String
                                                                    
                                                                    if error != nil && error != "ok" {
                                                                        
                                                                        let errorToShow = NSError(domain: "Errore", code: 0, userInfo: [NSLocalizedDescriptionKey: error!])
                                                                        DispatchQueue.main.async(execute: { () -> Void in
                                                                            print(NSString(format:"%@ - received error:\n%@", self, errorToShow))
                                                                            if completionHandler != nil {
                                                                                completionHandler!(nil, errorToShow, nil)
                                                                            }
                                                                        })
                                                                        return
                                                                    }
                                                                    else{
                                                                        
                                                                        let responseJSON  : Dictionary<String,AnyObject> = parseJSON
                                                                        
                                                                        var items = [Item]()
                                                                        if let dataArray = responseJSON["data"] as? NSDictionary{
                                                                            if let itemsArray = dataArray["items"] as? [NSDictionary] {
                                                                                for dic in itemsArray{
                                                                                    let value = Item(fromDictionary: dic)
                                                                                    items.append(value)
                                                                                }
                                                                            }
                                                                        }
                                                                        
                                                                        DispatchQueue.main.async(execute: { () -> Void in
                                                                            
                                                                            if completionHandler != nil {
                                                                                completionHandler!(response , nil, items)
                                                                            }
                                                                        })
                                                                        
                                                                    }
                                                                }
                                                                else {
                                                                    
                                                                    let jsonStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                                                                    
                                                                    print(NSString(format:"%@ - impossibile parsare il json : %@", self, jsonStr!))
                                                                    
                                                                    let errorToShow = NSError(domain: "Errore", code: 0, userInfo: [NSLocalizedDescriptionKey: "Impossibile parsare il json"])
                                                                    
                                                                    DispatchQueue.main.async(execute: { () -> Void in
                                                                        
                                                                        if completionHandler != nil {
                                                                            completionHandler!(nil, errorToShow, nil)
                                                                        }
                                                                    })
                                                                    
                                                                    return
                                                                }
            })
            
            task.resume()
        
        }
        
    }
    
    func getImageDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        Globals.shared.sharedSession.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}
