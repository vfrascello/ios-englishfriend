import SwiftUI
import Firebase
//import Purchases
//import CryptoKit
import Foundation
//import AuthenticationServices

class AuthViewModel: ObservableObject {

    @Published var userSession: FirebaseAuth.User?
    @Published var error: Error?
    @Published var user: User?
    @Published var selectedIndex: Int
    @Published var authenticationFailed: Bool = false

    static let shared = AuthViewModel()

    init()
    {
        userSession = Auth.auth().currentUser
        selectedIndex = 0
    }

    func login(withEmail email: String, password: String)
    {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                Crashlytics.crashlytics().log("[ERROR] AuthViewModel.login() error = \(error.localizedDescription)")
                self.authenticationFailed = true
                return
            }



            self.authenticationFailed = false
            self.userSession = result?.user
        }
    }

    func createUser(email: String, password: String , username: String, completion: @escaping (Bool) -> Void) {

        Auth.auth().createUser(withEmail: email, password: password) { [self] result, error in
                    if let error = error {
                        Crashlytics.crashlytics().log("[ERROR] AuthViewModel.registerUser() error = \(error.localizedDescription)")

                        completion(true)

                        return
                    }
                    guard let user = result?.user else { return }

                    let data: [String: Any] = ["email": email,
                                               "uid": user.uid,
                                               "username" : username]



                    Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                        if error != nil {
                            Crashlytics.crashlytics().log("[ERROR] AuthViewModel.registerUser() error = \(error!.localizedDescription)")
                        }
                        else {
                            completion(true)
                            self.userSession = user
                        }
                    }
                }
    }
    
    

    func signOut() {
        userSession = nil
        user = nil
        self.authenticationFailed = false
        selectedIndex = 0
        try? Auth.auth().signOut()
    }


    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                Crashlytics.crashlytics().log("[ERROR] resetPassword() error = \(error!.localizedDescription)")
            }
        }
    }

}
