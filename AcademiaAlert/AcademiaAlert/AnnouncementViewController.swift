//
//  AnnouncementViewController.swift
//  AcademiaAlert
//
//  Created by Jyothi Dronamraju on 4/7/24.
//

import UIKit

class AnnouncementViewController: UIViewController {

    let announcements: [String] = [
        "Patterns Final Exam: Tuesday, April 23, 7:00 pm - 9:00 pm",
        "iOS Finals Exam: 25th April 2024, 07:30 am - 09:30 am Video Presentation of Project",
        "GDP 1 Final  PPT needs to be submitted by 14th of this month"
    ]


    @IBOutlet weak var announcementLabel: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!

    var currentAnnouncementIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a UIImageView and set its image to your desired background image
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1")
        backgroundImage.contentMode = .scaleAspectFill // Adjusts the image to fill the entire view

        // Add the UIImageView to the back of your view
        self.view.insertSubview(backgroundImage, at: 0)
        displayAnnouncement(at: currentAnnouncementIndex)
    }

    func displayAnnouncement(at index: Int) {
        announcementLabel.text = announcements[index]
        updateButtons()
    }

    func updateButtons() {
        prevButton.isEnabled = currentAnnouncementIndex > 0
        nextButton.isEnabled = currentAnnouncementIndex < announcements.count - 1
    }

    @IBAction func prevButtonTapped(_ sender: UIButton) {
        if currentAnnouncementIndex > 0 {
            currentAnnouncementIndex -= 1
            displayAnnouncement(at: currentAnnouncementIndex)
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentAnnouncementIndex < announcements.count - 1 {
            currentAnnouncementIndex += 1
            displayAnnouncement(at: currentAnnouncementIndex)
        }
    }
}
