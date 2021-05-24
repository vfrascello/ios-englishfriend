import SwiftUI
import Firebase

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var username = ""
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
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person.fill.turn.right")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)

                }.disableAutocorrection(true)
                .padding(.horizontal, 40)
                .foregroundColor(.white)
                Button(action: {
                    viewModel.createUser(email: email, password: password, username: username) { registrationComplete in
                        print("new user created:", registrationComplete)
                    }
                        print("Arsbic Conversion complete efore")
                }, label: {
                    HStack{
                        Text("Hey Dad")
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
        .background(Color(#colorLiteral(red: 0.3007570207, green: 0.5991899967, blue: 0.3707683086, alpha: 1)))
        .ignoresSafeArea()

    }


}

