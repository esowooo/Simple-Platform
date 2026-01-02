






import SwiftUI
import Combine

struct SplashScreenView: View {
    
    let images : [String] = ["main1", "main2", "main3", "main4", "main5", "main6"]
    let vendorName : [String] = ["@BrandA", "@BrandB", "@BrandC", "@BrandD", "@BrandE", "@BrandF"]
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State private var currentIndex: Int = Int.random(in: 0..<6)
    @State private var imageScale: CGFloat = 1.0
    @State private var anchor: UnitPoint = .center

    private let anchorCandidates: [UnitPoint] = [
        .center,
        .top,
        .bottom,
        .topLeading,
        .topTrailing,
        .bottomLeading,
        .bottomTrailing
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(images[currentIndex])
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(imageScale, anchor: anchor)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .onAppear {
                        anchor = anchorCandidates.randomElement() ?? .center
                        
                        withAnimation(
                            .easeInOut(duration: 6)
                                .repeatForever(autoreverses: true)
                        ) {
                            imageScale = 1.05
                        }
                    }
                
                VStack {
                    HStack {
                        Text("Simple Platform")
                            .primaryTitleStyle()
                            .foregroundStyle(.white)
                            .padding(.top, 60)
                            .padding(.leading, 24)
                        Spacer()
                        Text(formatDate(Date()))
                            .secondaryTitleStyle()
                            .foregroundStyle(.white)
                            .padding(.trailing, 24)
                    }
                    Spacer()
                    Text(vendorName[currentIndex])
                        .foregroundStyle(.white)
                        .captionTextStyle()
                        .padding(.bottom, 10)
                }
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
    SplashScreenView()
        .environment(SessionManager())
    
}
