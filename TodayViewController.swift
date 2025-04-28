//
//  TodayViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit

class TodayViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!

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
            imageView.image = UIImage(named: "Ring")
        case 1:
            imageView.image = UIImage(named: "Ring2")
        case 2:
            imageView.image = UIImage(named: "Ring3")
        case 3:
            imageView.image = UIImage(named: "Ring4")
        case 4:
            imageView.image = UIImage(named: "Ring5")
        case 5:
            imageView.image = UIImage(named: "Ring6")
        case 6:
            imageView.image = UIImage(named: "Ring7")
        default:
            break
        }
    }


}
