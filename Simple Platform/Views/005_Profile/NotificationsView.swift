






import SwiftUI

struct NotificationsView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                Text("Notifications")
                    .menuTitleStyle()
                    .padding(.top, 35)
                List {
                    ForEach(notifications) { notification in
                        DisclosureGroup("\(notification.type.rawValue)  \(notification.title)") {
                            Text(notification.content)
                                .primaryTextStyle()
                        }
                    }
                    .secondaryTextStyle()
                }
                .scrollContentBackground(.hidden)
                
            }
        }
    }
}

#Preview {
    NotificationsView()
}


//MARK: - Mock Data

struct Notification: Identifiable {
    
    let id = UUID()
    let type: NotificationCategory
    let title: String
    let date: Date
    let content: String
    
}

enum NotificationCategory: String, Identifiable {
    var id: Self { self }
    case info = "[Information]"
    case warning = "[Warning]"
    case error = "[Error]"
    case maintenance = "[Maintenance]"
}

let notifications: [Notification] = [
    Notification(type: .info, title: "Regarding iOS Update.", date: Date(), content: "TEST Content. TEST Content TEST Content. TEST Content TEST Content TEST Content TEST Content... TEST Content.TEST Content.TEST Content.TEST Content."),
    Notification(type: .warning, title: "Please don't accept any suspicuous calls.", date: Date(), content: "TEST Content. TEST Content TEST Content. TEST Content TEST Content TEST Content TEST Content... TEST Content.TEST Content.TEST Content.TEST Content."),
    Notification(type: .maintenance, title: "Maintenance planned for 2025.01.01.", date: Date(), content: "TEST Content. TEST Content TEST Content. TEST Content TEST Content TEST Content TEST Content... TEST Content.TEST Content.TEST Content.TEST Content."),
    Notification(type: .maintenance, title: "aintenance planned for 2025.03.01.", date: Date(), content: "TEST Content. TEST Content TEST Content. TEST Content TEST Content TEST Content TEST Content... TEST Content.TEST Content.TEST Content.TEST Content."),
    Notification(type: .info, title: "Regarding iOS Update.", date: Date(), content: "TEST Content. TEST Content TEST Content. TEST Content TEST Content TEST Content TEST Content... TEST Content.TEST Content.TEST Content.TEST Content.")
]
