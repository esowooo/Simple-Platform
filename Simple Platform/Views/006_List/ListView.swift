






import SwiftUI

struct ListComponentView: View {
        
    var vendors: [Vendor]
    var filter: VendorCategory = .all
    
    func getLikes(_ vendor: Vendor) -> some View {
        HStack(spacing: 3) {
            Spacer()
            Text(String(vendor.favoriteCount))
                .secondaryTextStyle()
            Image(systemName: "bookmark.fill")
                .secondaryTextStyle()
        }
    }
    
    
    var body: some View {

        ForEach(vendors) { vendor in
            NavigationLink {
                VendorDetailView(vendor: vendor)
            } label: {
                if filter == .all || vendor.category == filter.rawValue {
                    
                    VStack {
                        HStack (alignment: .top) {
                            Image(vendor.images[0])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipped()
                                .cornerRadius(8)
                                .padding(.trailing, 10)
                            VStack (alignment: .leading) {
                                Text(vendor.name)
                                    .primaryTextStyle()
                                Text("\(vendor.locationCountry), \(vendor.locationCity), \(vendor.locationDetail)")
                                    .captionTextStyle()
                                Spacer()
                                
                                getLikes(vendor)
                            }
                        }
                        Divider()
                    }
                }
            }
        }
        .foregroundStyle(.main)
        
    }
}

#Preview {
    ListComponentView(vendors: vendors)
}



