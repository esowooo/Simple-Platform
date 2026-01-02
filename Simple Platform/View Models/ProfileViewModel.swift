






import Foundation

@Observable
class ProfileViewModel {
    
    var user: User = User(id: "", username: "Guest", password: "", email: "Guest@gmail.com", localeCountry: Country.none.rawValue, localeCity: City.none.rawValue, role: Role.user.rawValue, createdAt: Date(), updatedAt: Date())
    
    //Profile Menu
    var showSetting = false
    var showNotifications = false
    var showFAQ = false
    var showInquiry = false
    var showEditProfile = false
    var showGuide = false

    
    //error handling
    var alertTitle: String = ""
    var alertMessage: String = ""
    var showAlert: Bool = false
    var showMessage: Bool = false
    
    //MARK: - Error Handling (Prototype)
    func createAlert(title: String, message: String, error: Error? = nil){
        if let error = error {
            print(error.localizedDescription)
        }
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
    
    func createMessage(title: String, message: String, error: Error? = nil){
        if let error = error {
            print(error.localizedDescription)
        }
        alertTitle = title
        alertMessage = message
        showMessage = true
    }
    
    
    func fetchCurrentUser(session: SessionManager) {
        if session.sessionState == .signedIn {
            if let currentUser = session.currentUser {
                self.user = currentUser
            }
        }
    }
    
}
