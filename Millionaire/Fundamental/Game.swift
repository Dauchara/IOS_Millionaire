
import Foundation

class Game {
    static var `default`: Game = Game()
    
    private(set) var gameSession = GameSession(id: -1, date: Date(), winSum: 0, correctAnswers: 0, lastQuestionId: 0, hasCallHelp: true, hasHallHelp: true, hasFiftyHelp: true, answers: [])
    
    private(set) var records: [GameSession] = []
    
    private var recordsCareTaker: RecordsCareTaker
    
    private init() {
        self.recordsCareTaker = RecordsCareTaker()
    }
    
    func resotreResults() {
        self.records = (try? recordsCareTaker.load()) ?? []
    }
    
    func saveSession(_ gameSession: GameSession) {
        self.gameSession = gameSession
    }
    
    func saveResults() {
        records.append(gameSession)
        try? self.recordsCareTaker.save(self.records)
    }
    
    func removeSession() {
        self.gameSession = GameSession(id: -1, date: Date(), winSum: 0, correctAnswers: 0, lastQuestionId: 0, hasCallHelp: true, hasHallHelp: true, hasFiftyHelp: true, answers: [])
    }
}
