//
//  ProfessorCollectionViewCell.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/5/24.
//
import UIKit

class ProfessorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coursesLabel: UILabel!
    @IBOutlet weak var timingsLabel: UILabel!
    @IBOutlet weak var roomsLabel: UILabel!
    
    func assignProfessor(with professor: Professor) {
        imageView.image = professor.image
        nameLabel.text = professor.name
        coursesLabel.text = "Courses: \(professor.courses.joined(separator: ", "))"
        timingsLabel.text = "Timings: \(professor.timings.joined(separator: ", "))"
        roomsLabel.text = "Rooms: \(professor.rooms.joined(separator: ", "))"
    }
}
