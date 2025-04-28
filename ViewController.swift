import UIKit
import HealthKit

class ViewController: UIViewController {
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var ActivityRing: UILabel!
    @IBOutlet weak var StepCount: UILabel!
    @IBOutlet weak var StepDistance: UILabel!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var TrendsLabel: UILabel!
    @IBOutlet weak var AwardsLabel: UILabel!
    @IBOutlet weak var Awards: UILabel!
    @IBOutlet var StepsImage: UIImageView!
    @IBOutlet var DistanceImage: UIImageView!
    @IBOutlet weak var ringImage: UIImageView!
    let healthStore = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caloriesLabel.layer.cornerRadius = 10
        caloriesLabel.clipsToBounds = true
        
        stepsLabel.layer.cornerRadius = 10
        stepsLabel.clipsToBounds = true
        
        distanceLabel.layer.cornerRadius = 10
        distanceLabel.clipsToBounds = true
        
        ProfileImage.layer.cornerRadius = 30
        ProfileImage.clipsToBounds = true
        
        TrendsLabel.layer.cornerRadius = 10
        TrendsLabel.clipsToBounds = true
        
        ActivityRing.layer.cornerRadius = 10
        ActivityRing.clipsToBounds = true
        
        StepCount.layer.cornerRadius = 10
        StepCount.clipsToBounds = true
        
        StepDistance.layer.cornerRadius = 10
        StepDistance.clipsToBounds = true
        
        AwardsLabel.layer.cornerRadius = 10
        AwardsLabel.clipsToBounds = true
        
        Awards.layer.cornerRadius = 10
        Awards.clipsToBounds = true
        
        StepsImage.layer.cornerRadius = 10
        StepsImage.clipsToBounds = true
        
        DistanceImage.layer.cornerRadius = 10
        DistanceImage.clipsToBounds = true
        
        ringImage.layer.cornerRadius = 78
        ringImage.clipsToBounds = true
        
        requestAuthorization()
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.fetchHealthData { steps, distance, calories in
                DispatchQueue.main.async {
                    self.caloriesLabel.text = "Calories: \(Int(calories)) kcal"
                    self.stepsLabel.text = "Steps: \(Int(steps))"
                    self.distanceLabel.text = String(format: "Distance: %.2f meters", distance)
                }
            }
        }
    }
    
    func requestAuthorization() {
        let readTypes: Set<HKObjectType> = [
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
            if success {
                print("Authorization successful")
            } else {
                print("Authorization failed: \(String(describing: error))")
            }
        }
    }
    
    func fetchHealthData(completion: @escaping (_ steps: Double, _ distance: Double, _ calories: Double) -> Void) {
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)

        let stepsType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let caloriesType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!

        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

        let stepsQuery = HKStatisticsQuery(quantityType: stepsType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            var steps = 0.0
            if let sum = result?.sumQuantity() {
                steps = sum.doubleValue(for: HKUnit.count())
            }

            let distanceQuery = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, distanceResult, _ in
                var distance = 0.0
                if let sum = distanceResult?.sumQuantity() {
                    distance = sum.doubleValue(for: HKUnit.meter())
                }

                let caloriesQuery = HKStatisticsQuery(quantityType: caloriesType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, caloriesResult, _ in
                    var calories = 0.0
                    if let sum = caloriesResult?.sumQuantity() {
                        calories = sum.doubleValue(for: HKUnit.kilocalorie())
                    }
                    
                    completion(steps, distance, calories)
                }

                self.healthStore.execute(caloriesQuery)
            }

            self.healthStore.execute(distanceQuery)
        }

        healthStore.execute(stepsQuery)
    }
}
