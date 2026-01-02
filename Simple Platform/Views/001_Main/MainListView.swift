






import SwiftUI

struct MainListView: View {
    
    var filter: VendorCategory
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State var showDetailView = false
    @State private var viewModel = MainListViewModel()
    
    
    func getLikes(_ vendor: Vendor) -> some View {
        HStack(spacing: 3) {
            Spacer()
            Image(systemName: "bookmark.fill")
                .secondaryTextStyle()
            Text(String(vendor.favoriteCount))
                .secondaryTextStyle()
        }
    }
    
    func orderButton() -> some View {
        HStack {
            Spacer()
            Menu {
                Button("Name (A–Z)") {
                    viewModel.order = .byNameAsc
                }
                Button("Name (Z–A)") {
                    viewModel.order = .byNameDsc
                }
                Button("Most Favorite") {
                    viewModel.order = .byFavCount
                }
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 10))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .foregroundStyle(.main.opacity(0.3))
                    .background(.clear)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.main.opacity(0.3), lineWidth: 1)
                    )
                    .padding(2)
            }
        }
        .padding(.bottom, 15)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text(filter.rawValue)
                    .menuTitleStyle()
                
                orderButton()
                
                ListComponentView(vendors: viewModel.orderedVendors, filter: filter)
            }
            .onAppear {
                viewModel.fetchVendors(filter)
            }
            .refreshable {
                viewModel.fetchVendors(filter)
            }
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer, prompt: "Search")
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    MainListView(filter: .all)
        .environment(SessionManager())
}
