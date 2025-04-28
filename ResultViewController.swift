import UIKit

class ResultViewController: UIViewController {
    
    var bmi: Double = 0.0
    var age: Int = 0
    var gender: String = ""
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = String(format: "%.1f", bmi)
        
        let category = getBMICategory(bmi)
        categoryLabel.text = category
        
        messageLabel.text = getMessage(for: category)
    }
    
    func getBMICategory(_ bmi: Double) -> String {
        switch bmi {
        case ..<18.5:
            return "Underweight"
        case 18.5..<27.1:
            return "Normal"
        case 27.2..<30.6:
            return "Overweight"
        default:
            return "Obese Class I"
        }
    }
    
    func getMessage(for category: String) -> String {
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .byWordWrapping
        switch category {
            
        case "Normal":
            return "👍 Thumbs Up! You've done a great job and now only need to maintain your healthy lifestyle to stay in this range."
        case "Underweight":
            return "⚠️ You are underweight. Consider a nutritious diet to reach a healthy BMI."
        case "Overweight":
            return "⚠️ You are overweight. A healthy diet and exercise may help."
        case "Obese Class I":
            return "⚠️ Obesity detected. Please consult a healthcare provider for guidance."
            
        default:
            return ""
            
           
        }
       
        
    }
}
