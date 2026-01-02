






import SwiftUI

@main
struct Simple_PlatformApp: App {
    
    @State var sessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(sessionManager)
        }
    }
}
