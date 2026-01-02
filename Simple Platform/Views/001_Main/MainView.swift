






import SwiftUI
import Combine

struct MainView: View {
    
    @Environment(SessionManager.self) var sessionManager: SessionManager
    @State private var viewModel = MainViewModel()
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    TabView(selection: $viewModel.currentIndex) {
                        ForEach(
                            Array(viewModel.bannerImages.prefix(10).enumerated()),
                            id: \.offset
                        ) { index, imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width)
                                .clipped()
                                .cornerRadius(10)
                                .tag(index)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .automatic))
                    .frame(height: UIScreen.main.bounds.height * 0.3)
                    .onReceive(timer) { _ in
                        withAnimation(.easeInOut(duration: 0.6)) {
                            viewModel.moveToNextBanner()
                        }
                    }
                    Spacer()
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 4), spacing: 16) {
                        ForEach(VendorCategory.allCases) { category in
                            Button(action: {
                                viewModel.filter = category
                                viewModel.showMainListView = true
                            }) {
                                VStack {
                                    Image(systemName: category.iconName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 30, height: 30)
                                        .padding()
                                        .background(Color.background)
                                        .cornerRadius(12)
                                    Text(category.rawValue)
                                        .secondaryTextStyle()
                                }
                                .tint(.main)
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .navigationDestination(isPresented: $viewModel.showMainListView) {
                        MainListView(filter: viewModel.filter)
                    }
                                        
                    Text("Popular Stores")
                        .menuTitleStyle()
                        .padding(.vertical, 25)
                    VStack {
                        ListComponentView(vendors: viewModel.vendorList)
                    }
                    .padding(.horizontal, 15)
                    .padding(.bottom, 100)
                }
            }
        }
        .onAppear {
            viewModel.fetchTop10Vendors()
        }
    }
}


#Preview {
    MainView()
        .environment(SessionManager())
}
