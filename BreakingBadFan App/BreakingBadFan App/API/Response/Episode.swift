import Foundation

struct Episode: Codable {
    let id: Int
    let title: String
    let season: String
    let airDate: String
    let characters: [String]
    let episode: String
    let series: String
    
    enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case title
        case season
        case airDate = "air_date"
        case characters
        case episode
        case series
    }
}

