
import SwiftUI

struct LoadingView: View {

    @State private var isLoading = false

    var body: some View {
        VStack{
        Circle()
        .trim(from: 0, to: 0.7)
        .stroke(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), lineWidth: 5)
        .frame(width: 100, height: 100)
        .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
        .animation(Animation.default.repeatForever(autoreverses: false))
        .onAppear() {
        self.isLoading = true
        }
        }

    }
}

