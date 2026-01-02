






import SwiftUI

struct LoginView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Username")
                .primaryTextStyle()
            TextField("username", text: $viewModel.username)
                .textFieldStyle(AuthTextFieldStyle())
            Text("password")
                .primaryTextStyle()
            PasswordComponentView(showPassword: $viewModel.showPassword, password: $viewModel.password)
            Button {
                //MARK: - Login (Prototype)
                if let user = viewModel.authentication() {
                    sessionManager.currentUser = user
                    sessionManager.sessionState = .signedIn
                    sessionManager.justSignedIn = true
                }
            } label: {
                Text("Login")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, 20)
            .padding(.bottom, 15)
            HStack {
                Spacer()
                Text("Don't have an account?")
                    .secondaryTextStyle()
                Button {
                    viewModel.presentRegisterView = true
                } label: {
                    Text("Sign up")
                        .secondaryTextStyle()
                        .foregroundStyle(.highlight)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .fullScreenCover(isPresented: $viewModel.presentRegisterView, content: {
            RegisterView()
        })
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

#Preview {
    LoginView()
        .environment(SessionManager())
}
