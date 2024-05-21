//
//  HotelDetailViewController.swift
//  hotelReservation
//
//  Created by veysel on 10.05.2024.
//

import UIKit

class HotelDetailViewController: UIViewController {
    
    
    var hotel: Hotel?
    
    
    @IBOutlet weak var bellImage: UIImageView!
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
    @IBOutlet weak var featureCollection: UICollectionView!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var reservationImage: UILabel!
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    
    // Otel özellikleri dizisi
    let features: [String] = [
        "Ücretsiz Wi-Fi",
        "Oda Temizliği",
        "Klima",
        "Ücretsiz Kahvaltı",
        // Diğer özellikleri buraya ekleyin
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureBell = UITapGestureRecognizer(target: self, action: #selector(bellImageTapped))
         bellImage.addGestureRecognizer(tapGestureBell)
         bellImage.isUserInteractionEnabled = true
        if let hotel = hotel {
            roomTypeLabel.text = hotel.name
            priceLabel.text = "\(hotel.price) TL"
            descriptionLabel.text = hotel.explanation
            cityLabel.text = hotel.city
        }
        
        imageCollection.dataSource = self
        imageCollection.delegate = self
        
        imageCollection.isScrollEnabled = true
        if let flowLayout = imageCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        
        featureCollection.dataSource = self
        featureCollection.delegate = self
        
        
        featureCollection.isScrollEnabled = true
        if let flowLayout = featureCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        
        
        
        
        descriptionLabel.numberOfLines = 4 // Etiketin maksimum satır sayısını 4 olarak ayarlayın
        descriptionLabel.lineBreakMode = .byWordWrapping // Metnin satır sonunda kelimeleri bölerek satırı doldurmasını sağlayın
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        reservationImage.isUserInteractionEnabled = true
        reservationImage.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func labelTapped() {
        performSegue(withIdentifier: "toReservation1Segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toReservation1Segue" {
            if let destinationVC = segue.destination as? Reservation1ViewController {
                destinationVC.price = hotel?.price
            }
        }
        
    }
    @objc func bellImageTapped() {
        let alertController = UIAlertController(title: "Otelle İlgili Sorular", message: "Sorularınızı Yazınız", preferredStyle: .alert)
        
        // Otelle ilgili soru sormak için bir textfield ekleme
        alertController.addTextField { (questionTextField) in
            questionTextField.placeholder = "Sorularınızı yazınız..."
        }
        
        // Soru sormak için action ekleme
        let askAction = UIAlertAction(title: "Sor", style: .default) { (_) in
            // Kullanıcının sorduğu soruyu alarak istediğiniz işlemleri gerçekleştirin
            if let questionText = alertController.textFields?.first?.text {
                // Kullanıcının sorduğu soru ile ilgili işlemleri burada yapabilirsiniz
                print("Sorulan Soru: \(questionText)")
            }
        }
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        
        alertController.addAction(askAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

}

extension HotelDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           // Collection view'deki öğe sayısını döndürün
           if collectionView == imageCollection {
               return hotel?.images.count ?? 0
           } else if collectionView == featureCollection {
               return features.count
           } else {
               return 0
           }
       }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          // Collection view hücresini yapılandırın ve döndürün
          if collectionView == imageCollection {
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailImageCell", for: indexPath) as! RoomImageDetailCell
              if let hotelImage = hotel?.images[indexPath.item] {
                  cell.detailImageCell.image = hotelImage // Örneğin, görüntüleri hücreye ayarlayın
              }
              return cell
          } else if collectionView == featureCollection {
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailFeatureCell", for: indexPath) as! FeatureDetailCell
              cell.featureLabel.text = features[indexPath.item]
              return cell
          } else {
              return UICollectionViewCell()
          }
      }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Collection view hücre boyutunu belirleyin
        // Örneğin:
        if collectionView == imageCollection {
            // Image CollectionView için hücre boyutunu belirleyin
            // Örneğin:
            let cellWidth = collectionView.bounds.width
            let cellHeight = collectionView.bounds.height
            return CGSize(width: 10, height: 10)
        } else if collectionView == featureCollection {
            // Feature CollectionView için hücre boyutunu belirleyin
            // Örneğin:
            let cellWidth = collectionView.bounds.width / 2 - 10 // Örneğin, koleksiyon genişliğinin yarısı ve biraz boşluk bırakarak
            let cellHeight: CGFloat = 50 // Özel yükseklik belirleyebilirsiniz
            return CGSize(width: cellWidth, height: cellHeight)
        } else {
            return CGSize.zero
        }
    }
    
}

