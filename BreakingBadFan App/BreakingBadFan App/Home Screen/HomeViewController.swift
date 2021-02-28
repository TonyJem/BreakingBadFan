import UIKit

class HomeViewController: MainViewController {
    
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var episodesButton: UIButton!
    @IBOutlet private weak var charactersButton: UIButton!
    @IBOutlet private weak var quotesButton: UIButton!
    @IBOutlet private weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let loggedInAccount = AccountManager.loggedInAccount else { return }
        usernameLabel.text = loggedInAccount.username
        quotesButton.isEnabled = !loggedInAccount.favouriteQuotes.isEmpty
    }
    
    @IBAction private func episodesButtonTapped(_ sender: UIButton) {
        print("🟢 episodesButtonTapped")
        proceedEpisodesScene()
    }
    
    @IBAction private func charactersButtonTapped(_ sender: UIButton) {
        print("🟢 charactersButtonTapped")
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: nil, completion: { response in
            print("🟡 [Character].count == ", response.count)
        })
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: "9", completion: { response in
            print("🟡 Selected Character nickname \(response[0].nickname)")
        })
        
    }
    
    @IBAction private func quotesButtonTapped(_ sender: UIButton) {
        print("🟢 quotesButtonTapped")
    }
    
    @IBAction private func logoutButtonTapped(_ sender: UIButton) {
        AccountManager.loggedInAccount = nil
        dismiss(animated: true)
    }
    
}
