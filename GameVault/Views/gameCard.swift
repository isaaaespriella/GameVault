import SwiftUI

struct gameCard: View {
    let game: gameModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.ultraThinMaterial.opacity(0.1))
                .blur(radius: 0.3)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                )
            
            VStack(alignment: .leading, spacing: 6) {
                // Imagen
                AsyncImage(url: URL(string: game.image)) { phase in
                    switch phase {
                    case .success(let img):
                        img.resizable()
                    default:
                        Color.gray.opacity(0.25)   // placeholder
                    }
                }
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Divider().foregroundColor(.white.opacity(0.6))
                
                // Título y publisher
                Text(game.title)
                    .font(.system(size: 10, weight: .bold))
                    .lineLimit(1)
                
                Text(game.publisher)
                    .font(.system(size: 7))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                // Descripción (máx. 3 líneas)
                Text(game.description)
                    .font(.system(size: 6))
                    .lineLimit(3)
                
                // Botón play alineado a la derecha
                HStack {
                    Spacer()
                    playButton()
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 6)
        }
        .frame(width: 195, height: 270)
    }
}
