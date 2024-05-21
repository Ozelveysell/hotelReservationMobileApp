//
//  MainPageViewController.swift
//  hotelReservation
//
//  Created by veysel on 9.05.2024.
//

import UIKit




class MainPageViewController: UIViewController {


    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var searchImage: UIImageView!
    
    @IBOutlet weak var bellImage: UIImageView!
    
    
    @IBOutlet weak var holidayTypesCollectionView: UICollectionView!
    
    
    @IBOutlet weak var littleHolidayCollectionView: UICollectionView!
    
    @IBOutlet weak var bestLabel: UILabel!
    
    
    @IBOutlet weak var arrowImage: UIImageView!
    
    @IBOutlet weak var allHolidayCollectionView: UICollectionView!
    
    
    let holidayTypes = ["Plaj", "Macera", "Doğa", "Romantik", "Şehir"]

  
    
    var properties: [Hotel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        properties = DataProvider.getHotels()

        let tapGestureSearch = UITapGestureRecognizer(target: self, action: #selector(searchImageTapped))
        searchImage.addGestureRecognizer(tapGestureSearch)
        searchImage.isUserInteractionEnabled = true

        let tapGestureBell = UITapGestureRecognizer(target: self, action: #selector(bellImageTapped))
        bellImage.addGestureRecognizer(tapGestureBell)
        bellImage.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bestLabelTapped))
        bestLabel.addGestureRecognizer(tapGesture)
        bestLabel.isUserInteractionEnabled = true // Kullanıcı etkileşimini etkinleştir

        
        holidayTypesCollectionView.dataSource = self
        holidayTypesCollectionView.delegate = self
        
        holidayTypesCollectionView.isScrollEnabled = true
         if let flowLayout = holidayTypesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.scrollDirection = .horizontal
         }
        
        
        littleHolidayCollectionView.dataSource = self
        littleHolidayCollectionView.delegate = self

        
        littleHolidayCollectionView.isScrollEnabled = true
         if let flowLayout = littleHolidayCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.scrollDirection = .horizontal
         }
        
        
        allHolidayCollectionView.dataSource = self
        allHolidayCollectionView.delegate = self

        
        allHolidayCollectionView.isScrollEnabled = true
         if let flowLayout = allHolidayCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             flowLayout.scrollDirection = .vertical
         }
        
        
    }
    
    @objc func bestLabelTapped() {
        performSegue(withIdentifier: "toAllHotelsVC", sender: self)
    }
    @objc func searchImageTapped() {
        let alertController = UIAlertController(title: "Arama", message: "Ülke, Şehir ve Otel Adı ile Arama Yap", preferredStyle: .alert)
        
        // Ülke, şehir ve otel adı için textfield'lar ekleme
        alertController.addTextField { (countryTextField) in
            countryTextField.placeholder = "Ülke, Şehir, Otel Adı"
        }
     
        
        // Arama işlemi için action'lar ekleme
        let searchAction = UIAlertAction(title: "Ara", style: .default) { (_) in
            // Arama işlemleri burada gerçekleştirilir
            // Örneğin: Kullanıcının girdiği ülke, şehir ve otel adı bilgileri alınarak arama yapılabilir.
            if let countryText = alertController.textFields?[0].text {
                // Arama işlemleri burada gerçekleştirilebilir
                print("Ülke: \(countryText)")
            }
        }
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        
        alertController.addAction(searchAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    @objc func bellImageTapped() {
        let alertController = UIAlertController(title: "Fiyat Filtresi", message: "Fiyat Aralığını Belirleyin", preferredStyle: .alert)
        
        // Fiyat aralığı için iki textfield ekleme
        alertController.addTextField { (minPriceTextField) in
            minPriceTextField.placeholder = "Minimum Fiyat"
            minPriceTextField.keyboardType = .numberPad
        }
        
        alertController.addTextField { (maxPriceTextField) in
            maxPriceTextField.placeholder = "Maksimum Fiyat"
            maxPriceTextField.keyboardType = .numberPad
        }
        
        // Filtreleme işlemi için action'lar ekleme
        let filterAction = UIAlertAction(title: "Filtrele", style: .default) { (_) in
            // Fiyat filtresi uygulanacak işlemleri burada gerçekleştirin
            // Örneğin: Kullanıcının girdiği min ve max fiyat değerlerini alarak filtreleme işlemini gerçekleştirin
            if let minPriceText = alertController.textFields?[0].text, let maxPriceText = alertController.textFields?[1].text {
                // Fiyat filtresi uygulama işlemleri burada gerçekleştirilebilir
                // Örnek olarak, kullanıcıdan alınan değerleri kullanarak bir filtreleme işlemi gerçekleştirilebilir.
                print("Minimum Fiyat: \(minPriceText), Maksimum Fiyat: \(maxPriceText)")
            }
        }
        
        let cancelAction = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        
        alertController.addAction(filterAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }


}
extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == holidayTypesCollectionView {
                // İlk koleksiyon görünümü için öğe sayısını döndür
            return holidayTypes.count
            } else if collectionView == littleHolidayCollectionView {
                // İkinci koleksiyon görünümü için öğe sayısını döndür
                return properties.count
            }else if collectionView == allHolidayCollectionView {
                // İkinci koleksiyon görünümü için öğe sayısını döndür
                return properties.count
            }
            return 0
        }
        
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == holidayTypesCollectionView {
            let holidayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HolidayTypeCell", for: indexPath) as! HolidayTypeCell
            holidayCell.titleLabel.text = holidayTypes[indexPath.item]
            // İlgili hücreyi doldurmak için özel ayarlamalar yapabilirsiniz.
            return holidayCell
        } else if collectionView == littleHolidayCollectionView {
            let littleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LittleHolidayCell", for: indexPath) as! LittleHolidayCell
          
            let hotel = properties[indexPath.item]
                    littleCell.imageView.image = hotel.images.first
                    littleCell.labelCity.text = hotel.city
                    littleCell.labelPrice.text = "\(hotel.price) TL"
                    littleCell.labelHotelName.text = hotel.name
            return littleCell
        }
        else if collectionView == allHolidayCollectionView {
           let allCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllHolidayCell", for: indexPath) as! AllHolidayCell
          
            let hotel = properties[indexPath.item]
                    allCell.imageView.image = hotel.images.first
                    allCell.labelCity.text = hotel.city
                    allCell.labelHotelName.text = hotel.name
                    allCell.labelPrice.text = "\(hotel.price) TL"
           return allCell
       }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == holidayTypesCollectionView {
            // holidayTypesCollectionView için hücre boyutlarını belirle
            let itemSpacing: CGFloat = 10
            let collectionViewWidth = collectionView.bounds.width
            let numberOfItemsPerRow: CGFloat = 3.5 // Her satırda iki öğe olacak şekilde ayarlayabilirsiniz.
            let width = (collectionViewWidth - itemSpacing * (numberOfItemsPerRow - 1)) / numberOfItemsPerRow
            let height: CGFloat = 32 // Özel yükseklik belirleyebilirsiniz.
            return CGSize(width: width + 30, height: height)
        }else if collectionView == littleHolidayCollectionView {
            // Hücre boyutu
            let cellSize = CGSize(width: 200, height: 200)
            return cellSize
        }
        else if collectionView == littleHolidayCollectionView {
            let imageSize = CGSize(width: 200, height: 200)
            return imageSize
        }
        else if collectionView == allHolidayCollectionView {
            
            
            // Hücre boyutu
            let cellSize = CGSize(width: 349, height: 349)
            return cellSize
        }
        else if collectionView == allHolidayCollectionView {
            let imageSize = CGSize(width: 349, height: 349)
            return imageSize
        }

        return CGSize.zero
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailVC", sender: indexPath)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toDetailVC" {
             if let destinationVC = segue.destination as? HotelDetailViewController,
                let indexPath = sender as? IndexPath {
                 let selectedHotel = properties[indexPath.row]
                 destinationVC.hotel = selectedHotel
             }
         }
     }
}



    
