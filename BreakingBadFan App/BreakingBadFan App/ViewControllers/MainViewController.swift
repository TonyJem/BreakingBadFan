import UIKit

class MainViewController: UIViewController {
    
// MARK: - UIViewControllers
    
    private lazy var HomeStoryboard: UIStoryboard = {
        UIStoryboard(name: "Home", bundle: nil)
    }()
    
    
// MARK: - UIViewControllers
    
    private var HomeViewController: UIViewController {
        HomeStoryboard.instantiateViewController(identifier: "HomeViewController")
    }
    
}

// MARK: - Transitions

extension MainViewController {
    
    func proceedToQuizView() {
        modalPresentationStyle = .fullScreen
        present(HomeViewController, animated: true)
    }
}
