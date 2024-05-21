//
//  ViewController.swift
//  hotelReservation
//
//  Created by veysel on 8.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelLogIn: UILabel!
    
    
    @IBOutlet weak var labelCreate: UILabel!
    
    override func viewDidLoad() {
          super.viewDidLoad()

          // Configure tap gesture recognizers for labels
          let loginTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleLoginTap(_:)))
          labelLogIn.addGestureRecognizer(loginTapRecognizer)
          labelLogIn.isUserInteractionEnabled = true  // Enable user interaction

          let createTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleCreateTap(_:)))
          labelCreate.addGestureRecognizer(createTapRecognizer)
          labelCreate.isUserInteractionEnabled = true

          // Add rounded corners and border to labels
          labelLogIn.layer.cornerRadius = 10.0
          labelLogIn.layer.masksToBounds = true
          labelLogIn.layer.borderWidth = 1.0
          labelLogIn.layer.borderColor = UIColor.lightGray.cgColor  // Adjust border color

          labelCreate.layer.cornerRadius = 10.0
          labelCreate.layer.masksToBounds = true
          labelCreate.layer.borderWidth = 1.0
          labelCreate.layer.borderColor = UIColor.lightGray.cgColor  // Adjust border color
      }

      @objc func handleLoginTap(_ gestureRecognizer: UITapGestureRecognizer) {
          
          performSegue(withIdentifier: "toSignInVC", sender: nil)
          
      }

      @objc func handleCreateTap(_ gestureRecognizer: UITapGestureRecognizer) {
       
          performSegue(withIdentifier: "toSignUpVC", sender: nil)
      }
  }
