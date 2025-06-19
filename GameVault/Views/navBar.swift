import SwiftUI

struct navBar: View {
    @Binding var searchText: String
    var screen = NSScreen.main!.visibleFrame
    var body: some View {
        // Barra de navegación
        HStack(spacing: 16) {
            Text("[+  _GameVault_  +]")
                .font(.title.bold())
                .foregroundColor(.white)

            Spacer()

            tabBar()

            Spacer()

            buscador(text: $searchText).padding(.top,3)
            homeButton(profilePic: "house.fill").padding(.top,2)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue, Color.pink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
        .frame(height: screen.height / 12)
    }
}

