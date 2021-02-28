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
    
//    TODO: TestData
    let seasons = [
        Season(title: "Season 1", episodes: [EpisodeTest(title: "Pilot1"), EpisodeTest(title: "Second Episode1"), EpisodeTest(title: "Third Episode1")]),
        Season(title: "Season 2", episodes: [EpisodeTest(title: "Pilot2"), EpisodeTest(title: "Second Episode2"), EpisodeTest(title: "Third Episode2")]),
        Season(title: "Season 3", episodes: [EpisodeTest(title: "Pilot3"), EpisodeTest(title: "Second Episode3"), EpisodeTest(title: "Third Episode3")])
    ]
    
}
