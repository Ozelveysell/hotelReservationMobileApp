

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameText: UITextField!
    
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var labelSignUp: UILabel!
    
    
    @IBOutlet weak var labelSignIn: UILabel!
    
    @IBOutlet weak var labelX: UILabel!
    
    
    
    @IBOutlet weak var labelFacebook: UILabel!
    
    @IBOutlet weak var labelLinkedIn: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameText.delegate = self
        emailText.delegate = self
        passwordText.delegate = self
        // Configure tap gesture recognizers for labels
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

  
        let signUpTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpTap(_:)))
        labelSignUp.addGestureRecognizer(signUpTapRecognizer)
        labelSignUp.isUserInteractionEnabled = true  // Enable user interaction

        // Add rounded corners and border to labels
        labelSignUp.layer.cornerRadius = 10.0
        labelSignUp.layer.masksToBounds = true
        labelSignUp.layer.borderWidth = 1.0
        labelSignUp.layer.borderColor = UIColor.lightGray.cgColor  // Adjust border color
        
        
        let signInTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(signInTap(_:)))
        labelSignIn.addGestureRecognizer(signInTapRecognizer)
        labelSignIn.isUserInteractionEnabled = true  // Enable user interaction

    
        let xTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(xTap(_:)))
        labelX.addGestureRecognizer(xTapRecognizer)
        labelX.isUserInteractionEnabled = true  // Enable user interaction

        // Add rounded corners and border to labels
        labelX.layer.cornerRadius = 10.0
        labelX.layer.masksToBounds = true
        labelX.layer.borderWidth = 1.0
        labelX.layer.borderColor = UIColor.lightGray.cgColor  // Adjust border color
        
        let facebookTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(facebookTap(_:)))
        labelFacebook.addGestureRecognizer(facebookTapRecognizer)
        labelFacebook.isUserInteractionEnabled = true  // Enable user interaction

        // Add rounded corners and border to labels
        labelFacebook.layer.cornerRadius = 10.0
        labelFacebook.layer.masksToBounds = true
        labelFacebook.layer.borderWidth = 1.0
        labelFacebook.layer.borderColor = UIColor.lightGray.cgColor  // Adjust border color
        
        let linkedInTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(linkedInTap(_:)))
        labelLinkedIn.addGestureRecognizer(linkedInTapRecognizer)
        labelLinkedIn.isUserInteractionEnabled = true  // Enable user interaction

        // Add rounded corners and border to labels
        labelLinkedIn.layer.cornerRadius = 10.0
        labelLinkedIn.layer.masksToBounds = true
        labelLinkedIn.layer.borderWidth = 1.0
        labelLinkedIn.layer.borderColor = UIColor.lightGray.cgColor  // Adjust border color
        
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

    @objc func signUpTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
   //     performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }
    
    @objc func signInTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
     //   performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }

    @objc func xTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
     //   performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }
    @objc func facebookTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
    //    performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }
    @objc func linkedInTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
     //   performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }


}
