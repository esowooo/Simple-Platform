






import SwiftUI
import MessageUI

struct ProfileView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    private var sessionStatus: Bool {
        if sessionManager.sessionState == .signedIn && sessionManager.currentUser != nil {
            return true
        } else {
            return false
        }
    }
    @State private var viewModel = ProfileViewModel()
    
    
    //MARK: - General Menu
    func generalMenu() -> some View {
        LazyVStack(spacing: 10) {
            HStack {
                Text("General")
                    .secondaryTextStyle()
                Spacer()
            }
            
            //Setting - Sheet
            Button {
                viewModel.showSetting = true
            } label: {
                Text("Setting")
                    .primaryTextStyle()
            }
            .buttonStyle(PrimaryButtonStyle())
            
            Button {
                viewModel.showGuide = true
            } label: {
                Text("Guide")
                    .primaryTextStyle()
            }
            .buttonStyle(HighlightButtonStyle())
            
        }
        .navigationDestination(isPresented: $viewModel.showGuide, destination: {
            GuideView()
        })
        .navigationDestination(isPresented: $viewModel.showSetting) {
            SettingView()
        }
    }
    
    //MARK: - Help Center
    func helpCenter() -> some View {
        LazyVStack(spacing: 10) {
            HStack {
                Text("Help")
                    .secondaryTextStyle()
                Spacer()
            }
            //Notifications - Sheet
            Button {
                viewModel.showNotifications = true
            } label: {
                Text("Notifications")
                    .primaryTextStyle()
            }
            .buttonStyle(PrimaryButtonStyle())
            
            //FAQ - Navigation Link
            Button {
                viewModel.showFAQ = true
            } label: {
                Text("FAQ")
                    .primaryTextStyle()
            }
            .buttonStyle(PrimaryButtonStyle())
            
            //Inquiry - Default Mail App
            Button {
                if MFMailComposeViewController.canSendMail() {
                    viewModel.showInquiry = true
                } else {
                    viewModel.createMessage(title: "Unable to access Mail app", message: "Please sign in into your Mail app and try again.")
                }
            } label: {
                Text("Inquiry")
                    .primaryTextStyle()
            }
            .buttonStyle(PrimaryButtonStyle())
        }
        .sheet(isPresented: $viewModel.showNotifications) {
            NotificationsView()
        }
        .navigationDestination(isPresented: $viewModel.showFAQ, destination: {
            FAQView()
        })
        .navigationDestination(isPresented: $viewModel.showInquiry, destination: {
            MailView(subject: "Inquiry",
                     messageBody: "Please provide us as much detail as possible so we can assist you.",
                     recipients: ["contact@yourapp.com"])
        })
        
        
    }
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    
                    // Profile Card
                    ProfileHeaderView(
                        username: sessionStatus ? viewModel.user.username : "Mr. Doe",
                        country: sessionStatus ? viewModel.user.localeCountry : "---",
                        createdAt: sessionStatus ? viewModel.user.createdAt : Date()
                    ) {
                        if sessionStatus {
                            viewModel.showEditProfile = true
                        } else {
                            viewModel.createMessage(
                                title: "Not Signed In",
                                message: "Please sign in to access this feature."
                            )
                        }
                    }
                    .navigationDestination(isPresented: $viewModel.showEditProfile) {
                        EditProfileView()
                    }
                    
                    // General Menu
                    generalMenu()
  
                    // Help Center
                    helpCenter()
                    
                    // Sign Out Button
                    LazyVStack(spacing: 10) {
                        Spacer()
                        Divider()
                        Button {
                            viewModel.createAlert(title: "Sign Out", message: "Are you sure you would like to sign out?")
                            viewModel.showAlert = true
                        } label: {
                            Text("Sign Out")
                        }
                        .buttonStyle(PrimaryButtonStyle())
                        
                    }
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 100)
            }
            
        }
        .onAppear(){
            viewModel.fetchCurrentUser(session: sessionManager)
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showMessage) {
            Button("Ok") {
            }
        } message: {
            Text(viewModel.alertMessage)
        }
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("Sign Out", role: .destructive) {
                sessionManager.sessionState = .signedOut
            }
            Button("Cancel", role: .cancel) {
            }
        } message : {
            Text(viewModel.alertMessage)
        }
        
    }
}


#Preview {
    let session = SessionManager()
    session.sessionState = .signedIn
    session.currentUser = users[1]
    return ProfileView()
        .environment(session)
}



