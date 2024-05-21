
import UIKit

class Reservation2ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var hotel: Hotel?

    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var kaydetLabelButton: UILabel!
    
    @IBOutlet weak var dropdownButton1: UIButton!
    
    @IBOutlet weak var dropdownButton2: UIButton!
    
    @IBOutlet weak var pickerView1: UIPickerView!
    
    @IBOutlet weak var pickerView2: UIPickerView!
    
    let roomTypes = ["Standart Oda", "Süit Oda", "Villa"]
    
    let customer = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    
    
    var selectedRoomType: String?
       var selectedCustomer: String?
       var selectedDays: Int?
       var price: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            if let price = price {
                print(price)
            }
            
            // Dropdown button ayarları
            
            kaydetLabelButton.isUserInteractionEnabled = false // Başlangıçta devre dışı bırak

                 dropdownButton1.setTitle("Oda Tipi Seçin", for: .normal)
                 dropdownButton1.addTarget(self, action: #selector(dropdownButton1Clicked), for: .touchUpInside)
                 
                 dropdownButton2.setTitle("Kişi Sayısı", for: .normal)
                 dropdownButton2.addTarget(self, action: #selector(dropdownButton2Clicked), for: .touchUpInside)

                 // PickerView ayarları
                 pickerView1.delegate = self
                 pickerView1.dataSource = self
               //  pickerView1.isHidden = true

                 pickerView2.delegate = self
                 pickerView2.dataSource = self
              //   pickerView2.isHidden = true
            
         
            
            let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(kaydetLabelButtonTapped))
            kaydetLabelButton.addGestureRecognizer(tapGesture3)
            kaydetLabelButton.isUserInteractionEnabled = true // Dokunma etkinleştirme

        }
        
     
        
    @objc func kaydetLabelButtonTapped() {
        if selectedRoomType != nil && selectedCustomer != nil {
                 performSegue(withIdentifier: "toReservation23Segue", sender: self)
             } else {
                 // Uyarı mesajı göster
                 let alertController = UIAlertController(title: "Uyarı", message: "Lütfen oda tipi ve kişi sayısı seçin.", preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                 alertController.addAction(okAction)
                 present(alertController, animated: true, completion: nil)
             }
     }
 
    
    @objc func dropdownButton1Clicked() {
          pickerView1.isHidden.toggle()
          pickerView2.isHidden = true // Diğer pickerView'in gizli olduğundan emin ol
      }

      @objc func dropdownButton2Clicked() {
          pickerView2.isHidden.toggle()
          pickerView1.isHidden = true // Diğer pickerView'in gizli olduğundan emin ol
      }


    // UIPickerView DataSource ve Delegate metotları
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         if pickerView == pickerView1 {
             return roomTypes.count
         } else if pickerView == pickerView2 {
             return customer.count
         }
         return 0
     }

     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         if pickerView == pickerView1 {
             return roomTypes[row]
         } else if pickerView == pickerView2 {
             return customer[row]
         }
         return nil
     }

     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         if pickerView == pickerView1 {
              selectedRoomType = roomTypes[row]
             dropdownButton1.setTitle(selectedRoomType, for: .normal)
             pickerView1.isHidden = true
         } else if pickerView == pickerView2 {
             selectedCustomer = customer[row]
             dropdownButton2.setTitle(selectedCustomer, for: .normal)
             pickerView2.isHidden = true
         }
     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "toReservation23Segue",
             let destinationVC = segue.destination as? Reservation3ViewController {
              destinationVC.price = price
              destinationVC.selectedCustomer = selectedCustomer
              destinationVC.selectedDays = selectedDays
          }
      }
 }
