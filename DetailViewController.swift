//
//  DetailViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit


class DetailViewController: UIViewController {
    var activityName: String?
    var activityImage: UIImage?

    @IBOutlet weak var activityLabel: UILabel!
    

 
    @IBOutlet var activityImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        activityLabel.text = activityName
        activityImageView.image = activityImage

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDescription" {
            if let destinationVC = segue.destination as? DescriptionViewController,
               let activity = sender as? String {

                // Define descriptions and images for activities
                var descriptionText: String = ""
                var image: UIImage?

                switch activity {
                case "Running":
                    descriptionText = "Running is a great way to improve cardiovascular health."
                    image = UIImage(named: "running_image") // Ensure you have this image in your Assets
                case "Cycling":
                    descriptionText = "Cycling is an excellent low-impact exercise."
                    image = UIImage(named: "cycling_image")
                case "Swimming":
                    descriptionText = "Swimming provides a full-body workout."
                    image = UIImage(named: "swimming_image")
                // Add more cases for other activities if needed
                default:
                    descriptionText = "No description available."
                    image = UIImage(named: "default_image")
                }

                // Pass the data to the DescriptionViewController
                destinationVC.activityName = activity
                destinationVC.activityDescription = descriptionText
                destinationVC.activityImage = image
            }
        }
    }

    

    

}
