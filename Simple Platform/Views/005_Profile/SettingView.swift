






import SwiftUI

struct SettingView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text("Settings")
                        .menuTitleStyle()
                    List {
                        Section {
                            HStack {
                                Text("App Version")
                                Spacer()
                                Text(appVersion)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                        Section {
                            NavigationLink {
                                TermsView()
                            } label: {
                                Text("Terms of Service")
                            }
                            
                            NavigationLink {
                                PrivacyPolicyView()
                            } label: {
                                Text("Privacy Policy")
                            }
                        }
                        
                        
                        Section {
                            NavigationLink {
                                LanguageSettingView()
                            } label: {
                                Text("Language")
                            }
                        }
                    }
                }
                .primaryTextStyle()
            }
        }
        .scrollContentBackground(.hidden)
    }
    
    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-"
        return "\(version)"
    }
}

struct TermsView: View {
    var body: some View {
        ScrollView {
            Text("Terms of Service")
                .secondaryTextStyle()
                .padding()
        }
        .navigationTitle("Terms of Service")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView {
            Text("Privacy Policy")
                .secondaryTextStyle()
                .padding()
        }
        .navigationTitle("Privacy Policy")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LanguageSettingView: View {
    var body: some View {
        List {
            Text("System Default")
            Text("한국어")
            Text("English")
            Text("日本語")
        }
        .font(.system(size: 16, weight: .regular))
        .navigationTitle("Language")
    }
}


#Preview {
    SettingView()
}
