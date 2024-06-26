//
//  ContentViewController.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/4/24.
//

//  ContentViewController.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/4/24.
//

import UIKit

class ContentViewController: UIViewController {

    var semester: String?

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a UIImageView and set its image to your desired background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = .scaleAspectFill // Adjusts the image to fill the entire view

        // Add the UIImageView to the back of your view
        self.view.insertSubview(backgroundImage, at: 0)
    }

    // Action method for segmented control value changed event
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
       
        
            switch sender.selectedSegmentIndex {
            case 0:
                // Perform segue to professor view controller
                performSegue(withIdentifier: "professorSegue", sender: nil)
            case 1:
                // Perform segue to course view controller
                performSegue(withIdentifier: "courseSegue", sender: nil)
            default:
                break
            }
        }



    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "professorSegue" {
            // Pass the semester information to the professor view controller
            if let professorVC = segue.destination as? ProfessorViewController {
                professorVC.semester = semester
            }
        } else if segue.identifier == "courseSegue" {
            // Pass the semester information to the course view controller
            if let courseVC = segue.destination as? CourseViewController {
                courseVC.semester = semester
            }
        }
    }
    
    // Action method for showing announcements
    @IBAction func showAnnouncements(_ sender: UIButton) {
        // Perform segue to AnnouncementViewController
        performSegue(withIdentifier: "announcementSegue", sender: nil)
    }
}
