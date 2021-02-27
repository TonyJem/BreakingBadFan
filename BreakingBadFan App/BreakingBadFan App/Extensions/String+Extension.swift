import Foundation

extension String {

    var isNotEmpty: Bool {
        !isEmpty
    }
    
    var hasUpperCase: Bool {
        let texttest = NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*")
        return texttest.evaluate(with: self)
    }
    
}

//    let capitalLetterRegEx  = ".*[A-Z]+.*"
//    let numberRegEx  = ".*[0-9]+.*"
//    let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
