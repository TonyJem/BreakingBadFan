import Foundation

struct User: Codable {
    
    let name: String
    var password: String
    
    init(name: String, password: String) {
        self.name = name
        self.password = password
    }
    
}
