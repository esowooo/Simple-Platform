






import SwiftUI

struct FAQView: View {
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("FAQs")
                    .menuTitleStyle()
                    .padding(.top, 35)
                    .padding(.leading, 25)
                List {
                    Text(QuestionCategory.account.rawValue)
                        .primaryTextStyle()
                    ForEach(FAQs) { faq in
                        if faq.category == .account{
                            DisclosureGroup("\(faq.title)") {
                                Text(faq.content)
                                    .secondaryTextStyle()
                            }
                        }
                    }
                    Spacer()
                    
                    Text(QuestionCategory.vendor.rawValue)
                        .primaryTextStyle()
                    ForEach(FAQs) { faq in
                        if faq.category == .vendor{
                            DisclosureGroup("\(faq.title)") {
                                Text(faq.content)
                                    .secondaryTextStyle()
                            }
                        }
                    }
                    Spacer()
                    
                    Text(QuestionCategory.app.rawValue)
                        .primaryTextStyle()
                    ForEach(FAQs) { faq in
                        if faq.category == .app{
                            DisclosureGroup("\(faq.title)") {
                                Text(faq.content)
                                    .secondaryTextStyle()
                            }
                        }
                    }
                    Spacer()

                    Text(QuestionCategory.privacy.rawValue)
                        .primaryTextStyle()
                    ForEach(FAQs) { faq in
                        if faq.category == .privacy{
                            DisclosureGroup("\(faq.title)") {
                                Text(faq.content)
                                    .secondaryTextStyle()
                            }
                        }
                    }
                    Spacer()
                    
                    Text(QuestionCategory.other.rawValue)
                        .primaryTextStyle()
                    ForEach(FAQs) { faq in
                        if faq.category == .other{
                            DisclosureGroup("\(faq.title)") {
                                Text(faq.content)
                                    .secondaryTextStyle()
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
}

#Preview {
    FAQView()
}


//MARK: - Mock Data
struct FAQ: Identifiable {
    var id = UUID()
    var category: QuestionCategory
    var title: String
    var content: String
}

enum QuestionCategory: String, CaseIterable {
    case account = "Account Related"
    case vendor = "Vendor Related"
    case app = "App Related"
    case privacy = "Privacy Related"
    case other = "Others"
}

let FAQs: [FAQ] = [
    FAQ(category: .account, title: "How to delete account?", content: "In order to perminentaly delete your account. Please reach out to us via Inquiry tab on the Profile Menu."),
    FAQ(category: .account, title: "How can I change username?", content: "In order to change username, plase use the profile update function on Profile Menu."),
    FAQ(category: .account, title: "How can I change my password?", content: "In order to change username, plase use the profile update function on Profile Menu."),
    FAQ(category: .vendor, title: "Can I reach out to vendor?", content: "We are currently working on a feature that allows you to contact vendors directly. Please wait for more information."),
    FAQ(category: .vendor, title: "What are products available from vendor?", content: "In order to support product details, we are negotiating with the vendors. Please stay tuned."),
    FAQ(category: .vendor, title: "What are the purpose of studio, dress, hair&makeup?", content: "In pre-wedding, studio is the photographers, dress is the wedding dress rental service for the photoshoot, and hair & makeup is the stylist helping to prepare for the photoshoot."),
    FAQ(category: .app, title: "How can I set the notification?", content: "Currently there is no such feature. Please wait for the development."),
    FAQ(category: .app, title: "Is it possible to delete my information by deleting app?", content: "Please contact us directly via Inquiry tab on the Profile Menu.")
]
