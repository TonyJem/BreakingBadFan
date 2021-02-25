import Foundation

struct UserDefaultsManager {
    
    private enum UserDefaultsManagerKey {
        static let accounts = "Account"
        static let currentUser = "CurrentUser"
    }
    
    private static var userDefaults: UserDefaults {
        UserDefaults.standard
    }
    
    private static var keyChain: KeychainSwift {
        KeychainSwift()
    }
    
    static func saveAccount(_ account: inout Account) {
        var savedAccounts = [Account]()
        
        if let accounts = accounts {
            savedAccounts = accounts
        }
        savePassword(account.password, username: account.username)
        account.password = ""
        savedAccounts.append(account)
        accounts = savedAccounts
    }
    
}

// MARK: - Helpers

extension UserDefaultsManager {
    
    static var accounts: [Account]? {
        get {
            guard let encodedAccounts = userDefaults.object(forKey: UserDefaultsManagerKey.accounts) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode([Account].self, from: encodedAccounts)
        } set {
            let encodedAccounts = try? JSONEncoder().encode(newValue)
            userDefaults.set(encodedAccounts, forKey: UserDefaultsManagerKey.accounts)
        }
    }
    
    static var currentUser: Account? {
        get {
            guard let currentUser = userDefaults.object(forKey: UserDefaultsManagerKey.currentUser) as? Data else {
                return nil
            }
            return try? JSONDecoder().decode(Account.self, from: currentUser)
        } set {
            let currentUser = try? JSONEncoder().encode(newValue)
            userDefaults.set(currentUser, forKey: UserDefaultsManagerKey.currentUser)
        }
    }
    
    private static func savePassword(_ password: String, username: String) {
        keyChain.set(password, forKey: username)
    }
    
    static func getPassword(username: String) -> String? {
        keyChain.get(username)
    }
}
