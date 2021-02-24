import UIKit

class LoginViewController: MainViewController {
    
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet weak var loginSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainBackgroundColor
    }
    
    @IBAction func loginSegmentedControlChanged(_ sender: UISegmentedControl) {
        print("🟢 loginSegmentedControlChanged")
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        proceedToHomeView()
    }
}
