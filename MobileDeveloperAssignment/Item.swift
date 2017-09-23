//
//  Item.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import Foundation


class Item : NSObject, NSCoding{

    
    var accessStatus : Int!
    var courseType : String!
    var duration : String!
    var isNew : Bool!
    var isOpened : String!
    var isUserEnrolled : Bool!
    var isUserSubscribed : Bool!
    var itemCanEnroll : String!
    var itemCategory : String!
    var itemCode : String!
    var itemDescription : String!
    var itemId : String!
    var itemLanguage : String!
    var itemName : String!
    var itemPolicy : String!
    var itemPrice : String!
    var itemRating : Int!
    var itemThumbnail : String!
    var itemType : String!
    var itemTypeInt : String!
    var itemVisibility : String!
    var numberOfCourses : Int!
    var priceStatus : Int!
    var waiting : Bool!
    
  
    init(fromDictionary dictionary: NSDictionary){
        
        accessStatus = dictionary["access_status"] as? Int
        courseType = dictionary["course_type"] as? String
        duration = dictionary["duration"] as? String
        isNew = dictionary["is_new"] as? Bool
        isOpened = dictionary["is_opened"] as? String
        isUserEnrolled = dictionary["is_user_enrolled"] as? Bool
        isUserSubscribed = dictionary["is_user_subscribed"] as? Bool
        itemCanEnroll = dictionary["item_can_enroll"] as? String
        itemCategory = dictionary["item_category"] as? String
        itemCode = dictionary["item_code"] as? String
        itemDescription = dictionary["item_description"] as? String
        itemId = dictionary["item_id"] as? String
        itemLanguage = dictionary["item_language"] as? String
        itemName = dictionary["item_name"] as? String
        itemPolicy = dictionary["item_policy"] as? String
        itemPrice = dictionary["item_price"] as? String
        itemRating = dictionary["item_rating"] as? Int
        itemThumbnail = dictionary["item_thumbnail"] as? String
        itemType = dictionary["item_type"] as? String
        itemTypeInt = dictionary["item_type_int"] as? String
        itemVisibility = dictionary["item_visibility"] as? String
        numberOfCourses = dictionary["number_of_courses"] as? Int
        priceStatus = dictionary["price_status"] as? Int
        waiting = dictionary["waiting"] as? Bool
    }
    
    
    func toDictionary() -> NSDictionary{
        
        let dictionary = NSMutableDictionary()
        if accessStatus != nil{
            dictionary["access_status"] = accessStatus
        }
        if courseType != nil{
            dictionary["course_type"] = courseType
        }
        if duration != nil{
            dictionary["duration"] = duration
        }
        if isNew != nil{
            dictionary["is_new"] = isNew
        }
        if isOpened != nil{
            dictionary["is_opened"] = isOpened
        }
        if isUserEnrolled != nil{
            dictionary["is_user_enrolled"] = isUserEnrolled
        }
        if isUserSubscribed != nil{
            dictionary["is_user_subscribed"] = isUserSubscribed
        }
        if itemCanEnroll != nil{
            dictionary["item_can_enroll"] = itemCanEnroll
        }
        if itemCategory != nil{
            dictionary["item_category"] = itemCategory
        }
        if itemCode != nil{
            dictionary["item_code"] = itemCode
        }
        if itemDescription != nil{
            dictionary["item_description"] = itemDescription
        }
        if itemId != nil{
            dictionary["item_id"] = itemId
        }
        if itemLanguage != nil{
            dictionary["item_language"] = itemLanguage
        }
        if itemName != nil{
            dictionary["item_name"] = itemName
        }
        if itemPolicy != nil{
            dictionary["item_policy"] = itemPolicy
        }
        if itemPrice != nil{
            dictionary["item_price"] = itemPrice
        }
        if itemRating != nil{
            dictionary["item_rating"] = itemRating
        }
        if itemThumbnail != nil{
            dictionary["item_thumbnail"] = itemThumbnail
        }
        if itemType != nil{
            dictionary["item_type"] = itemType
        }
        if itemTypeInt != nil{
            dictionary["item_type_int"] = itemTypeInt
        }
        if itemVisibility != nil{
            dictionary["item_visibility"] = itemVisibility
        }
        if numberOfCourses != nil{
            dictionary["number_of_courses"] = numberOfCourses
        }
        if priceStatus != nil{
            dictionary["price_status"] = priceStatus
        }
        if waiting != nil{
            dictionary["waiting"] = waiting
        }
        return dictionary
    }
   
