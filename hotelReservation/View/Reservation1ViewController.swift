//
//  Reservation1ViewController.swift
//  hotelReservation
//
//  Created by veysel on 16.05.2024.
//

import UIKit

class Reservation1ViewController: UIViewController, UITextFieldDelegate {
    var hotel: Hotel?

    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var adSoyadText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var alanKoduText: UITextField!
    
    @IBOutlet weak var telefonNoText: UITextField!
    
    @IBOutlet weak var mahsokText: UITextField!
    
    
    @IBOutlet weak var binaNoText: UITextField!
    
    
    @IBOutlet weak var ilceText: UITextField!
    
    @IBOutlet weak var ilText: UITextField!
    
    @IBOutlet weak var kaydetLabelButton: UILabel!
    var price: String?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let price = price {
            print(price)
        }
        // Gesture recognizer'ı ekleyin
   
        
        // Gesture recognizer'ı ekleyin
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(kaydetLabelButtonTapped))
        kaydetLabelButton.addGestureRecognizer(tapGesture3)
        kaydetLabelButton.isUserInteractionEnabled = true // Dokunma etkinleştirme

        // UITextFieldDelegate'ı ayarla
              adSoyadText.delegate = self
              emailText.delegate = self
              alanKoduText.delegate = self
              telefonNoText.delegate = self
              mahsokText.delegate = self
              binaNoText.delegate = self
              ilceText.delegate = self
              ilText.delegate = self
              
              // Görünümün tıklanması durumunda klavyeyi gizleme
              let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
              view.addGestureRecognizer(tapGesture)
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
 
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toReservation12Segue",
               let destinationVC = segue.destination as? Reservation2ViewController {
                destinationVC.price = price
            }
        }
    @objc func kaydetLabelButtonTapped() {
        
        if let adSoyad = adSoyadText.text, !adSoyad.isEmpty,
                let email = emailText.text, !email.isEmpty,
                let alanKodu = alanKoduText.text, !alanKodu.isEmpty,
                let telefonNo = telefonNoText.text, !telefonNo.isEmpty,
                let mahsok = mahsokText.text, !mahsok.isEmpty,
                let binaNo = binaNoText.text, !binaNo.isEmpty,
                let ilce = ilceText.text, !ilce.isEmpty,
                let il = ilText.text, !il.isEmpty {
                 // Tüm alanlar dolu ise segue yap
                 performSegue(withIdentifier: "toReservation12Segue", sender: nil)
             } else {
                 // Boş alan varsa uyarı mesajı göster
                 let alertController = UIAlertController(title: "Uyarı", message: "Lütfen tüm alanları doldurun.", preferredStyle: .alert)
                 let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                 alertController.addAction(okAction)
                 present(alertController, animated: true, completion: nil)
             }
         }

        
     }
 
  
