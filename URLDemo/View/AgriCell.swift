//
//  AgriCell.swift
//  URLDemo
//
//  Created by Manish Ingale on 30/08/21.
//

import UIKit
import SDWebImage

class AgriCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var imageV: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadCellData(agriData: AgriModel){
        self.titleLbl.text = agriData.title
        self.descLbl.text = agriData.description
        self.priceLbl.text = "\(agriData.price ?? 0)"
        
        if let url = URL(string: "\(agriData.image ?? "")") {
            self.imageV!.sd_setImage(with: url) { (image, error, chache, url) in
                self.imageV!.image = image
            }

        }

    }
   
}
