import UIKit

class HomeViewController: MainViewController {
    
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var episodesButton: UIButton!
    @IBOutlet private weak var charactersButton: UIButton!
    @IBOutlet private weak var quotesButton: UIButton!
    @IBOutlet private weak var logoutButton: UIButton!
    
    private let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let loggedInAccount = AccountManager.loggedInAccount else { return }
        usernameLabel.text = loggedInAccount.username
//        TODO: Temporary off
//        quotesButton.isEnabled = !loggedInAccount.favouriteQuotes.isEmpty
    }
    
    @IBAction private func episodesButtonTapped(_ sender: UIButton) {
        print("🟢 episodesButtonTapped")
        proceedEpisodesScene()
        
        apiManager.getEpisodes { result in
            switch result {
            case .success(let episodes):
//   TODO: Add real functionality here
                print("🟢  Episodes: \(episodes)" )
            case .failure(let error):
                print("🔴 \(error)")
            }
        }
    }
    
    @IBAction private func charactersButtonTapped(_ sender: UIButton) {
        print("🟢 charactersButtonTapped")
        

    }
    
    @IBAction private func quotesButtonTapped(_ sender: UIButton) {
        print("🟢 quotesButtonTapped")
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: nil, completion: { response in
            print("🟡 [Character].count == ", response.count)
        })
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: "1", completion: { response in
            print("🟡 Selected Character nickname \(response[0].nickname)")
        })
        
        BreakingBadService.getEpisodes(parameters: BreakingBadApiConstants.paramEpisodes, episodeId: nil, completion: { response in
            print("🟣 [Espisode].count == ", response.count)
        })
        
        BreakingBadService.getEpisodes(parameters: BreakingBadApiConstants.paramEpisodes, episodeId: "1", completion: { response in
            print("🟣 Title for selected Episode: ", response[0].title)
        })
    }
    
    @IBAction private func logoutButtonTapped(_ sender: UIButton) {
        AccountManager.loggedInAccount = nil
        dismiss(animated: true)
    }
    
}
