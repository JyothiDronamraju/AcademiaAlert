//
//  CourseViewController.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/7/24.
//

import UIKit

class CourseViewController: UIViewController {
    
    // Add a property to hold the semester information
    var semester: String?
    
    // Define Course struct inside CourseViewController
    struct Course {
        let name: String
        let professorName: String
        let timings: String
        let room: String
        let image: UIImage
        let semester: String // Add semester property
        
        // Example initializer
        init(name: String, professorName: String, timings: String, room: String, image: UIImage, semester: String) {
            self.name = name
            self.professorName = professorName
            self.timings = timings
            self.room = room
            self.image = image
            self.semester = semester
        }
    }
    
    // Data for courses
    let courses: [Course] = [
        Course(name: "IOS", professorName: "Dr. Ajay Bandi", timings: "Tue, Thu 9:30-10:50 AM", room: "Lab", image: UIImage(named: "ios") ?? UIImage(), semester: "Spring 2024"),
        Course(name: "Patterns", professorName: "Dr. Ajay Bandi", timings: "Tue, Thu 12:30-1:50 PM", room: "CH3600", image: UIImage(named: "patterns") ?? UIImage(), semester: "Spring 2024"),
        Course(name: "Generative AI", professorName: "Dr. Ajay Bandi", timings: "Online Class", room: "-", image: UIImage(named: "genai") ?? UIImage(), semester: "Summer 2024"),
        Course(name: "Java", professorName: "Dr. Ratan Lal", timings: "Mon, Wed, Fri 11:00-11:50 AM", room: "CH1100", image: UIImage(named: "java") ?? UIImage(), semester: "Fall 2023"),
        Course(name: "Graduate Directed Project-1", professorName: "Dr. Mark Chai", timings: "Mon, Wed, Fri 9:00-9:50 AM", room: "GS1050", image: UIImage(named: "gdp") ?? UIImage(), semester: "Spring 2024"),

        Course(name: "Advanced Database", professorName: "Dr. Chetti Prasad", timings: "Mon, Wed, Fri 12:00-12:50 PM", room: "VLK1100", image: UIImage(named: "adb") ?? UIImage(), semester: "Fall 2023"),
        Course(name: "Graduate Directed Project-2", professorName: "Dr. Mark Chai", timings: "Mon,Tue, Wed,Thu 12:00-2:30 PM", room: "GS1050", image: UIImage(named: "gdp") ?? UIImage(), semester: "Summer 2024"),
        Course(name: "Web Applications", professorName: "Dr. Charles Hoot", timings: "Mon,Wed,Fri 1:00-1:50 PM", room: "CH3600", image: UIImage(named: "webapps") ?? UIImage(), semester: "Fall 2023"),
    ]

    
    @IBOutlet weak var courseImageView: UIImageView!
    
    @IBOutlet weak var courseName: UILabel!
    
    @IBOutlet weak var professorName: UILabel!
    
    
    @IBOutlet weak var roomNo: UILabel!
    
    @IBOutlet weak var timing: UILabel!
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
        updateUI()
    }
    
    func updateUI() {
        guard let selectedSemester = semester else {
            return // Do nothing if semester is not selected
        }
        
        let filteredCourses = courses.filter { $0.semester == selectedSemester }
        guard !filteredCourses.isEmpty else {
            return // Do nothing if there are no courses for the selected semester
        }
        
        guard currentIndex < filteredCourses.count else {
            return // Do nothing if currentIndex is out of bounds after filtering
        }
        
        let course = filteredCourses[currentIndex]
        courseImageView.image = course.image
        courseName.text = course.name
        professorName.text = course.professorName
        timing.text = course.timings
        roomNo.text = course.room
        
        // Disable prevButton if currentIndex is 0, otherwise enable it
        prevButton.isEnabled = currentIndex > 0
        
        // Disable nextButton if currentIndex is the last index, otherwise enable it
        nextButton.isEnabled = currentIndex < filteredCourses.count - 1
    }
    
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let filteredCourses = courses.filter { $0.semester == semester }
        
        if currentIndex < filteredCourses.count - 1 {
            currentIndex += 1
            updateUI()
        }
    }
    
    @IBAction func prevButtonTapped(_ sender: UIButton) {
        if currentIndex > 0 {
            currentIndex -= 1
            updateUI()
        }
    }
}
