






import SwiftUI

struct EditProfileView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = EditProfileViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            Button {
                isFocused = false

            } label: {
                Rectangle()
                    .fill(.clear)
            }
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Text("Username")
                        .primaryTextStyle()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(.main)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    TextField("Username", text: $viewModel.username)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .textContentType(.none)
                        .padding(.leading, 10)
                        .focused($isFocused)
                }
                .padding(.bottom, 5)
                Divider()
                    .padding(.bottom, 10)
                HStack {
                    Text("Email")
                        .primaryTextStyle()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(.main)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    TextField("Email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .textContentType(.none)
                        .padding(.leading, 10)
                        .focused($isFocused)
                }
                .padding(.bottom, 5)
                Divider()
                    .padding(.bottom, 10)
                HStack {
                    Text("Password")
                        .primaryTextStyle()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(.main)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                    TextField("Password", text: $viewModel.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .textContentType(.none)
                        .padding(.leading, 10)
                        .focused($isFocused)
                }
                .padding(.bottom, 5)
                Divider()
                    .padding(.bottom, 10)
                HStack {
                    Text("Country")
                        .primaryTextStyle()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(.main)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Picker("", selection: $viewModel.selectedCountry) {
                        ForEach(Country.allCases) {i in
                            Text(i.rawValue)
                        }
                    }
                    .tint(.main)
                    .labelsHidden()
                    .fixedSize()
                    .onTapGesture {
                        isFocused = false
                    }
                }
                .padding(.bottom, 5)
                Divider()
                    .padding(.bottom, 10)
                HStack {
                    Text("City")
                        .primaryTextStyle()
                        .foregroundStyle(.white)
                        .frame(width: 100, height: 30)
                        .background(.main)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    Picker("", selection: $viewModel.selectedCity) {
                        ForEach(City.allCases) {i in
                            Text(i.rawValue)
                        }
                    }
                    .tint(.main)
                    .labelsHidden()
                    .fixedSize()
                    .onTapGesture {
                        isFocused = false
                    }
                }
                .padding(.bottom, 5)
                Divider()
                    .padding(.bottom, 10)
            }
            .padding(.horizontal, 15)
            Button {
                isFocused = false
            } label: {
                Rectangle()
                    .fill(.clear)
            }
            Button {
                if let user = viewModel.applyChanges() {
                    sessionManager.currentUser = user
                    dismiss()
                }
            } label: {
                Text("Save")
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.horizontal, 15)
            
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onAppear() {
            viewModel.currentUser = sessionManager.currentUser
            viewModel.setupUser()
        }
        .onTapGesture {
            isFocused = false
        }
    }
}


#Preview {
    let session = SessionManager()
    session.currentUser = users[0]
    return EditProfileView()
        .environment(session)
}
