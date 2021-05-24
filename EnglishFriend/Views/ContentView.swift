import SwiftUI
import Firebase

struct ContentView: View {

    @State var selectedIndex: Int
    @EnvironmentObject var viewModel: AuthViewModel
    @State var splashSignOut: Bool = false

    var body: some View {
        if viewModel.userSession != nil && viewModel.authenticationFailed == false  {
                ZStack{
                    TabView(selection: $selectedIndex) {
                        NavigationView {
                            Text("Matching View")
                                .onTapGesture {
                                    selectedIndex = 0
                                }
                        } .tabItem{
                            Image(systemName: "person.3")
                            Text("Match").font(.subheadline)
                        }.tag(0).hideNavigationBar()
                        NavigationView {
                           Text("Search")
                                .onTapGesture {
                                    selectedIndex = 1
                                }
                        }.tabItem{
                            Image(systemName: "magnifyingglass.circle")
                            Text("search").font(.subheadline)
                        }.tag(1).hideNavigationBar().navigationViewStyle(StackNavigationViewStyle())

                        NavigationView {
                            Text("Messages")
                            //ConversationsView()
                                .onTapGesture {
                                    selectedIndex = 2
                                }
                        }
                        .tabItem{
                            Image(systemName: "message.circle")
                            Text("Messages").font(.subheadline)
                        }.tag(2).hideNavigationBar().navigationViewStyle(StackNavigationViewStyle())
                        NavigationView {
                           Text("User Profile")
                                .onTapGesture {
                                    selectedIndex = 3
                                }
                        }
                        .tabItem{
                            Image(systemName: "person.crop.circle")
                            Text("Profile").font(.subheadline)
                        }.tag(3).hideNavigationBar()
                    }.accentColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                }
            }
    else {
        LoginView(email: "", password: "")
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedIndex: 0)
    }
}
