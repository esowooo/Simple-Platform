






import SwiftUI

struct VendorDetailView: View {
    
    var vendor: Vendor
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State private var viewModel = VendorDetailViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 35) {
                
                // Title and Adress
                HStack {
                    VStack(alignment:.leading) {
                        Text(vendor.name)
                            .font(.title2)
                            .bold()
                        Text(vendor.locationDetail)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                            .primaryTextStyle()
                            .tint(.main)
                    }
                    .frame(width: 40, height: 40)
                    Button(action: {
                        viewModel.willFav.toggle()
                    }) {
                        Image(systemName: viewModel.willFav ? "bookmark.fill" : "bookmark")
                            .primaryTextStyle()
                            .tint(.main)
                    }
                    .frame(width: 40, height: 40)
                }
                
                // Image Slider - need to adjust size
                TabView {
                    ForEach(vendor.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: UIScreen.main.bounds.height / 3)
                            .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: UIScreen.main.bounds.height / 3)
                
                
                // Fav Count
                HStack {
                    Label("\(viewModel.favCount)", systemImage: "bookmark.fill")
                        .font(.title)
                    Spacer()
                }
                
                
                // Keywords
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(1...10, id: \.self) { i in
                            Text("Keyword")
                                .font(.caption)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                
                // Description with "More" NavigationLink
                VStack(alignment: .leading, spacing: 4) {
                    Text(vendor.description.prefix(200) + "...")
                        .font(.body)
                    Button("See More") {
                        viewModel.showDescriptionView = true
                        viewModel.descriptionTitle = "Introduction of \(vendor.name)"
                        viewModel.descriptionText = vendor.description
                    }
                    .font(.caption)
                    .foregroundColor(.highlight)

                }
                
                // Map -> Possibly move to Google Map API
                MapView(address: "\(vendor.locationDetail), \(vendor.locationCity), \(vendor.locationCountry)")
                .frame(height: UIScreen.main.bounds.height / 2)

                
                // Policy / Info Section
                VStack(alignment: .leading, spacing: 8) {
                    Button {
                        viewModel.showDescriptionView = true
                        viewModel.descriptionTitle = "Vendor Policies"
                        viewModel.descriptionText = "Return Policy: ..."
                    } label: {
                        Text("Policy")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                    Button {
                        viewModel.showDescriptionView = true
                        viewModel.descriptionTitle = "Other Notifications"
                        viewModel.descriptionText = "Please note that we try our best in providing services. However, due to ..."
                    } label: {
                        Text("Other Notifications")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
                
            }
            .padding(.horizontal, 15)
        }
        .onAppear {
            viewModel.fetchFavCount(vendor: vendor)
            viewModel.fetchFavorite(currentUser: sessionManager.currentUser)
            viewModel.checkIfFavorited(vendorId: vendor.id)
        }
        .refreshable {
            viewModel.fetchFavCount(vendor: vendor)
            viewModel.fetchFavorite(currentUser: sessionManager.currentUser)
            viewModel.checkIfFavorited(vendorId: vendor.id)
        }
        .onDisappear {
            viewModel.updateVendorFavCount(targetVendorId: vendor.id)
        }
        .sheet(isPresented: $viewModel.showDescriptionView) {
            DescriptionView(title: viewModel.descriptionTitle,text: viewModel.descriptionText)
        }
    }
}


#Preview {
    let session = SessionManager()
    session.currentUser = users[0]
    return VendorDetailView(vendor: vendors[0])
        .environment(session)
}
