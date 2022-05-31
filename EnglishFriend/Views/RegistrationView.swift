import SwiftUI
import Firebase

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var username = ""
    @State var primaryLanguage = 0
    @State var selectedUIImage: UIImage?
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        ZStack {
            VStack {
                VStack(spacing: 10) {

                    EmailTextField(text: $email, placeholder: Text("E-Mail"), imageName: "envelope")
                        .padding()
                        .keyboardType(.emailAddress)
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)

                    CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person.fill")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                    
                    Picker("Favorite Color", selection: $primaryLanguage, content: {
                        Text(Constants.primaryLanguageOptions[0]).tag(0)
                        Text(Constants.primaryLanguageOptions[1]).tag(1)
                        Text(Constants.primaryLanguageOptions[2]).tag(2)
                        })

                }.disableAutocorrection(true)
                .padding(.horizontal, 40)
                .foregroundColor(.white)
                Button(action: {
                    viewModel.createUser(email: email, password: password, username: username, primaryLanguage: primaryLanguage) { registrationComplete in
                        print("new user created:", registrationComplete)
                    }

                }, label: {
                    HStack{
                        Text("Continue")
                    }.frame(width: 260, height: 30)
                    .animation(.easeIn)
                    .background(Color(.white))
                    .clipShape(Capsule())
                    .padding(5)
                })

                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14))
                    Button(action: { mode.wrappedValue.dismiss() }, label: {
                        Text("Sign in")
                            .font(.system(size: 14, weight: .semibold))
                    })
                }
                .foregroundColor(.white)
                .padding(.bottom, 6)
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .hideNavigationBar()
        .background(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
        .ignoresSafeArea()

    }


}

