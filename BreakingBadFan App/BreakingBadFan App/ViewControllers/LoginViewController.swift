import UIKit

class LoginViewController: MainViewController {
    
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var loginSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    
    private var isLoginModeActive = true {
        didSet {
            confirmPasswordTextField.isHidden = isLoginModeActive
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    @IBAction private func loginSegmentedControlChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            isLoginModeActive = true
        } else {
            isLoginModeActive = false
        }
    }
    
    @IBAction private func submitButtonTapped(_ sender: UIButton) {
        proceedToHomeView()
    }
    
}

// MARK: private methods
private extension LoginViewController {
    
    private func setupUI() {
        view.backgroundColor = Colors.mainBackgroundColor
        isLoginModeActive = true
        loginSegmentedControl.selectedSegmentIndex = 0
    }
    
}
