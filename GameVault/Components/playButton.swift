import SwiftUI

struct playButton: View {
    var body: some View {
        Button(action: {
            print("Empieza a Jugar el juego")
        }) {
            HStack(spacing: 6) {
                Image(systemName: "play.circle")
                    .resizable()
                    .frame(width: 10, height: 10)
                Text("Play Now")
                    .font(.system(size: 9, weight: .medium))
            }
            .foregroundColor(.black)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                Capsule().fill(Color.green)

            )
            .overlay(
                Capsule().stroke(Color.white.opacity(0.4), lineWidth: 0.5)
            )
        }
        .buttonStyle(.plain)
    }
}

