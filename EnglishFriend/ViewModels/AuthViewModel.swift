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
        LoadingState.shared.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            //prevent loading screen of death.  Eventually change isLoading into an enum with an error state that shows various connectivity errors.
            LoadingState.shared.isLoading = false
        }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                Crashlytics.crashlytics().log("[ERROR] AuthViewModel.login() error = \(error.localizedDescription)")
                self.authenticationFailed = true
                LoadingState.shared.isLoading = false
                return
            }
            self.authenticationFailed = false
            self.userSession = result?.user
            LoadingState.shared.isLoading = false
        }
    }

    func createUser(email: String, password: String, username: String, primaryLanguage: Int, completion: @escaping (Bool) -> Void) {

        LoadingState.shared.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            //prevent loading screen of death.  Eventually change isLoading into an enum with an error state that shows various connectivity errors.
            LoadingState.shared.isLoading = false
        }
        Auth.auth().createUser(withEmail: email, password: password) { [self] result, error in
            if let error = error {
                Crashlytics.crashlytics().log("[ERROR] AuthViewModel.registerUser() error = \(error.localizedDescription)")
                LoadingState.shared.isLoading = false
                completion(true)
                return
            }
            guard let user = result?.user else {
                LoadingState.shared.isLoading = false
                return }

            let data: [String: Any] = ["email": email,
                                       "uid": user.uid,
                                       "username": username,
                                       "primaryLanguage": Constants.primaryLanguageOptions[primaryLanguage]]
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if error != nil {
                    Crashlytics.crashlytics().log("[ERROR] AuthViewModel.registerUser() error = \(error!.localizedDescription)")
                }
                else {
                    completion(true)
                    self.userSession = user
                }
            }
            LoadingState.shared.isLoading = false
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

    func updateProfileImage(profileImage: UIImage) {
        guard let user = Auth.auth().currentUser else { return }

        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else {
            Crashlytics.crashlytics().log("[ERROR] AuthViewModel.updateProfileImage() image could not be converted to JPEG")
            return
        }

        let filename = NSUUID().uuidString
        let storageReference = Storage.storage().reference().child(filename)
        storageReference.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                Crashlytics.crashlytics().log("[ERROR] AuthViewModel.updateProfileImage() error = \(error.localizedDescription)")
                return
            }
            storageReference.downloadURL { url, _ in
                guard let profileImageURL = url?.absoluteString else { return }

                let data: [String: Any] = ["profileImageUrl": profileImageURL]

                Firestore.firestore().collection("users").document(user.uid).setData(data, merge: true) { error in
                    if error != nil {
                        Crashlytics.crashlytics().log("[ERROR] AuthViewModel.updateProfileImage() error = \(error!.localizedDescription)")
                    }

                }
            }
        }
    }
}
