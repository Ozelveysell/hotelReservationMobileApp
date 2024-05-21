//
//  AllHotelViewController.swift
//  hotelReservation
//
//  Created by veysel on 17.05.2024.
//

import UIKit

class AllHotelViewController: UIViewController {

    
    @IBOutlet weak var hotelTableView: UITableView!
    
    var hotels: [Hotel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        hotels = DataProvider.getHotels()

        hotelTableView.delegate = self
        hotelTableView.dataSource = self

    }
    

}
extension AllHotelViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Hücreyi tanımla
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllHotelsCell", for: indexPath) as! AllHotelsTableViewCell
        
        // Hücre içeriğini güncelle
        let hotel = hotels[indexPath.row]
        cell.hotelNameLabel.text = hotel.name
        cell.hotelCityLabel.text = hotel.city
        cell.hotelPriceLabel.text = "\(hotel.price) TL"
        cell.hotelsImageView.image = hotel.images.first // İlk resmi göster
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail2VC", sender: indexPath)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "toDetail2VC" {
             if let destinationVC = segue.destination as? HotelDetailViewController,
                let indexPath = sender as? IndexPath {
                 let selectedHotel = hotels[indexPath.row]
                 destinationVC.hotel = selectedHotel
             }
         }
     }
    
}
