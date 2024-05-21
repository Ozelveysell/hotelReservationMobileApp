

import Foundation
import UIKit

class DataProvider {
    static func getHotels() -> [Hotel] {
        return [
            Hotel(name: "YOTEL London City", city: "Londra", price: "4000", images: [UIImage(named: "YOTEL London City1")!, UIImage(named: "YOTEL London City2")!, UIImage(named: "YOTEL London City3")!, UIImage(named: "YOTEL London City4")!].compactMap { $0 }, holidayType: "Kültürel", explanation: "Londra'da cazip bir konumda yer alan YOTEL London City klimalı odalar, fitness merkezi, ücretsiz Wi-Fi ve ortak salon sunmaktadır. Bu 4 yıldızlı otelde bar bulunmaktadır."),
            Hotel(name: "Athens Connection", city: "Atina", price: "2500", images: [UIImage(named: "Athens Connection Apartments1")!, UIImage(named: "Athens Connection Apartments2")!, UIImage(named: "Athens Connection Apartments3")!, UIImage(named: "Athens Connection Apartments4")!].compactMap { $0 }, holidayType: "Romantik", explanation: "Atina'nın merkezinde merkezi bir konuma sahip olan Athens Connection Apartments, Syntagma Meydanı'na 15 dakikalık yürüme mesafesinde yer alır."),
            Hotel(name: "Le Burgundy Paris", city: "Paris", price: "5250", images: [UIImage(named: "Le Burgundy Paris1")!, UIImage(named: "Le Burgundy Paris2")!, UIImage(named: "Le Burgundy Paris3")!, UIImage(named: "Le Burgundy Paris4")!].compactMap { $0 }, holidayType: "Kültürel", explanation: "Paris'in merkezinde yer alan Le Burgundy, Rue Saint-Honoré'daki şık butiklere sadece 50 metre uzaklıktadır. "),
            Hotel(name: "Park Central", city: "New York", price: "4000", images: [UIImage(named: "Park Central1")!, UIImage(named: "Park Central2")!, UIImage(named: "Park Central3")!, UIImage(named: "Park Central4")!].compactMap { $0 }, holidayType: "Kültürel", explanation: "Park Central Hotel, Central Park'a birkaç adım mesafede elverişli bir konuma sahiptir. Egzersiz tutkunları için tesiste 24 saat açık fitness merkezi vardır."),
            Hotel(name: "Vida Creek Harbour", city: "Dubai", price: "9000", images: [UIImage(named: "Vida Creek Harbour1")!, UIImage(named: "Vida Creek Harbour2")!, UIImage(named: "Vida Creek Harbour3")!, UIImage(named: "Vida Creek Harbour4")!].compactMap { $0 }, holidayType: "Kültürel", explanation: "Dubai'de Dubai Akvaryumu ve Su Altı Hayvanat Bahçesi'ne 10 km uzaklıkta yer alan 2 restoranı, ücretsiz özel park yeri ve fitness merkezi ile konaklama olanağı sunmaktadır."),
            Hotel(name: "Alexanderplatz", city: "Berlin", price: "3000", images: [UIImage(named: "Berlin-Alexanderplatz1")!, UIImage(named: "Berlin-Alexanderplatz2")!, UIImage(named: "Berlin-Alexanderplatz3")!, UIImage(named: "Berlin-Alexanderplatz4")!].compactMap { $0 }, holidayType: "Kültürel", explanation: "Berlin'in merkezinde elverişli bir konumda yer alan Motel One Berlin-Alexanderplatz, tesis genelinde ücretsiz WiFi erişimi ve bar sunmaktadır."),
        ]
    }
}
