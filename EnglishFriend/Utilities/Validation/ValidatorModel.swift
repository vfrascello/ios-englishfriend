import SwiftUI

class ValidatorModel: ObservableObject {
    @Published var emailColor = Color(.white)
    @Published var passwordColor = Color(.white)
    @Published var usernameColor = Color(.white)
    @Published var fullnameColor = Color(.white)
    @Published var disabled = true
    
    func validateEmail(email: String) {
        if email.isEmpty {
            emailColor = .white
        } else {
            emailColor = Color(!email.isEmpty && !email.valid(.email) ? .red : .green)
        }
    }
    
    func validatePassword(password: String) {
        if password.isEmpty{
            passwordColor = .white
        } else {
            passwordColor = Color(!password.isEmpty && !password.valid(.password) ? .red : .green)
        }
    }
    
    func validateUsername(username: String) {
        if username.isEmpty {
            usernameColor = .white
        } else {
            usernameColor = Color(!username.isEmpty && !username.valid(.username) ? .red : .green)
        }
    }
    
    func validateFullname(fullname: String){
        if fullname.isEmpty {
            fullnameColor = .white
        } else {
            fullnameColor = Color(!fullname.isEmpty && !fullname.valid(.fullname) ? .red : .green)
        }
    }
}
