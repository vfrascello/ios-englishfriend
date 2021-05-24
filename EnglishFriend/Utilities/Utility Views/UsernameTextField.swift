import SwiftUI

struct UsernameTextField: View {
    @ObservedObject private var model = ValidatorModel()
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(model.usernameColor)
                TextField("", text: $text) {(_) in}
                    onCommit: {
                    }
                    .onChange(of: text) { value in
                        model.validateUsername(username: text)
                    }
                
            }
        }
    }
}