    @objc required init(coder aDecoder: NSCoder){
        
        accessStatus = aDecoder.decodeObject(forKey: "access_status") as? Int
        courseType = aDecoder.decodeObject(forKey: "course_type") as? String
        duration = aDecoder.decodeObject(forKey: "duration") as? String
        isNew = aDecoder.decodeObject(forKey: "is_new") as? Bool
        isOpened = aDecoder.decodeObject(forKey: "is_opened") as? String
        isUserEnrolled = aDecoder.decodeObject(forKey: "is_user_enrolled") as? Bool
        isUserSubscribed = aDecoder.decodeObject(forKey: "is_user_subscribed") as? Bool
        itemCanEnroll = aDecoder.decodeObject(forKey: "item_can_enroll") as? String
        itemCategory = aDecoder.decodeObject(forKey: "item_category") as? String
        itemCode = aDecoder.decodeObject(forKey: "item_code") as? String
        itemDescription = aDecoder.decodeObject(forKey: "item_description") as? String
        itemId = aDecoder.decodeObject(forKey: "item_id") as? String
        itemLanguage = aDecoder.decodeObject(forKey: "item_language") as? String
        itemName = aDecoder.decodeObject(forKey: "item_name") as? String
        itemPolicy = aDecoder.decodeObject(forKey: "item_policy") as? String
        itemPrice = aDecoder.decodeObject(forKey: "item_price") as? String
        itemRating = aDecoder.decodeObject(forKey: "item_rating") as? Int
        itemThumbnail = aDecoder.decodeObject(forKey: "item_thumbnail") as? String
        itemType = aDecoder.decodeObject(forKey: "item_type") as? String
        itemTypeInt = aDecoder.decodeObject(forKey: "item_type_int") as? String
        itemVisibility = aDecoder.decodeObject(forKey: "item_visibility") as? String
        numberOfCourses = aDecoder.decodeObject(forKey: "number_of_courses") as? Int
        priceStatus = aDecoder.decodeObject(forKey: "price_status") as? Int
        waiting = aDecoder.decodeObject(forKey: "waiting") as? Bool
        
    }
    
    
    @objc func encode(with aCoder: NSCoder) {
        
        if accessStatus != nil{
            aCoder.encode(accessStatus, forKey: "access_status")
        }
        if courseType != nil{
            aCoder.encode(courseType, forKey: "course_type")
        }
        if duration != nil{
            aCoder.encode(duration, forKey: "duration")
        }
        if isNew != nil{
            aCoder.encode(isNew, forKey: "is_new")
        }
        if isOpened != nil{
            aCoder.encode(isOpened, forKey: "is_opened")
        }
        if isUserEnrolled != nil{
            aCoder.encode(isUserEnrolled, forKey: "is_user_enrolled")
        }
        if isUserSubscribed != nil{
            aCoder.encode(isUserSubscribed, forKey: "is_user_subscribed")
        }
        if itemCanEnroll != nil{
            aCoder.encode(itemCanEnroll, forKey: "item_can_enroll")
        }
        if itemCategory != nil{
            aCoder.encode(itemCategory, forKey: "item_category")
        }
        if itemCode != nil{
            aCoder.encode(itemCode, forKey: "item_code")
        }
        if itemDescription != nil{
            aCoder.encode(itemDescription, forKey: "item_description")
        }
        if itemId != nil{
            aCoder.encode(itemId, forKey: "item_id")
        }
        if itemLanguage != nil{
            aCoder.encode(itemLanguage, forKey: "item_language")
        }
        if itemName != nil{
            aCoder.encode(itemName, forKey: "item_name")
        }
        if itemPolicy != nil{
            aCoder.encode(itemPolicy, forKey: "item_policy")
        }
        if itemPrice != nil{
            aCoder.encode(itemPrice, forKey: "item_price")
        }
        if itemRating != nil{
            aCoder.encode(itemRating, forKey: "item_rating")
        }
        if itemThumbnail != nil{
            aCoder.encode(itemThumbnail, forKey: "item_thumbnail")
        }
        if itemType != nil{
            aCoder.encode(itemType, forKey: "item_type")
        }
        if itemTypeInt != nil{
            aCoder.encode(itemTypeInt, forKey: "item_type_int")
        }
        if itemVisibility != nil{
            aCoder.encode(itemVisibility, forKey: "item_visibility")
        }
        if numberOfCourses != nil{
            aCoder.encode(numberOfCourses, forKey: "number_of_courses")
        }
        if priceStatus != nil{
            aCoder.encode(priceStatus, forKey: "price_status")
        }
        if waiting != nil{
            aCoder.encode(waiting, forKey: "waiting")
        }
        
    }
    
}
