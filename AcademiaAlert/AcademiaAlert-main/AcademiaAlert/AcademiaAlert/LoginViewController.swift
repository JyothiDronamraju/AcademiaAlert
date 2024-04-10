//
//  ViewController.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/4/24.
//


import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Array to store login credentials
    let loginCredentials = [("s564551", "Naga"),("s562113","Naresh"),("s560305","Kelifa"),("564534","Varshitha"),("s564843","Vamshi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set password text field to secure entry
        passwordTextField.isSecureTextEntry = true
        
        // Create a UIImageView and set its image to your desired background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = .scaleAspectFill // Adjusts the image to fill the entire view
        
        // Add the UIImageView to the back of your view
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        // Validate login credentials
        let loginId = loginIdTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // Check if entered credentials match with any stored credentials
        if loginCredentials.contains(where: { $0.0 == loginId && $0.1 == password }) {
        } else {
            // Show error message for invalid credentials
            showAlert(message: "Invalid login ID or password. Please try again.")
        }
    }
    
    // Helper function to show an alert message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "semesterViewSegue" {
            // Validate login credentials again
            let loginId = loginIdTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            // Check if entered credentials match with any stored credentials
            if loginCredentials.contains(where: { $0.0 == loginId && $0.1 == password }) {
                print("Credentials are valid. Proceeding to next view.")
                return true
            } else {
                // Show error message for invalid credentials
                showAlert(message: "Invalid login ID or password. Please try again.")
                return false
            }
        }
        return true // Allow other segues
    }
}
