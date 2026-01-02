






import Foundation

@Observable
class SessionManager {
    
    var justSignedIn: Bool = false
    var sessionState: SessionState = .signedOut
    var currentUser: User?
    
}

enum SessionState {
    case signedIn, signedOut
}

