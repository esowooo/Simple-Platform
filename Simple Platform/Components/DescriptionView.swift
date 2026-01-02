






import SwiftUI

struct DescriptionView: View {
    
    var title = "Description Title"
    var text = "Description details will go here"
    
    var body: some View {
        ScrollView {
            Spacer()
            Text(title)
                .menuTitleStyle()
                .padding(.vertical, 35)
            Text(text)
                .primaryTextStyle()
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    DescriptionView()
}
