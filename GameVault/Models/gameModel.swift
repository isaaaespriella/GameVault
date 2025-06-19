import Foundation

struct gameModel: Codable, Identifiable {
    let id: UUID?
    let title: String
    let publisher: String
    let description: String
    let image: String
}
