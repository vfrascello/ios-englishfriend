
import SwiftUI
import Combine

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""

    private var subscriptions = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .seconds(0.4), scheduler: DispatchQueue.main)
            .sink(receiveValue: { text in
                self.debouncedText = text
            } )
            .store(in: &subscriptions)
    }
}
