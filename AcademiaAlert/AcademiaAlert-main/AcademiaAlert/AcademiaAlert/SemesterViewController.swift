//
//  ContentViewController.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/4/24.
//

import UIKit

class SemesterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var semesters = ["Fall 2023", "Spring 2024", "Summer 2024"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a UIImageView and set its image to your desired background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = .scaleAspectFill // Adjusts the image to fill the entire view
        
        // Add the UIImageView to the back of your view
        self.view.insertSubview(backgroundImage, at: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return semesters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "semesterCell", for: indexPath)
        let semester = semesters[indexPath.row]
        cell.textLabel?.text = semester
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contentViewSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let selectedSemester = semesters[indexPath.row]
                if let destinationViewController = segue.destination as? ContentViewController {
                    destinationViewController.semester = selectedSemester
                } else {
                    print("Error: Destination view controller is nil.")
                }
            } else {
                print("Error: IndexPath for selected row is nil.")
            }
        } else {
            print("Error: Unexpected segue identifier.")
        }
    }
}

