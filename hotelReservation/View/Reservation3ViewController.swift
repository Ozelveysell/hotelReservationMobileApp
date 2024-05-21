//
//  Reservation3ViewController.swift
//  hotelReservation
//
//  Created by veysel on 16.05.2024.
//

import UIKit

class Reservation3ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    
    @IBOutlet weak var adSoyadText: UITextField!
    
    
    @IBOutlet weak var kartNoText: UITextField!
    
    @IBOutlet weak var sonKullanmaText: UITextField!
    
    @IBOutlet weak var guvenlikKoduText: UITextField!
    
    
    @IBOutlet weak var onayKoduText: UITextField!
    
    
    @IBOutlet weak var rezervasyonBilgiLabel: UILabel!
    
    
    @IBOutlet weak var rezervasyonTutarLabel: UILabel!
    
    
    @IBOutlet weak var rezervasyonKomisyonLabel: UILabel!
    
    
    @IBOutlet weak var paymentButtonLabel: UILabel!
    
  
    var price: String?
    var selectedCustomer: String?
    var selectedDays: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
      

        calculateTotalPrice()

        // UITextFieldDelegate'ı ayarla
              adSoyadText.delegate = self
        kartNoText.delegate = self
        sonKullanmaText.delegate = self
        guvenlikKoduText.delegate = self
        onayKoduText.delegate = self
      
              // Görünümün tıklanması durumunda klavyeyi gizleme
              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
              view.addGestureRecognizer(tapGesture)
   
        
        // Gesture recognizer'ı ekleyin
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(paymentButtonLabelTapped))
        paymentButtonLabel.addGestureRecognizer(tapGesture3)
        paymentButtonLabel.isUserInteractionEnabled = true // Dokunma etkinleştirme
        
        
       
    }
    
    // Klavyeyi gizlemek için işlev
     @objc func dismissKeyboard() {
         view.endEditing(true)
     }
     
     // UITextFieldDelegate ile ilgili işlevler
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         // Return tuşuna basıldığında klavyeyi gizle
         textField.resignFirstResponder()
         return true
     }
    
    func calculateTotalPrice() {
        if let price = Int(price ?? "0"), let selectedCustomer = Int(selectedCustomer ?? "0") {
            let totalPrice = price * selectedCustomer
            rezervasyonTutarLabel.text = "\(selectedCustomer) Kişi Günlük \(totalPrice) TL"
            rezervasyonKomisyonLabel.text = "Komisyon Ücreti \(totalPrice / 50) TL"
            rezervasyonBilgiLabel.text = "1 Kişi Günlük \(price) TL "
        } else {
            rezervasyonTutarLabel.text = "Hesaplanamadı"
        }
    }

    func showAlert(message: String) {
           let alert = UIAlertController(title: "Bilgi", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
  
    
    @objc func paymentButtonLabelTapped() {
        if let adSoyad = adSoyadText.text,
                 let kartNo = kartNoText.text,
                 let sonKullanma = sonKullanmaText.text,
                 let guvenlikKodu = guvenlikKoduText.text,
                 let onayKodu = onayKoduText.text {
                  
                  if adSoyad.isEmpty || kartNo.isEmpty || sonKullanma.isEmpty || guvenlikKodu.isEmpty || onayKodu.isEmpty {
                      // Alanları doldurması gerektiğine dair uyarı mesajı göster
                      showAlert(message: "Lütfen tüm alanları doldurun.")
                  } else {
                      // Ödeme alındığına dair uyarı mesajı göster
                      showAlert(message: "Ödemeniz alınmıştır. İyi tatiller!")
                  }
              }
     }

    
    
}
