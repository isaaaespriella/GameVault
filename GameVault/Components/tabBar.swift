import SwiftUI

struct tabBar: View {
    let tabs = ["Todos", "Aventura", "Heroícos", "Battle Royal", "Infantil"]
    @State private var selectedTab = "Todos"

    var body: some View {
        ZStack {
            // Fondo ovalado con efecto de cristal
            Capsule()
                .fill(Color.white.opacity(0.15))
                .blur(radius: 0.3)
                .overlay(
                    Capsule()
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
                .frame(height: 36)
                .frame(width: 400)

            // Contenido de las pestañas
            HStack(spacing: 0) {
                ForEach(tabs, id: \.self) { tab in
                    Button(action: {
                        selectedTab = tab
                    }) {
                        Text(tab)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                Group {
                                    if selectedTab == tab {
                                        Capsule()
                                            .fill(Color.white.opacity(0.25))
                                            .shadow(color: .black.opacity(0.9), radius: 2, x: 0, y: 1)
                                    } else {
                                        Color.clear
                                    }
                                }
                            )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 6)
        }
        .padding(.top,8)
    }
}
