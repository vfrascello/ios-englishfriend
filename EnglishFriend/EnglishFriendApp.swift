import SwiftUI
import Firebase

@main
struct EnglishFriendApp: App {

  //  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var phase
    //@Environment(\.window) var window: UIWindow?


    init() {
        FirebaseApp.configure()
        UINavigationBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.3007570207, green: 0.5991899967, blue: 0.3707683086, alpha: 1))
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
    }

    var body: some Scene {
        WindowGroup {
            ContentView(selectedIndex: 0).environmentObject(AuthViewModel.shared)
        }
    }
}
