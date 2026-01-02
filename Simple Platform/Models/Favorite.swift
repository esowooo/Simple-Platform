






import Foundation

struct Favorite {
    
    let id: String
    let userId: String
    var vendorId: [String?]
    let createdAt: Date
    
}





//MARK: - Mock Data
var favorites: [Favorite] = [
    Favorite(id: "f1", userId: "user1", vendorId: ["studioA", "studioB", "hmB", "dressA"], createdAt: Date()),
    Favorite(id: "f2", userId: "vendor1", vendorId: ["studioC", "dressA"], createdAt: Date()),
    Favorite(id: "f3", userId: "admin1", vendorId: ["dressB", "hmA"], createdAt: Date()),
]

