 import Firebase
 import SwiftUI

 class ProfileViewModel: ObservableObject {

     @Published var user: User

     init (user: User)
     {
         self.user = user
     }
 }

 extension ProfileViewModel {

    //functions here

 }

