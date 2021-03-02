struct Season {
    let title: String
    let episodes: [EpisodeTest]
}

struct EpisodeTest {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

class SeasonModel {
    
    //        TODO: TestData
    let seasonsOLD = [
        Season(title: "Season 1", episodes: [EpisodeTest(title: "Pilot1"), EpisodeTest(title: "Second Episode1"), EpisodeTest(title: "Third Episode1")]),
        Season(title: "Season 2", episodes: [EpisodeTest(title: "Pilot2"), EpisodeTest(title: "Second Episode2"), EpisodeTest(title: "Third Episode2")]),
        Season(title: "Season 3", episodes: [EpisodeTest(title: "Pilot3"), EpisodeTest(title: "Second Episode3"), EpisodeTest(title: "Third Episode3")])
    ]
    
    var episodes = [Episode]()
    
    var seasonNumbers: [String] {
        return [String](self.seasons().keys).sorted{ $0 < $1 }
    }
    
    func seasons() -> [String: [Episode]] {
        var newSeasons = [String: [Episode]]()
        
        for episode in episodes {
            var tempArray = [Episode]()
            var seasonNumber = episode.seasonNumber
            seasonNumber = seasonNumber.trimmingCharacters(in: .whitespaces)
            
            if let season = newSeasons[seasonNumber] {
                tempArray = season
                tempArray.append(episode)
                newSeasons[seasonNumber] = tempArray
            } else {
                newSeasons[seasonNumber] = [episode]
            }
        }
        return newSeasons
    }
    
    func seasonBy(seasonNumber: String) -> [Episode] {
        guard let season = seasons()[seasonNumber] else { return [] }
        return season
    }
}

