






import Foundation

@Observable
class MainListViewModel {
    
    var vendorList: [Vendor] = []
    var searchText: String = ""
    var order: Order = .byNameAsc
    
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
    

    //MARK: - Step2: Filter Searched Vendors, if searched by user
    var searchedVendors: [Vendor] {
        if searchText.isEmpty {
            return vendorList
        } else {
            return vendorList.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    //MARK: - Step3: Order Filtered Vendors
    var orderedVendors: [Vendor] {
        switch order {
        case .byNameAsc:
            return searchedVendors.sorted { $0.name < $1.name }
        case .byNameDsc:
            return searchedVendors.sorted { $0.name > $1.name }
        case .byFavCount:
            return searchedVendors.sorted { $0.favoriteCount > $1.favoriteCount }
        }
    }
    
    //MARK: - Step1: Fetch Vendors (Prototype)
    func fetchVendors(_ category: VendorCategory) {
        if category == .all {
            vendorList = vendors
        } else {
            let filteredVendors = vendors.filter { $0.category == category.rawValue }
            if filteredVendors.isEmpty {
                return
            }
            vendorList = filteredVendors
        }
    }
    
}


enum Order: String, CaseIterable, Identifiable {
    var id: Self { return self }
    case byNameAsc = "Name Ascending"
    case byNameDsc = "Name Descending"
    case byFavCount = "Favorite Count"
    
}
