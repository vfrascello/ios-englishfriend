
import SwiftUI

struct PasswordResetView: View {
    @State var email = ""
    @State var triggerAlert: Bool = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Text("Enter your email to reset your password")
                
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .disableAutocorrection(true)
                
                Button(action: {
                    if email != ""{
                        viewModel.resetPassword(email: email)
                        triggerAlert.toggle()
                        
                    }
                }, label: {
                    Text("Reset Password")
                        .font(.headline)
                        .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                        .frame(width: 300, height: 50)
                        .background(Color(.white))
                        .clipShape(Capsule())
                        .padding()
                })
                .alert(isPresented: $triggerAlert) {
                    Alert(title: Text("Password Reset"), message: Text("Check your Email for a Password Reset Link."), dismissButton: .default(Text("OK")))
                }
                NavigationLink(
                    destination: LoginView(email: "", password: "").hideNavigationBar(),
                    label: {
                        Text("Go Back")
                            .font(.headline)
                            .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                            .frame(width: 300, height: 50)
                            .background(Color(.white))
                            .clipShape(Capsule())
                            .padding()
                    })
                Spacer()
            }.padding(.horizontal, 40)
            .padding(.top, 200)
            .foregroundColor(.white)
            .hideNavigationBar()
            .background(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
            .ignoresSafeArea()
            
        }
    }
}

