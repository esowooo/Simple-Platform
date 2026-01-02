






import Foundation

@Observable
class FavoriteViewModel {
    
    var vendorList: [Vendor] = []
    
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
        
    //MARK: - Fetch Favorite (Prototype)
    func fetchFavVendors(userId: String)  {
        guard let favorite = favorites.first(where: { $0.userId == userId }) else {
            //error handling
            return
        }
        
        let vendorIds = favorite.vendorId.compactMap { $0 }
        let matchedVendors = vendors.filter { vendorIds.contains($0.id) }
        
        vendorList = matchedVendors
    }
    

}

