






import SwiftUI

struct RegisterView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = RegisterViewModel()

    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: - Mandatory
            Text("Username *")
                .primaryTextStyle()
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(AuthTextFieldStyle())
            Text("Email *")
                .primaryTextStyle()
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(AuthTextFieldStyle())
            Text("Password *")
                .primaryTextStyle()
            PasswordComponentView(showPassword: $viewModel.showPassword, password: $viewModel.password)
            
            //MARK: - Not Mandatory
            //locale country picker
            Text("Country")
                .primaryTextStyle()
            
            Picker("", selection: $viewModel.selectedCountry) {
                ForEach(Country.allCases) {i in
                    Text(i.rawValue)
                        .font(.system(size: 14))
                }
            }
            .tint(.main)
            .labelsHidden()
            .frame(height: 17)
        Divider()
            .background(.main)
            .padding(.bottom, 15)
            
            
            //locale city picker
            Text("City")
                .primaryTextStyle()
            Picker("", selection: $viewModel.selectedCity) {
                ForEach(City.allCases) {i in
                    Text(i.rawValue)
                        .font(.system(size: 14))
                }
            }
            .tint(.main)
            .labelsHidden()
            .frame(height: 17)
        Divider()
            .background(.main)
            .padding(.bottom, 15)
            

            
            Button {
                //MARK: - Validation -> Register (Prototype)
                if let user = viewModel.register() {
                    print("login successful")
                    sessionManager.currentUser = user
                    sessionManager.sessionState = .signedIn
                    sessionManager.justSignedIn = true
                }
            } label: {
                Text("Submit")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.top, 20)
            .padding(.bottom, 15)
            HStack {
                Spacer()
                Text("Already have an account?")
                    .secondaryTextStyle()
                Button {
                    dismiss()
                } label: {
                    Text("Login")
                        .secondaryTextStyle()
                        .foregroundStyle(.highlight)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            
        } message: {
            Text(viewModel.alertMessage)
        }
    }
}

#Preview {
    RegisterView()
        .environment(SessionManager())
}
