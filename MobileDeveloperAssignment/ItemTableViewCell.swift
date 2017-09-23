//
//  ItemTableViewCell.swift
//  MobileDeveloperAssignment
//
//  Created by Cristina on 23/09/17.
//  Copyright © 2017 MDSLab. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var itemNameLabel : UILabel!
    @IBOutlet var typeAndPriceLabel : UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var itemImageView : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureWithItem(_ item : Item){
        itemNameLabel.text = item.itemName
        typeAndPriceLabel.text = "\(item.itemType!) | \(item.itemPrice!)"
        descriptionLabel.text = item.itemDescription.html2String
        
        if let thumbnailImage = item.itemThumbnail {
            if let imageUrl = URL(string:  "https:\(thumbnailImage)") {
                downloadImage(url: imageUrl)
            }
            else {
                self.itemImageView.image = UIImage(named: "placeholder")!
            }
        }
        else {
            self.itemImageView.image = UIImage(named: "placeholder")!
        }
    }
    
    
    func downloadImage(url: URL) {
        print("Download Started")
        ConnectionManager.shared.getImageDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else {
                self.itemImageView.image = UIImage(named: "placeholder")!
                return
            }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.itemImageView.image = UIImage(data: data)
            }
        }
    }
}
