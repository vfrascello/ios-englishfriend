import SwiftUI

extension String {
    
    enum ValidateFieldType {
        case email, password, username, fullname
    }
    
    func valid(_ type: ValidateFieldType) -> Bool {
        switch type {
        case .email:
            /// Requres @domain.something, domain has to be at least 2 characters
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
            
        case .password:
            /// Ensure that password is 8 to 64 characters long and contains a mix of upper and lower case characters, one numeric and one special character
            let passwordRegEx = #"((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,64})"#
            return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: self)
            
        case .username:
            ///   no _ or . at the end
            ///   A-Z, a-z, 0-9 allowed
            ///   no __ or _. or ._ or .. inside
            ///   no _ or . at the beginning
            ///   Between 8-20 Characters
            let usernameRegEx = #"(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"#
            return NSPredicate(format: "SELF MATCHES %@", usernameRegEx).evaluate(with: self)
        
        case .fullname:
            ///    ^                       // start of line
            ///    [a-zA-Z]{2,}       //  name with at least two characters
            ///    \s                         // will look for white space
            ///    [a-zA-Z]{1,}       // needs at least 1 Character
            ///   \'?-?                       // double barreled and hyphenated surnames
            ///    [a-zA-Z]{2,}       // at least two characters
            ///    \s?                       // possibility of another whitespace
            ///    ([a-zA-Z]{1,})?   // possibility of a second surname
            let fullnameRegEx = #"^([a-zA-Z]{2,}\s[a-zA-Z]{1,}'?-?[a-zA-Z]{2,}\s?([a-zA-Z]{1,})?)"#
            return NSPredicate(format: "SELF MATCHES %@", fullnameRegEx).evaluate(with: self)
        }
    }
}
