struct Season {
    let title: String
    let episodes: [Episode]
}

struct Episode {
    let title: String
    
    init(title: String) {
        self.title = title
    }
}

class SeasonModel {
    
//    TODO: TestData
    let seasons = [
        Season(title: "Season 1", episodes: [Episode(title: "Pilot1"), Episode(title: "Second Episode1"), Episode(title: "Third Episode1")]),
        Season(title: "Season 2", episodes: [Episode(title: "Pilot2"), Episode(title: "Second Episode2"), Episode(title: "Third Episode2")]),
        Season(title: "Season 3", episodes: [Episode(title: "Pilot3"), Episode(title: "Second Episode3"), Episode(title: "Third Episode3")])
    ]
    
}
