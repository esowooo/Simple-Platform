






import Foundation

@Observable
class EditProfileViewModel {
    
    var currentUser: User? = nil
    
    var showPassword = false
    
    // User Instance
    var id: String = ""
    var username: String = ""
    var password: String = ""
    var localeCountry: String = ""
    var localeCity: String = ""
    var role: String = ""
    var updatedAt: Date = Date()
    var email: String = ""
    var createdAt: Date = Date()
    
    // For UI
    var selectedCountry: Country = .none
    var selectedCity: City = .none
    var selectedRole: Role = .user

    // Save update
    func applyChanges() -> User? {
        localeCountry = selectedCountry.rawValue
        localeCity = selectedCity.rawValue
        
        if let index = users.firstIndex(where: { $0.id == self.id }) {
            
            let User = User(id: self.id, username: self.username, password: self.password, email: self.email, localeCountry: self.localeCountry, localeCity: self.localeCity, role: self.role, createdAt: self.createdAt, updatedAt: Date())
            
            users[index].email = self.email
            users[index].username = self.username
            users[index].password = self.password
            users[index].localeCountry = self.localeCountry
            users[index].localeCity = self.localeCity
            users[index].updatedAt = Date()
            return User
        }
        return nil
    }
    
    // UI setup
    func setupUser() {
        if let user = currentUser {
            self.id = user.id
            self.username = user.username
            self.password = user.password
            self.localeCountry = user.localeCountry
            self.localeCity = user.localeCity
            self.role = user.role
            self.updatedAt = user.updatedAt
            self.email = user.email
            self.createdAt = user.createdAt
            
            self.selectedCountry = Country(rawValue: user.localeCountry) ?? .none
            self.selectedCity = City(rawValue: user.localeCity) ?? .none
        }
    }
}
