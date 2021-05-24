import SwiftUI

struct RadarAnimationView: View {
    @State var rotateOuter = false
    @State var rotateInner = false
    var body: some View {

            Spacer()
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            {
                Spacer()
                ZStack(alignment: .center) {
            Image("large-waves")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(Color(#colorLiteral(red: 0.3007570207, green: 0.5991899967, blue: 0.3707683086, alpha: 1)))
                .rotationEffect(.degrees(rotateInner ? -180 : 0))
                .animation(Animation.easeInOut(duration: 1)
                .repeatForever(autoreverses: true))
                .onAppear() {
                    self.rotateOuter.toggle()
                }
            Image("small-waves")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(#colorLiteral(red: 0.3007570207, green: 0.5991899967, blue: 0.3707683086, alpha: 1)))
                .rotationEffect(.degrees(rotateInner ? 180 : 0))
                .animation(Animation.easeOut(duration: 1)
                .repeatForever(autoreverses: true))
                .onAppear(){
                    self.rotateInner.toggle()
                }
                }
                Spacer()
            }
            Spacer()


    }
}
