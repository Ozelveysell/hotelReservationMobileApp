//
//  AllHotelsTableViewCell.swift
//  hotelReservation
//
//  Created by veysel on 17.05.2024.
//

import UIKit

class AllHotelsTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelsImageView: UIImageView!
    
    
    @IBOutlet weak var hotelNameLabel: UILabel!
    
    
    @IBOutlet weak var hotelCityLabel: UILabel!
    
    
    @IBOutlet weak var hotelPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 10
                contentView.layer.borderWidth = 1
                contentView.layer.borderColor = UIColor.lightGray.cgColor
                contentView.layer.masksToBounds = true
                
                // Otel görseli için köşe yuvarlatma
                hotelsImageView.layer.cornerRadius = 10
                hotelsImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
