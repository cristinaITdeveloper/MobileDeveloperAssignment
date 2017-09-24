//
//  ItemsViewController.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FilterDelegate {

    var itemsList : [Item]!
    
    var filteredItemsList : [Item]!
    
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var countItemsLabel : UILabel!
    
    var selectedIndexPath : [IndexPath]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: ITEM_CELL_IDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        countItemsLabel.text = "\(itemsList.count) Items"
        
        filteredItemsList = itemsList
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filters", style: .plain, target: self, action: #selector(ItemsViewController.didTapFiltersButton))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didTapFiltersButton() {
        let selectFiltersViewController = SelectFilterViewController()
        selectFiltersViewController.delegate = self
        selectFiltersViewController.selectedRow = selectedIndexPath ?? [IndexPath]()
        selectFiltersViewController.modalPresentationStyle = .overCurrentContext
        present(selectFiltersViewController, animated: true) {
            
            UIView.animate(withDuration: 0.3, animations: {
                DispatchQueue.main.async {
                    selectFiltersViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
                }
            })
        }
    }
    
    func didClearAllFilter() {
        dismiss(animated: true) { 
            self.filteredItemsList = self.itemsList
            self.countItemsLabel.text = "\(self.filteredItemsList.count) Items"
            self.tableView.reloadData()
        }
    }
    
    func didSelectFilters(_ indexPaths: [IndexPath]) {
        self.selectedIndexPath = indexPaths
        dismiss(animated: true) {
            if indexPaths.count == 0 {
                self.filteredItemsList = self.itemsList
            }
            else {
                var alreadySort : Bool = false
                
                for indexPath in indexPaths {
                    switch indexPath.section {
                    case 0:
                        if indexPath.row == 0 {
                            //SORT A to Z
                            if alreadySort == false {
                                self.filteredItemsList = self.filteredItemsList.sorted { $0.itemName.lowercased() < $1.itemName.lowercased() }
                                alreadySort = true
                            }
                        }
                        else if indexPath.row == 1{
                            // SORT Z to A
                            if alreadySort == false {
                                self.filteredItemsList = self.filteredItemsList.sorted { $0.itemName.lowercased() > $1.itemName.lowercased() }
                                alreadySort = true
                            }
                        }
                        break
                    case 1:
                        if indexPath.row == 0 {
                            // Filter by Type: learning_course_type
                            self.filteredItemsList = self.filteredItemsList.filter{$0.courseType.contains("elearning")}
                        }
                        else if indexPath.row == 1 {
                            // Filter by Price: 0.00
                            self.filteredItemsList = self.filteredItemsList.filter{$0.itemPrice.contains("0.00")}
                        }
                        break
                    default:
                        break
                    }
                }
            }
            
            self.countItemsLabel.text = "\(self.filteredItemsList.count) Items"
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: ITEM_CELL_IDENTIFIER, for: indexPath) as! ItemTableViewCell
        cell.selectionStyle = .none
        cell.configureWithItem(filteredItemsList[indexPath.row])
        
        return cell
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredItemsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}
