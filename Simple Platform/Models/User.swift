






import Foundation

struct User: Codable {
    
    let id: String
    var username: String
    var password: String
    var email: String
    var localeCountry: String
    var localeCity: String
    var role: String
    var createdAt: Date
    var updatedAt: Date
    
}


enum Role: String, Codable {
    case user = "User"
    case admin = "Admin"
    case vendor = "Vendor"
}




//MARK: - Mock Data
var users: [User] = [
    User(id: "user1", username: "test1", password: "test123", email: "test1@test.com", localeCountry: "Not Selected", localeCity: "Not Selected", role: "User", createdAt: Date(), updatedAt: Date()),
    User(id: "admin1", username: "test2", password: "test123", email: "test2@test.com", localeCountry: "Not Selected", localeCity: "Not Selected", role: "Admin", createdAt: Date(), updatedAt: Date()),
    User(id: "vendor1", username: "test3", password: "test123", email: "test3@test.com", localeCountry: "Not Selected", localeCity: "Not Selected", role: "Vendor", createdAt: Date(), updatedAt: Date())
]

