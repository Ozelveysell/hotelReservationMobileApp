

import UIKit

class LittleHolidayCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelCity: UILabel!
    
    
    @IBOutlet weak var labelHotelName: UILabel!
    
    @IBOutlet weak var labelPrice: UILabel!
    
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
