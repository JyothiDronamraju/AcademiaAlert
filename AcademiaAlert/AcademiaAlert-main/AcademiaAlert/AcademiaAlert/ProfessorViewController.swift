//
//  ProfessorViewController.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/5/24.
//

// ProfessorViewController.swift

import UIKit

class ProfessorViewController: UIViewController {

    // Add a property to hold the semester information
    var semester: String?
    
    // Define Professor struct inside ProfessorViewController
    struct Professor {
        let name: String
        let image: UIImage
        let courses: [String]
        let timings: [String]
        let rooms: [String]
        let semester: String // Add semester property
        
        // Example initializer
        init(name: String, image: UIImage, courses: [String], timings: [String], rooms: [String], semester: String) {
            self.name = name
            self.image = image
            self.courses = courses
            self.timings = timings
            self.rooms = rooms
            self.semester = semester
        }
    }
    
    // Data for professors
    let professors: [Professor] = [
        Professor(name: "Dr. Ajay Bandi",
                  image: UIImage(named: "Ajay Bandi")!,
                  courses: ["IOS"],
                  timings: ["Tue, Thu 9:30-10:50 AM"],
                  rooms: ["Lab"],
                  semester: "Spring 2024"),
        Professor(name: "Dr. Ajay Bandi",
                  image: UIImage(named: "Ajay Bandi")!,
                  courses: ["Patterns"],
                  timings: ["Tue, Thu 12:30-1:50 PM"],
                  rooms: ["Ch3600"],
                  semester: "Spring 2024"),
        Professor(name: "Dr. Ajay Bandi",
                  image: UIImage(named: "Ajay Bandi")!,
                  courses: ["Generative AI"],
                  timings: ["Online Class"],
                  rooms: ["-"],
                  semester: "Summer 2024"),
        Professor(name: "Dr. Mark Chai",
                  image: UIImage(named: "Mark Chai")!,
                  courses: ["Graduate Directed Project-1"],
                  timings: ["Mon, Wed, Fri 9:00-9:50 AM"],
                  rooms: ["GS1050"],
                  semester: "Spring 2024"),
        Professor(name: "Dr. Mark Chai",
                  image: UIImage(named: "Mark Chai")!,
                  courses: ["Graduate Directed Project-2"],
                  timings: ["Mon,Tue, Wed, Thu 12:00-02:30 PM"],
                  rooms: ["GS1050"],
                  semester: "Summer 2024"),
        Professor(name: "Dr. Prasad Chetti",
                  image: UIImage(named: "Prasad Chetti")!,
                  courses: ["Advanced Database"],
                  timings: ["Mon, Wed, Fri 12:00-12:50 PM"],
                  rooms: ["VLK1100"],
                  semester: "Fall 2023"),
        Professor(name: "Dr. Charles Hoot",
                  image: UIImage(named: "Charles Hoot")!,
                  courses: ["Web Applications"],
                  timings: ["Mon, Wed, Fri 1:00-1:50 PM"],
                  rooms: ["CH3600"],
                  semester: "Fall 2023"),
        Professor(name: "Dr. Ratan Lal",
                  image: UIImage(named: "Ratan Lal")!,
                  courses: ["Java"],
                  timings: ["Mon, Wed, Fri 11:00-11:50 AM"],
                  rooms: ["CH1110"],
                  semester: "Fall 2023")
        // Add other professors here with their details and semester
    ]
    
    @IBOutlet weak var professorImageView: UIImageView!
    @IBOutlet weak var professorNameOL: UILabel!
    @IBOutlet weak var courseOL: UILabel!
    @IBOutlet weak var roomNoOL: UILabel!
    @IBOutlet weak var timingOL: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a UIImageView and set its image to your desired background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = .scaleAspectFill // Adjusts the image to fill the entire view

        // Add the UIImageView to the back of your view
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
        
        // Initially disable prevButton as currentIndex is 0
        prevButton.isEnabled = false
        
        updateUI()
    }
    
    func updateUI() {
        guard let selectedSemester = semester else {
            return // Do nothing if semester is not selected
        }

        let filteredProfessors = professors.filter { $0.semester == selectedSemester }
        guard !filteredProfessors.isEmpty else {
            return // Do nothing if there are no professors for the selected semester
        }

        // Disable prevButton if currentIndex is 0, otherwise enable it
        prevButton.isEnabled = currentIndex > 0

        // Disable nextButton if currentIndex is the last index, otherwise enable it
        nextButton.isEnabled = currentIndex < filteredProfessors.count - 1
        
        let professor = filteredProfessors[currentIndex]
        professorImageView.image = professor.image
        professorNameOL.text = professor.name
        courseOL.text = professor.courses.joined(separator: ", ")
        timingOL.text = professor.timings.joined(separator: ", ")
        roomNoOL.text = professor.rooms.joined(separator: ", ")
    }

    @IBAction func prevButtonTapped(_ sender: UIButton) {
        if currentIndex > 0 {
            currentIndex -= 1
            updateUI()
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let selectedSemester = semester else {
            return // Do nothing if semester is not selected
        }

        let filteredProfessors = professors.filter { $0.semester == selectedSemester }
        if currentIndex < filteredProfessors.count - 1 {
            currentIndex += 1
            updateUI()
        }
    }
}
