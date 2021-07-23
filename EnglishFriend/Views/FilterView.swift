import SwiftUI

enum FilterOptions: Int, CaseIterable {
    case biography
   case interests
    case languages


    var title: String {
        switch self{
        case .biography:
            return "About Me"
        case .interests:
            return "Interests"
        case .languages:
            return "My Languages"
        }
    }
}

struct FilterView: View {
    @Binding var selectedOption: FilterOptions

    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(FilterOptions.allCases.count)

    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(FilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }

    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ForEach(FilterOptions.allCases, id: \.self) { option in

                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth - 8)
                    })
                }
            }
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
                .animation(.spring())
                .padding(.leading, padding)
        }
    }
}
