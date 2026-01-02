






import SwiftUI

struct ProfileHeaderView: View {
    let username: String
    let country: String
    let createdAt: Date
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.background)
                .frame(height: 220)
            
            VStack {
                HStack (alignment: .center) {
                    Image(systemName: "person.fill")
                        .font(.system(size: 50))
                        .padding(5)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading) {
                        Text(username).primaryTextStyle()
                        Text(country).secondaryTextStyle()
                        Text(formatDate(createdAt)).secondaryTextStyle()
                    }
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.highlight)
                        .onTapGesture {
                            onTap()
                        }
                }
                Divider()
                    .padding(10)
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 80)
                    .foregroundStyle(.clear)
                
            }
            .padding(15)
            .frame(height: 100)
            .foregroundStyle(.main)
        }
    }
}

#Preview {
    ProfileHeaderView(username: "Mr. Doe", country: "---", createdAt: Date(), onTap: {
        print("Profile Edit Button Touched")
    } )
}
