import Firebase
struct User  {
    
    var uid: String?
    var username: String?
    var email: String?
    var primaryLanguage: Languages?
    var nativeLanguage: Languages?
    var initialSkillLevel: Int?
    var isShowingTutorialPopup: Bool
    let isCurrentUser: Bool
    var profileImageUrl: String
    var currentFCMToken: String

    init(dictionary: [String: Any])
    {
        self.uid = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.primaryLanguage = dictionary["primaryLanguage"] as? Languages ?? .spanish
        self.nativeLanguage = dictionary["nativeLanguage"] as? Languages ?? .spanish
        self.initialSkillLevel = dictionary["initialSkillLevel"] as? Int ?? 0
        self.isCurrentUser = Auth.auth().currentUser?.uid == self.uid
        self.isShowingTutorialPopup = dictionary["isShowingTutorialPopup"] as? Bool ?? true
        self.currentFCMToken = dictionary["currentFCMToken"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
