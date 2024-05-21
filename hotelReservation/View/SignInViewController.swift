
import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var labelSignIn: UILabel!
    
    @IBOutlet weak var labelForgot: UILabel!
    
    @IBOutlet weak var labelX: UILabel!
    
    @IBOutlet weak var labelFacebook: UILabel!
    
    @IBOutlet weak var labelLinkedIn: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameText.delegate = self
        passwordText.delegate = self

        // Görünümün tıklanması durumunda klavyeyi gizleme
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

        // Configure tap gesture recognizers for labels
        let signInTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(signInTap(_:)))
        labelSignIn.addGestureRecognizer(signInTapRecognizer)
        labelSignIn.isUserInteractionEnabled = true  // Enable user interaction

        // Add rounded corners and border to labels
        labelSignIn.layer.cornerRadius = 10.0
        labelSignIn.layer.masksToBounds = true
        labelSignIn.layer.borderWidth = 1.0
        labelSignIn.layer.borderColor = UIColor.lightGray.cgColor  // Adjust border color
        
        
        let forgotTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(forgotTap(_:)))
        labelForgot.addGestureRecognizer(forgotTapRecognizer)
        labelForgot.isUserInteractionEnabled = true  // Enable user interaction

    
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
    
    @objc func signInTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "toMainPageVC", sender: nil)
        
    }
    
    @objc func forgotTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
     //   performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }

    @objc func xTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
     //   performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }
    @objc func facebookTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
      //  performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }
    @objc func linkedInTap(_ gestureRecognizer: UITapGestureRecognizer) {
        
     //   performSegue(withIdentifier: "toSignInVC", sender: nil)
        
    }



    
}
