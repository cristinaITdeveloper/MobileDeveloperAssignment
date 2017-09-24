//
//  SelectFilterViewController.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 24/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import UIKit

class SelectFilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var doneButton : UIButton!
    @IBOutlet weak var clearFilterButton : UIButton!
    @IBOutlet weak var baseView : UIView!
    
    var selectedRow : [IndexPath]!
    
    var delegate : FilterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsMultipleSelection = true
        view.backgroundColor = .clear
        view.isOpaque = false
        if selectedRow == nil {
            selectedRow = [IndexPath]()
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: FILTER_CELL_IDENTIFIER)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func didTapClearFilterButton() {
        deselectAllRows()
        view.backgroundColor = .clear
        delegate?.didClearAllFilter()
    }
    
    @IBAction func didTapDoneButton() {
        view.backgroundColor = .clear
        delegate?.didSelectFilters(selectedRow)
    }
    
    func deselectAllRows() {
        for section in 0..<tableView.numberOfSections {
            for row in 0..<tableView.numberOfRows(inSection: section) {
                let indexPath = IndexPath(row: row, section: section)
                _ = tableView.delegate?.tableView?(tableView, willDeselectRowAt: indexPath)
                tableView.deselectRow(at: indexPath, animated: false)
                tableView.delegate?.tableView?(tableView, didDeselectRowAt: indexPath)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        if !selectedRow.contains(indexPath) {
            selectedRow.append(indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        
        
        
        if let index = selectedRow.index(of: indexPath) {
            selectedRow.remove(at: index)
        }
        
        
        print("selectedRow \(selectedRow) at indexPath \(indexPath)")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        print("selectedRow \(selectedRow)")
        
        print("willDisplay cell selected \(selectedRow.contains(indexPath)) at indexPath \(indexPath)")
        
        if selectedRow.contains(indexPath) {
            _ = tableView.delegate?.tableView?(tableView, willSelectRowAt: indexPath)
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            cell.accessoryType = .checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: FILTER_CELL_IDENTIFIER, for: indexPath)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: FILTER_CELL_IDENTIFIER)
        }
        cell!.selectionStyle = .none
        
        print("isSelected \(cell!.isSelected) at indexPath \(indexPath)")
        
        cell!.accessoryType = cell!.isSelected ? .checkmark : .none
        
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell!.textLabel?.text = "A to Z"
                break
            case 1:
                cell!.textLabel?.text = "Z to A"

                break
            default:
                break
            }
            break
        case 1:
            switch indexPath.row {
            case 0:
                cell!.textLabel?.text = "Type"
                break
            case 1:
                cell!.textLabel?.text = "Price"
                break
            default:
                break
            }
            break
        default:
            break
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Sort by"
        case 1:
            return "Filter by"
        default:
            return ""
        }
    }
    

}
