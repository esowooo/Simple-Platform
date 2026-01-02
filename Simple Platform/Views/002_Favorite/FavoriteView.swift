






import SwiftUI

struct FavoriteView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State private var filter = VendorCategory.all
    @State private var viewModel = FavoriteViewModel()
    
    var body: some View {
        NavigationStack{
            Picker("Category", selection: $filter) {
                ForEach(VendorCategory.allCases) { category in
                    Text(category.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.top, 15)
            .padding(.bottom, 25)
            
            ScrollView {
                ListComponentView(vendors: viewModel.vendorList, filter: filter)
            }
            .refreshable {
                if let currentUser = sessionManager.currentUser, sessionManager.sessionState == .signedIn {
                    viewModel.fetchFavVendors(userId: currentUser.id)
                }
            }
        }
        .onAppear {
            if let currentUser = sessionManager.currentUser, sessionManager.sessionState == .signedIn {
                viewModel.fetchFavVendors(userId: currentUser.id)
            }
        }
        .padding(.horizontal, 15)
    }
}



#Preview {
    let session = SessionManager()
    session.sessionState = .signedIn
    session.currentUser = users[0]
    return FavoriteView()
        .environment(session)
}
