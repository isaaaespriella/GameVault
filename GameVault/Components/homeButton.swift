import SwiftUI

struct homeButton: View {
    var profilePic: String
    var body: some View {
        Button {
            print("Presionando botón")
        } label: {
            AsyncImage(url: URL(string: "https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrewperformance1-697509.jpg&fm=jpg")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                        .padding(1)
                        .overlay {
                            Circle()
                                .stroke(Color.white.opacity(0.5), lineWidth: 1)
                        }
                } else if phase.error != nil {
                    // Error al cargar la imagen
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.red)
                } else {
                    // Cargando...
                    ProgressView()
                        .frame(width: 150, height: 150)
                }
            }
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}


