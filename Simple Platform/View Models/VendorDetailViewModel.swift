






import Foundation

@Observable
class VendorDetailViewModel {
    
    var favCount: Int = 0
    var fav: Favorite = Favorite(id: "", userId: "", vendorId: [], createdAt: Date())
    var isFav = false
    var willFav = false
    
    // Description Sheet
    var showDescriptionView = false
    var descriptionTitle = ""
    var descriptionText = ""
    
    
    //MARK: - Fetch Vendor's favorite count (Prototype)
    func fetchFavCount(vendor: Vendor){
        favCount = vendor.favoriteCount
    }
    
    //MARK: - Fetch Favorite Id (Prototype)
    func fetchFavorite(currentUser: User?)  {
        guard let user = currentUser else {
            //error handling

            return
        }
        
        guard let userFavorite = favorites.first(where: {$0.userId == user.id}) else {
            //error handling
     
            return
        }

        fav = userFavorite
    }
    
    
    //MARK: - Check if Vendor is favorite (Prototype)
    func checkIfFavorited(vendorId: String) {
        
        if fav.vendorId.contains(vendorId) {
            isFav = true
            willFav = true
            return
        }

        isFav = false
        willFav = false
        return
    }

    
    //MARK: - Update favorite count for vendor (Prototype)
    func updateVendorFavCount(targetVendorId: String) {
        if isFav == false && willFav == true {
            guard let index = vendors.firstIndex(where: { $0.id == targetVendorId }) else {
                // error handling
                return
            }
            vendors[index].favoriteCount += 1
            favCount += 1
            
            guard let index = favorites.firstIndex(where: {$0.id == fav.id } ) else {
                // error handling
                return
            }
            favorites[index].vendorId.append(targetVendorId)
            
        } else if isFav == true && willFav == false {
            guard let index = vendors.firstIndex(where: { $0.id == targetVendorId }), vendors[index].favoriteCount > 0 else {
                //error handling
                return
            }
            vendors[index].favoriteCount -= 1
            favCount -= 1
            
            guard let favIndex = favorites.firstIndex(where: {$0.id == fav.id } ) else {
                //error handling
                return
            }
            favorites[favIndex].vendorId.removeAll(where: { $0 == targetVendorId })
           
        } else {
            return
        }
        
    }
    
    
}
