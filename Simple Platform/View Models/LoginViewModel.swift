






import Foundation

@Observable
class LoginViewModel {
    
    var username: String = "test2"
    var password: String = "test123"
    var showPassword: Bool = false
    
    var presentRegisterView: Bool = false
    
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
    
    //MARK: - Validation (Prototype)
    func validate() -> Bool {
        if username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
           password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            createAlert(
                title: "Invalid Input",
                message: "Username and password must not be empty."
            )
            return false
        }
        if username.count < 4 {
            createAlert(
                title: "Invalid Username",
                message: "Username must be at least 3 characters long."
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
        if password.count < 6 {
            createAlert(
                title: "Invalid Password",
                message: "Password must be at least 6 characters long."
            )
            return false
        }
        
        return true
    }
    
    
    
    //MARK: - Login (Prototype)
    func authentication() -> User? {
        
        guard validate() else {
            return nil
        }
        
        // 1) Find the user by username
        guard let matchedUser = users.first(where: { $0.username == username }) else {
            createAlert(title: "Invalid Username", message: "Please check username again.")
            return nil
        }

        // 2) Verify password
        guard matchedUser.password == password else {
            createAlert(title: "Invalid Password", message: "Please check password again.")
            return nil
        }

        // 3) Success
        return matchedUser
            

    }
}
