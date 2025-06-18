import SwiftUI

struct buscador: View {
    @Binding var text: String          // <- binding, no @State local

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white.opacity(0.8))

            TextField("Buscar titulo", text: $text)
                .textFieldStyle(.plain)
                .foregroundColor(.white)
                .frame(width: 120)
        }
        .padding(6)
        .background(
            Capsule()
                .fill(.ultraThinMaterial)
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
    }
}
