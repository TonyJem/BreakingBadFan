import Foundation

class BreakingBadApiConstants {
    
    static let baseUrl: String = "https://www.breakingbadapi.com/api/"
    static let paramCharacters: String = "characters/"
    
}

struct Character: Codable {
    let char_id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let img: String
    let status: String
    let appearance: [Int]?
    let nickname: String
    let portrayed: String
    let category: String
    let better_call_saul_appearance: [Int]?
}

class BreakingBadService {
    
    static func getCharacters(parameters: String, characterId: String?, completion: @escaping ([Character]) -> Void) {
        
        let url: String = "\(BreakingBadApiConstants.baseUrl)\(parameters)\(characterId ?? "")"
        
        print("[Started] getCharacters() url == ", url)
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response: [Character] = try JSONDecoder().decode([Character].self, from: data)
                completion(response)
                
                print("[Success] getCharacters() [Character].count == ", response.count)
                
            } catch {
                
                print("[Error] getCharacters() ==", error.localizedDescription)
                
            }
            
        }).resume()
    }
    
}
