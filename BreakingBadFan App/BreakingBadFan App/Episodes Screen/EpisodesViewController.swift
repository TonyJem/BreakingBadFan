import UIKit

class EpisodesViewController: UIViewController {

    @IBOutlet private var seasonsTableView: UITableView!
    
    private let model = SeasonModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seasonsTableView.dataSource = self
        seasonsTableView.tableFooterView = UIView()
    }
    
    @IBAction func filterButtonIsTapped(_ sender: UIBarButtonItem) {
        print("🟢 Filter button is tapped")
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: nil, completion: { response in
            
            print("🟡 [Character].count == ", response.count)
        })
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: "9", completion: { response in
            
            print("🟡 Selected Character nickname \(response[0].nickname)")
        })
    }
}

extension EpisodesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.seasons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < model.seasons.count {
            return model.seasons[section].title
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.seasons[section].episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let episode = model.seasons[indexPath.section].episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
}
