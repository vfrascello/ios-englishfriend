import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?

    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }

        AuthViewModel.shared.updateProfileImage(profileImage: selectedImage)
    }

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .loadImmediately()
                    .fade(duration: 0.5)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 120, height: 120)
                    .cornerRadius(120 / 2)
                    .shadow(color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), radius: 8, x: 0.0, y: 0.0)
                    .navigationBarItems(leading: viewModel.user.isCurrentUser ? Text("Edit Profile") : Text("Not Current User"))
                    if (viewModel.user.isCurrentUser) {
                        Button(action: {
                            showImagePicker.toggle()
                        }, label: {
                            Image(systemName: "square.and.pencil").foregroundColor(.blue).opacity(0.5)
                        })
                    }
                }
                Text(viewModel.user.username ?? "no name")
                    Text("Native Language: \(viewModel.user.nativeLanguage!.rawValue)")
                    Text("Learning Language: \(viewModel.user.nativeLanguage!.rawValue)")

                }.sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: { ImagePicker(image: $selectedUIImage) })
        if (viewModel.user.isCurrentUser)
        {

        }
}
}
