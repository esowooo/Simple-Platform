






import Foundation

@Observable
class RegisterViewModel {
    
    var email: String = ""
    var username: String = ""
    var password: String = ""
    var localeCountry: String {
        return selectedCountry.rawValue
    }
    var localeCity: String {
        return selectedCity.rawValue
    }
    var role : String = Role.user.rawValue
    var createdAt: Date = Date()
    var updatedAt: Date = Date()
    
    // For UI
    var selectedCountry: Country = .none
    var selectedCity: City = .none
    var showPassword: Bool = false
    
    //error handling
    var alertTitle: String = ""
    var alertMessage: String = ""
    var showAlert: Bool = false
    
    //MARK: - Error Handling (Prototype)
    func createAlert(title: String, message: String, error: Error? = nil){
        if let error = error {
            print(error.localizedDescription)
        }
        alertTitle = title
        alertMessage = message
        showAlert = true
    }
    
    //MARK: - Register (Prototype)
    func register() -> User? {
        if validate() {
            let user = User(id: UUID().uuidString, username: self.username, password: self.password, email: self.email, localeCountry: self.localeCountry, localeCity: self.localeCity, role: self.role, createdAt: self.createdAt, updatedAt: self.updatedAt)
            users.append(user)
            return user
        }
        return nil
    }
    
    //MARK: - Validation (Prototype)
    func validate() -> Bool {
        if email.isEmpty || username.isEmpty || password.isEmpty {
            createAlert(title: "Invalid.", message: "Please fill in all manadatory fields.")
            return false
        }
        if email.count < 5 {
            createAlert(title: "Invalid Email", message: "Email must be 5 characters or more.")
            return false
        }
        if password.count < 6 {
            createAlert(title: "Invalid Password", message: "Password must be 6 characters or more.")
            return false
        }
        if username.count < 3 {
            createAlert(
                title: "Invalid Username",
                message: "Username must be at least 4 characters long."
            )
            return false
        }
        
        if username.count > 30 {
            createAlert(
                title: "Invalid Username",
                message: "Username must be less than 30 characters."
            )
            return false
        }
        
        let usernameRegex = "^[a-zA-Z0-9._-]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        if !predicate.evaluate(with: username) {
            createAlert(
                title: "Invalid Username",
                message: "Username can only contain letters, numbers, dots (.), underscores (_), and hyphens (-)."
            )
            return false
        }
        
        return true
    }

}
