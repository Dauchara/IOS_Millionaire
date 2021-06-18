
import Foundation

typealias Memento = Data

class RecordsCareTaker {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    static let recordsKey = "records"
    
    func save(_ records: [GameSession]) throws {
        let memento = try encoder.encode(records)
        UserDefaults.standard.setValue(memento, forKey: Self.recordsKey)
    }
    
    func load() throws -> [GameSession]? {
        guard let memento = UserDefaults.standard.value(forKey: Self.recordsKey) as? Memento else { return [] }
        return try decoder.decode([GameSession].self, from: memento)
    }
}
