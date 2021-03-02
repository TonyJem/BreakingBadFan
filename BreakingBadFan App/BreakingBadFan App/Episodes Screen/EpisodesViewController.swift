import UIKit

class EpisodesViewController: UIViewController {

    @IBOutlet private var seasonsTableView: UITableView!
    
    private let apiManager = APIManager()
    private let model = SeasonModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchEpisodesToModel()
        
        seasonsTableView.dataSource = self
        seasonsTableView.tableFooterView = UIView()
    }
    
    @IBAction func filterButtonIsTapped(_ sender: UIBarButtonItem) {
        print("🟢 Filter button is tapped")
    }
    
    private func fetchEpisodesToModel() {
        apiManager.getEpisodes { result in
            switch result {
            case .success(let episodes):
                print("🟢  Episodes didFetch")
                self.model.episodes = episodes
                
                print("🟢🟢🟢 Season numbers \(self.model.seasonNumbers)")
                
            case .failure(let error):
                print("🔴 \(error)")
            }
        }
    }
    
}

extension EpisodesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        print(model.seasonNumbers.count)
        return model.seasonNumbers.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < model.seasonNumbers.count {
            return "Section \(model.seasonNumbers[section])"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.seasonBy(seasonNumber: String(section)).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let seasonNumber = model.seasonNumbers[indexPath.section]
        let season = model.seasonBy(seasonNumber: seasonNumber)
        let episode = season[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
}
