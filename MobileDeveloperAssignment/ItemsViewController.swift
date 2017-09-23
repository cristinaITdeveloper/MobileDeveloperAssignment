//
//  ItemsViewController.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var itemsList : [Item]!
    
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var countItemsLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ITEM_CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        
        countItemsLabel.text = "\(itemsList.count) Items"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: ITEM_CELL_IDENTIFIER, for: indexPath) as! ItemTableViewCell
        cell.selectionStyle = .none
        cell.configureWithItem(itemsList[indexPath.row])
        
        return cell
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
