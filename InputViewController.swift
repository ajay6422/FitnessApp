//
//  InputViewController.swift
//  Fitness
//
//  Created by Ajay Kumar on 27/04/25.
//

import UIKit

class InputViewController: UIViewController {
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var feetTextField: UITextField!
    
    @IBOutlet weak var inchesTextField: UITextField!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    var selectedAge = 20

    override func viewDidLoad() {
           super.viewDidLoad()
           ageLabel.text = "\(selectedAge)"
       }
       
       @IBAction func ageStepperChanged(_ sender: UIStepper) {
           selectedAge = Int(sender.value)
           ageLabel.text = "\(selectedAge)"
       }
       
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        guard let weight = Double(weightTextField.text ?? ""),
                     let feet = Double(feetTextField.text ?? ""),
                     let inches = Double(inchesTextField.text ?? "") else {
                   return
               }
               
               let totalHeightInMeters = ((feet * 12) + inches) * 0.0254
               let bmi = weight / (totalHeightInMeters * totalHeightInMeters)
               
               // Perform Segue
               performSegue(withIdentifier: "goToResult", sender: bmi)
        
    }
    
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToResult" {
               let destinationVC = segue.destination as! ResultViewController
               if let bmiValue = sender as? Double {
                   destinationVC.bmi = bmiValue
                   destinationVC.age = selectedAge
                   destinationVC.gender = genderSegmentedControl.selectedSegmentIndex == 0 ? "Male" : "Female"
               }
           }
       }
   }

