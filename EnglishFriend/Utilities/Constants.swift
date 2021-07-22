
class Constants {
    
    static let primaryLanguageOptions = ["Spanish", "German", "French"]
}

enum Languages: String {

    case spanish = "Spanish"
    case french = "French"
    case german = "German"
}

enum ActiveProfileSheet: Identifiable {
   case signup, profileImage
   var id: Int {
      hashValue
   }
}

var MOCK_USER = User(dictionary: ["uid": 1, "username": "Mock User"])
