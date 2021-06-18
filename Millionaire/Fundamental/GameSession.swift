
import Foundation

struct GameSession: Codable {
    var id: Int = -1
    var date: Date? = nil
    var winSum: Float = 0
    var correctAnswers: Int = 0
    var lastQuestionId: Int = 0
    var hasCallHelp: Bool = true
    var hasHallHelp: Bool = true
    var hasFiftyHelp: Bool = true
    var answers: [SavedAnswer]
}

struct SavedAnswer: Codable {
    let questionId: Int
    let answerId: Int
}
