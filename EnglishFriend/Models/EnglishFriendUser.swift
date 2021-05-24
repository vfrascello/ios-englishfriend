import Foundation

struct EnglishFriendUser  {
    
    var uid: String?
    var username: String?
    var email: String?
    
    init(dictionary: [String: Any])
    {
        self.uid = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
    
    
}
