import UIKit

class DescriptionViewController: UIViewController {
    var activityName: String?
    var activityDescription: String?
    var activityImage: UIImage?

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the description and image for the selected activity
        descriptionLabel.text = activityDescription
        activityImageView.image = activityImage
    }
}
