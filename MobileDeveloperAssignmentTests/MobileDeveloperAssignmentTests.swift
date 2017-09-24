//
//  MobileDeveloperAssignmentTests.swift
//  MobileDeveloperAssignmentTests
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import XCTest
@testable import MobileDeveloperAssignment

class MobileDeveloperAssignmentTests: XCTestCase {
    
    var firstItem : Item!
    var secondItem : Item!
    var thirdItem : Item!
    var fourthItem : Item!
    
    var itemsList : [Item]!
    var filteredItem : [Item]!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        firstItem = Item(withName: "First Item", courseType: "elearning", price: "1.0")
        secondItem = Item(withName: "Second Item", courseType: "webprogramming", price: "0.0")
        thirdItem = Item(withName: "Third Item", courseType: "elearning", price: "1.5")
        fourthItem = Item(withName: "Fourth Item", courseType: "sofwareprogramming", price: "1.0")
        
        itemsList = [firstItem, secondItem, thirdItem, fourthItem]
        filteredItem = itemsList
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
        firstItem = nil
        secondItem = nil
        thirdItem = nil
        fourthItem = nil
        itemsList = nil
        filteredItem = nil
    }
    
    func testFilterElearningItemsArray() {
        filteredItem = filteredItem.filter{$0.courseType.contains("elearning")}
        XCTAssertTrue(filteredItem.count == 2)
    }
    
    func testFilterPriceItemsArray() {
        filteredItem = filteredItem.filter{Double($0.itemPrice)! > 1.0 }
        XCTAssertTrue(filteredItem.count == 1)
    }
    
}
