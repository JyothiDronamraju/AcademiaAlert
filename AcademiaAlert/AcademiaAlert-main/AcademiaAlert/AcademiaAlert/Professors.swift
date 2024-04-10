//
//  Professors.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/5/24.
//
import Foundation

// Professor.swift

import Foundation
import UIKit

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

let professors: [Professor] = [
    Professor(name: "Dr. Ajay Bandi",
              image: UIImage(named: "Ajay Bandi")!,
              courses: ["IOS", "Patterns", "Generative AI"],
              timings: ["Tue, Thu 9:30-10:50 AM", "Tue, Thu 12:30-1:50 PM", "Online Class"],
              rooms: ["Lab", "CH3600"],
              semester: "Summer 2024"), // Include semester for each professor
    Professor(name: "Dr. Mark Chai",
              image: UIImage(named: "Mark Chai")!,
              courses: ["GDP1"],
              timings: ["Mon, Wed, Fri 9:00-9:50 AM"],
              rooms: ["GS1050"],
              semester: "Spring 2024"),
    Professor(name: "Dr. Prasad Chetti",
              image: UIImage(named: "Prasad Chetti")!,
              courses: ["Advanced Database"],
              timings: ["12:00-12:50 PM"],
              rooms: ["VLK1100"],
              semester: "Fall 2023"),
    Professor(name: "Dr. Charles Hoot",
              image: UIImage(named: "Charles Hoot")!,
              courses: ["Webapps"],
              timings: ["Mon, Wed, Fri 1:00-1:50 PM"],
              rooms: ["CH3600"],
              semester: "Fall 2023"),
    Professor(name: "Dr. Ratan Lal",
              image: UIImage(named: "Ratan Lal")!,
              courses: ["Java"],
              timings: ["Mon, Wed, Fri 11:00-11:50 AM"],
              rooms: ["CH1110"],
              semester: "Fall 2023"),
    // Add other professors here with their details and semester
]
