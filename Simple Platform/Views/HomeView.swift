






import SwiftUI

struct HomeView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State private var selectedTab: Tab = .main
    @State private var viewModel = HomeViewModel()
    
    enum Tab { case main, favorite, profile }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                VStack {
                    HStack {
                        Text(title(for: selectedTab))
                            .font(.custom("Rockwell-Regular", size: 30))
                            .foregroundColor(.main)
                            .frame(height: 44)
                            .padding(.leading, 20)
                        Spacer()
                    }
                    currentView()
                }
                customTabBar()
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.alertMessage)
            }
            
            .overlay(
                VStack {
                    Spacer()
                    Group {
                        if sessionManager.justSignedIn {
                            Text("Sign in Successful")
                                .padding(.horizontal, 15)
                                .padding(.vertical, 6)
                                .background(Color.black.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .transition(.opacity)
                                .zIndex(1)
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation {
                                            sessionManager.justSignedIn = false
                                        }
                                    }
                                }

                        }
                    }
                    .padding(.bottom, 100)
                }
            )
            .animation(.easeInOut, value: sessionManager.justSignedIn)
        }
    }
    
    
    func title(for tab: Tab) -> String {
        switch tab {
        case .main: return "Simple Platform"
        case .favorite: return "Favorite"
        case .profile: return sessionManager.sessionState == .signedIn ? "My" : "Profile"
        }
    }
        
    
    @ViewBuilder
    func currentView() -> some View {
        switch selectedTab {
        case .main: MainView()
        case .favorite: FavoriteView()
        case .profile: ProfileView()
        }
    }
    
    func customTabBar() -> some View {
        VStack {
            Spacer()
            HStack {
                tabBarButton(tab: .main, image: "list.dash", title: "Main")
                tabBarButton(tab: .favorite, image: "bookmark.fill", title: "Favorite")
                tabBarButton(tab: .profile, image: "person.fill", title: sessionManager.sessionState == .signedIn ? "My" : "Profile")
                    
            }
            .padding(10)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
        }
        .padding(.horizontal, 15)
    }
    
    
    @ViewBuilder
    func tabBarButton(tab: Tab, image: String, title: String) -> some View {
        Button {
            if tab == .favorite && sessionManager.sessionState == .signedOut {
                viewModel.createAlert(
                    title: "Sign in required",
                    message: "Please sign in to view Favorite."
                )
            } else {
                withAnimation(.easeInOut) {
                    selectedTab = tab
                }
            }
        } label: {
            VStack(spacing: 4) {
                Image(systemName: image)
                    .primaryTextStyle()
                    .frame(maxWidth: .infinity, minHeight: 30)
                Text(title)
                    .secondaryTextStyle()
            }
            .padding(3)
            .foregroundColor(selectedTab == tab ? .highlight : .main)
            .contentShape(Rectangle())
            .background(
                Group {
                    if selectedTab == tab {
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(.ultraThinMaterial)
                            .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
                    }
                }
            )
        }
    }
}


#Preview {
    let session = SessionManager()
        session.sessionState = .signedOut
        session.currentUser = users[0]
    return HomeView()
        .environment(session)
}
