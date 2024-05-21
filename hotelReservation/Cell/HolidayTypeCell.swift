//
//  HolidayTypeCell.swift
//  hotelReservation
//
//  Created by veysel on 9.05.2024.
//

import UIKit

class HolidayTypeCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
      
      override func awakeFromNib() {
          super.awakeFromNib()
          // Hücrenin etrafına çerçeve eklemek
          
              layer.borderWidth = 1
              layer.cornerRadius = 10
              layer.masksToBounds = true
              // İstediğiniz renkleri ve kalınlığı seçebilirsiniz
          layer.borderColor = UIColor.lightGray.cgColor
      }
}
