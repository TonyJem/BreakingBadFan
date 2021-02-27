import Foundation

struct Account: Codable {
    
    let username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
}
