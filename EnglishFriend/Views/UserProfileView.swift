
import SwiftUI

struct UserProfileView: View {

    @ObservedObject var viewModel: ProfileViewModel
    @State var isShowingToast: Bool = AuthViewModel.shared.user?.isShowingTutorialPopup ?? false
    @State var activeProfileSheet: ActiveProfileSheet? = nil
    @State var filterOption: FilterOptions = .biography

    init(user: User)
    {
        self.viewModel = ProfileViewModel(user: user)
    }

    var body: some View {
        VStack{
        ProfileHeaderView(viewModel: viewModel)
            FilterView(selectedOption: $filterOption)
        Button(action: {
            AuthViewModel.shared.signOut()
        }, label: {
            Text("Sign Out") })
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: MOCK_USER)
    }
}
