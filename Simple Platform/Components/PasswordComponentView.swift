






import SwiftUI

struct PasswordComponentView: View {
    
    @Binding var showPassword: Bool
    @Binding var password: String
    
    var body: some View {
        if showPassword {
            TextField("Password", text: $password)
                .textFieldStyle(AuthTextFieldStyle())
                .overlay(alignment: .trailing) {
                    Button {
                        showPassword = false
                    } label: {
                        Image(systemName: "eye")
                            .foregroundStyle(.black)
                            .padding(.bottom)
                    }
                }
        } else {
            VStack (spacing: 7) {
                SecureField("Password", text: $password)
                    .font(.system(size: 14))

                Divider()
                    .background(.black)
                    .padding(.bottom, 15)
            }
            .overlay(alignment: .trailing) {
                Button {
                    showPassword = true
                } label: {
                    Image(systemName: "eye.slash")
                        .foregroundStyle(.black)
                        .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    PasswordComponentView(showPassword: .constant(false), password: .constant(""))
}
