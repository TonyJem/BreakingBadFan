import UIKit

class LoginViewController: MainViewController {
    
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var loginSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    
    private var loginFlowTexfields: [UITextField] = []
    private var registerFlowTexfields: [UITextField] = []
    private var shownTextfields: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        prepareTextFields()
    }
    
    @objc func textChanged(_ textField: UITextField) {
        shownTextfields = confirmPasswordTextField.isHidden ? loginFlowTexfields : registerFlowTexfields
        submitButton.isEnabled = !shownTextfields.contains { $0.text!.isEmpty }
    }
    
    @IBAction private func loginSegmentedControlChanged(_ sender: UISegmentedControl) {
        confirmPasswordTextField.isHidden = sender.selectedSegmentIndex == 0
    }
    
    @IBAction private func submitButtonTapped(_ sender: UIButton) {
        proceedToHomeView()
    }
    
}

// MARK: - private methods
private extension LoginViewController {
    
    private func setupUI() {
        loginSegmentedControl.selectedSegmentIndex = 0
        confirmPasswordTextField.isHidden = true
        submitButton.isEnabled = false
    }
    
    private func prepareTextFields() {
        usernameTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        confirmPasswordTextField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
        loginFlowTexfields = [usernameTextField, passwordTextField]
        registerFlowTexfields = [usernameTextField, passwordTextField, confirmPasswordTextField]
    }
    
}
