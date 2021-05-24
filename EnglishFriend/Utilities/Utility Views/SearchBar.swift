import SwiftUI

struct SearchBar: View {
    var placeholder: String
    @Binding var debouncedText: String
    @StateObject private var textObserver = TextFieldObserver()

    var body: some View {
        HStack {
            TextField(placeholder, text: $textObserver.searchText)
                .padding(8)
                .padding(.horizontal, 24)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    
                    })
        }
        .background(Color(.systemGray6))
        .clipped()
        .cornerRadius(20 / 2)
        .padding(20)
        .onReceive(textObserver.$debouncedText, perform: { value in
            debouncedText = value
        })
    }
}
