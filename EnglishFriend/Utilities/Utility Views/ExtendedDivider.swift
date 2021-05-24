import SwiftUI
import Foundation

struct ExtendedDivider: View {
    var width: CGFloat = 2
    var direction: Axis.Set = .horizontal
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorScheme == .dark ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.3007570207, green: 0.5991899967, blue: 0.3707683086, alpha: 1)))
                .applyIf(direction == .vertical) {
                    $0.frame(width: width)
                    .edgesIgnoringSafeArea(.vertical)
                } else: {
                    $0.frame(height: width)
                    .edgesIgnoringSafeArea(.horizontal)
                }
        }
    }
}

extension View {
    @ViewBuilder func applyIf<T: View>(_ condition: @autoclosure () -> Bool, apply: (Self) -> T, else: (Self) -> T) -> some View {
        if condition() {
            apply(self)
        } else {
            `else`(self)
        }
    }
}
