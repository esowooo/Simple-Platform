






import Foundation

@Observable
class MainViewModel {
    var bannerImages: [String] = ["main1", "main2", "main3", "main4", "main5", "main6"]
    var currentIndex = 0
    
    var showMainListView = false
    var filter: VendorCategory = .all
    
    var vendorList: [Vendor] = []
    
    
    func fetchTop10Vendors() {
        let top10List = vendors.sorted(by: { $0.favoriteCount > $1.favoriteCount }).prefix(10)
        vendorList = Array(top10List)
    }
    
    
    func moveToNextBanner() {
        guard !bannerImages.isEmpty else { return }
        currentIndex = (currentIndex + 1) % bannerImages.count
    }
    
}
