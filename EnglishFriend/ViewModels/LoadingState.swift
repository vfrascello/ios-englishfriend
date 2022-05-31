import Foundation

class LoadingState: ObservableObject {

    @Published var isLoading: Bool

    static let shared = LoadingState()

    init() {
        self.isLoading = false
    }

    init(_ isLoading: Bool){
        self.isLoading = isLoading
        
    }
}
