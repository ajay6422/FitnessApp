//
//  ProfileViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var notificationLabel: UILabel!
    @IBOutlet var onlineLabel: UILabel!
    @IBOutlet var privacyLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        profileLabel.layer.cornerRadius = 10
        profileLabel.clipsToBounds = true
        
        detailsLabel.layer.cornerRadius = 10
        detailsLabel.clipsToBounds = true
        
        notificationLabel.layer.cornerRadius = 10
        notificationLabel.clipsToBounds = true
        
        onlineLabel.layer.cornerRadius = 10
        onlineLabel.clipsToBounds = true
        
        privacyLabel.layer.cornerRadius = 10
        privacyLabel.clipsToBounds = true
        
        profileImage.layer.cornerRadius = 30
        profileImage.clipsToBounds = true
    }
    

   

}
