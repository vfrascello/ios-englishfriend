import SwiftUI
import Firebase
import AuthenticationServices

struct LoginView: View {
    @State var email: String
    @State var password: String
    @EnvironmentObject var viewModel: AuthViewModel


    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    VStack {
                        Spacer()
                        Image("SplashLogo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 100)
                            .padding(.top, 100)
                            .padding(.bottom, 50)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), radius: 8, x: 0.0, y:0.0)
                        
                        VStack(spacing: 10) {
                            CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                                .keyboardType(.emailAddress)
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                                .disableAutocorrection(true)
                            
                            CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                                .padding()
                                .background(Color(.init(white: 1, alpha: 0.15)))
                                .cornerRadius(10)
                        }.padding(.horizontal, 40).padding(.bottom,10)
                        .foregroundColor(.white)
                        .disableAutocorrection(true)
            
                        VStack(spacing: 10){
                            Button(action: {
                                viewModel.login(withEmail: email, password: password)
                            }, label: {
                                HStack{
                                    Image("SplashLogo")
                                        .resizable()
                                        .frame(width: 20, height: 20, alignment: .trailing)
                                        .scaledToFit()
                                    Text("Continue with Email").bold().font(.system(size: 15))

                                }.padding(.leading, 20)
                                .foregroundColor(.black)
                                .frame(width: 250, height: 40, alignment: .leading)
                                .background(Color(.white))
                                .clipShape(Capsule())
                            })
                        }
                        Spacer()
                            
                            .alert(isPresented: $viewModel.authenticationFailed) {
                                Alert(
                                    title: Text("Login Failed"),
                                    message: Text("Try Again."),
                                    dismissButton: .default(Text("OK")) {
                                        email = ""
                                        password = ""
                                        viewModel.authenticationFailed = false
                                    }
                                )
                            }
                        
                        
                        
                        NavigationLink(
                            destination: RegistrationView().hideNavigationBar(),
                            label: {
                                HStack {
                                    Text("Don't have an account?")
                                        .font(.system(size: 14))
                                    
                                    Text("Sign Up").bold()
                                        
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                }
                                .foregroundColor(.white)
                                .padding(.bottom, 40)
                            })
                        
                        NavigationLink(
                            destination: PasswordResetView().hideNavigationBar(),
                            label: {
                                
                                HStack{
                                    Spacer()
                                    Text("Forgot Password?").bold()
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                            }).padding(.bottom, 20)
                    }
                }.hideNavigationBar()
                .background(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                .ignoresSafeArea()
                .keyboardAdaptive()
            }.navigationViewStyle(StackNavigationViewStyle())
        }.dismissKeyboardOnTap()
        
    }


}

