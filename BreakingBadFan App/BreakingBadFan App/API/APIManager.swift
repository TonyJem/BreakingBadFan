import Foundation

struct APIManager {

    enum APIHTTPMethod {
        static let get = "GET"
    }

    private var session: URLSession {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }
}

extension APIManager {
    
    // MARK: - Episodes
    
    func getEpisodes(_ completion: @escaping (Result<[Episode], APIError>) -> ()) {
        guard let url = APIEndpoint.episodes.url else {
            completion(.failure(.failedURLCreation))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = APIHTTPMethod.get
        
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let episodesResponse = try JSONDecoder().decode(EpisodesResponse.self, from: data)
                        completion(.success(episodesResponse.episodes))
                    } catch {
                        completion(.failure(.unexpectedDataFormat))
                    }
                } else {
                    completion(.failure(.failedRequest))
                }
            }
        }.resume()
    }
}


/*
 
 static func getEpisodes(parameters: String, episodeId: String?, completion: @escaping ([EpisodeT]) -> Void) {
     
     let url: String = "\(BreakingBadApiConstants.baseUrl)\(parameters)\(episodeId ?? "")"
     print("[Started] getEpisodes() url == ", url)
     URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
         guard let data = data, error == nil else { return }
         
         do {
             let response: [EpisodeT] = try JSONDecoder().decode([EpisodeT].self, from: data)
             completion(response)
             print("[Success] getEpisodes() [Episode].count == ", response.count)
             
         } catch {
             print("[Error] getEpisodes() ==", error.localizedDescription)
         }
     }).resume()
 }

 */
