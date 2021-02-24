import UIKit

class HomeViewController: MainViewController {

    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var episodesButton: UIButton!
    @IBOutlet weak var charactersButton: UIButton!
    @IBOutlet weak var quotesButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func episodesButtonTapped(_ sender: UIButton) {
        print("🟢 episodesButtonTapped")
    }
    
    @IBAction func charactersButtonTapped(_ sender: UIButton) {
        print("🟢 charactersButtonTapped")
    }
    
    @IBAction func quotesButtonTapped(_ sender: UIButton) {
        print("🟢 quotesButtonTapped")
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
