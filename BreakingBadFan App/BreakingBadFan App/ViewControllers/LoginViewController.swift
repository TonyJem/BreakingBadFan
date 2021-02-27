import UIKit

enum Flow {
    case login
    case register
}

class LoginViewController: MainViewController {
    
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var loginSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    
    private var selectedFlow: Flow = .login {
        didSet {
            confirmPasswordTextField.isHidden = selectedFlow == .login
        }
    }
    
    private var loginFlowTextfields: [UITextField] = []
    private var registerFlowTextfields: [UITextField] = []
    private var shownTextfields: [UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        prepareTextFields()
    }
    
    @objc func textChanged(_ textField: UITextField) {
        shownTextfields = confirmPasswordTextField.isHidden ? loginFlowTextfields : registerFlowTextfields
        submitButton.isEnabled = !shownTextfields.contains { $0.text!.isEmpty }
    }
    
    @IBAction private func loginSegmentedControlChanged(_ sender: UISegmentedControl) {
        selectedFlow = sender.selectedSegmentIndex == 0 ? .login : .register
    }
    
    @IBAction private func submitButtonTapped(_ sender: UIButton) {
        
        switch selectedFlow {
        case .login:
            print("🟢 Proceed Login Flow")
        case .register:
            print("🟢 Proceed Register Flow")
        }
        
        
        proceedToHomeView()
    }
    
}

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
        loginFlowTextfields = [usernameTextField, passwordTextField]
        registerFlowTextfields = [usernameTextField, passwordTextField, confirmPasswordTextField]
    }
    
}
