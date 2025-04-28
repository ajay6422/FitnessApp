//
//  MoveViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit

class MoveViewController: UIViewController {

    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var minusButton: UIButton!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var unitLabel: UILabel!
    @IBOutlet var changeGoalButton: UIButton!
    var currentValue = 130 {
            didSet {
                valueLabel.text = "\(currentValue)"
            }
        }
    override func viewDidLoad() {
            super.viewDidLoad()
            
            setupUI()
        }
        
        func setupUI() {
            valueLabel.text = "\(currentValue)"
            unitLabel.text = "KILOCALORIES/DAY"
            
            minusButton.setTitle("–", for: .normal)
            plusButton.setTitle("+", for: .normal)
            
            minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 50)
            
            changeGoalButton.setTitle("Change Move Goal", for: .normal)
            changeGoalButton.setTitleColor(.systemGreen, for: .normal)
            
            minusButton.addTarget(self, action: #selector(decreaseValue), for: .touchUpInside)
            plusButton.addTarget(self, action: #selector(increaseValue), for: .touchUpInside)
        }
        
        @objc func decreaseValue() {
            if currentValue > 0 {
                currentValue -= 10
            }
        }
        
        @objc func increaseValue() {
            currentValue += 10
        }
    }

