//
//  RoomImageDetailCell.swift
//  hotelReservation
//
//  Created by veysel on 10.05.2024.
//

import UIKit

class RoomImageDetailCell: UICollectionViewCell {
    
    
    @IBOutlet weak var detailImageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Hücrenin etrafına çerçeve eklemek
        
            layer.borderWidth = 1
            layer.cornerRadius = 20
            layer.masksToBounds = true
            // İstediğiniz renkleri ve kalınlığı seçebilirsiniz
        layer.borderColor = UIColor.lightGray.cgColor
    }
}
