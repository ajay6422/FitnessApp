//
//  DistanceViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit

class DistanceViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initially set the image based on the first selected segment
        updateImageForSegment(selectedIndex: segmentedControl.selectedSegmentIndex)

        // Add target for value changed event
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }

    @objc func segmentChanged() {
        let selectedIndex = segmentedControl.selectedSegmentIndex
        updateImageForSegment(selectedIndex: selectedIndex)
    }

    func updateImageForSegment(selectedIndex: Int) {
        switch selectedIndex {
        case 0:
            imageView.image = UIImage(named: "Day1")
        case 1:
            imageView.image = UIImage(named: "Week1")
        case 2:
            imageView.image = UIImage(named: "Month1")
        case 3:
            imageView.image = UIImage(named: "Year1")
        default:
            break
        }
    }
}
