//
//  ActivityViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit

class ActivityViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    let data = [
        "Running",
        "Cycling",
        "Walking",
        "Jogging",
        "Hiking",
        "Swimming",
        "Playing Soccer",
        "Playing Cricket",
        "Skating",
        "Skipping Rope",
        "Outdoor Yoga",
        "Basketball",
        "Tennis",
        "Badminton",
        "Table Tennis",
        "Beach Volleyball",
        "Flying Kites",
        "Gardening",
        "Picnic",
        "Frisbee",
        "Playing Tag"
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        
        tableView.layer.cornerRadius = 20
        tableView.clipsToBounds = true


        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: data[indexPath.row])
    }





    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let destinationVC = segue.destination as? DetailViewController,
               let activity = sender as? String {

                destinationVC.activityName = activity

                // Now also send the related image
                switch activity {
                case "Running":
                    destinationVC.activityImage = UIImage(named: "running_image")
                case "Cycling":
                    destinationVC.activityImage = UIImage(named: "cycling_image")
                case "Walking":
                    destinationVC.activityImage = UIImage(named: "walking_image")
                case "Jogging":
                    destinationVC.activityImage = UIImage(named: "jogging_image")
                case "Hiking":
                    destinationVC.activityImage = UIImage(named: "hiking_image")
                case "Swimming":
                    destinationVC.activityImage = UIImage(named: "swimming_image")
                case "Playing Soccer":
                    destinationVC.activityImage = UIImage(named: "soccer_image")
                case "Playing Cricket":
                    destinationVC.activityImage = UIImage(named: "cricket_image")
                case "Skating":
                    destinationVC.activityImage = UIImage(named: "skating_image")
                case "Skipping Rope":
                    destinationVC.activityImage = UIImage(named: "skipping_rope_image")
                case "Jumping Jacks":
                    destinationVC.activityImage = UIImage(named: "jumping_jacks_image")
                case "Outdoor Yoga":
                    destinationVC.activityImage = UIImage(named: "outdoor_yoga_image")
                case "Basketball":
                    destinationVC.activityImage = UIImage(named: "basketball_image")
                case "Tennis":
                    destinationVC.activityImage = UIImage(named: "tennis_image")
                case "Badminton":
                    destinationVC.activityImage = UIImage(named: "badminton_image")
                case "Table Tennis":
                    destinationVC.activityImage = UIImage(named: "table_tennis_image")
                case "Beach Volleyball":
                    destinationVC.activityImage = UIImage(named: "beach_volleyball_image")
                case "Flying Kites":
                    destinationVC.activityImage = UIImage(named: "flying_kites_image")
                case "Gardening":
                    destinationVC.activityImage = UIImage(named: "gardening_image")
                case "Picnic":
                    destinationVC.activityImage = UIImage(named: "picnic_image")
                case "Frisbee":
                    destinationVC.activityImage = UIImage(named: "frisbee_image")
                case "Playing Tag":
                    destinationVC.activityImage = UIImage(named: "playing_tag_image")
                default:
                    destinationVC.activityImage = UIImage(named: "default_image")
                }

            }
        }
    }



    

    
}
