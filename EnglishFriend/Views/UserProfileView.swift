
import SwiftUI

struct UserProfileView: View {

    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    @State var isShowingToast: Bool = AuthViewModel.shared.user?.isShowingTutorialPopup ?? false
    @State var activeProfileSheet: ActiveProfileSheet? = nil

    init(user: User)
    {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }

    var body: some View {
        Text(viewModel.user.username ?? "no name")
        Button(action: {
            AuthViewModel.shared.signOut()
        }, label: {
            Text("Sign Out") })
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: MOCK_USER)
    }
}
