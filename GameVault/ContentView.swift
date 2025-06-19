import SwiftUI

struct ContentView: View {
    @State var games: [gameModel] = []
    var screen = NSScreen.main!.visibleFrame
    var filteredGames: [gameModel] {
        guard !searchText.isEmpty else { return games }
        let q = searchText.lowercased()
        return games.filter {
            $0.title.lowercased().contains(q) ||
            $0.publisher.lowercased().contains(q)
        }
    }
    
    let tabs = ["Todos", "Aventura", "Heróico", "Battle Royal", "Infantil"]
    @State private var selectedTab = "Aventura"
    @State private var searchText = ""
    
    var body: some View {

        VStack {
            navBar(searchText: $searchText)
            Spacer()
            VStack {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 25) {
                        ForEach(filteredGames) { game in
                            gameCard(game: game)
                        }
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        Spacer()
        }
        .task {
            await loadGames()
        }
        .frame(maxWidth: screen.width, maxHeight: screen.height)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color.purple, Color.blue, Color.pink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea())
    }
    
    func loadGames() async {
        guard let url = URL(string: "https://sea-lion-app-g9xug.ondigitalocean.app/games") else {
            return }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let gamesDecoder = try  JSONDecoder().decode([gameModel].self, from: data)
            games = gamesDecoder
            print("se cargaron \(gamesDecoder.count) juegos")}
        catch {
            print("Error al cargar los juegos: \(error)")
        }
            
        }
    }

#Preview {
    ContentView()
}
