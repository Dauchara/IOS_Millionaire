//
//  Question.swift
//  Millionaire
//
//  Created by Ниязов Ринат Раимжанович on 6/14/21.
//

import Foundation

struct Question {
    let id: Int
    let text: String
    let answers: [Answer]
    let sum: Float
}

struct Answer {
    let id: Int
    let text: String
    let isTrue: Bool
}

class Quiz {
    var questions = [Question]()
    
    init() {
        setup()
    }
    
    func setup() {
        var answers1 = Answer(id: 1, text: "A) Греки любили теплые и сырые места", isTrue: false)
        var answers2 = Answer(id: 2, text: "B) Греки прятались на болотах от врагов", isTrue: false)
        var answers3 = Answer(id: 3, text: "C) Греки обычно селились по берегам морей", isTrue: true)
        var answers4 = Answer(id: 4, text: "D) Греки часто ходили на болото охотиться", isTrue: false)
        let question1 = Question(id: 1, text: "Платон сравнил греков с лягушками, рассевшимися вокруг болота. Как вы думаете, почему?", answers: [answers1, answers2, answers3, answers4], sum: 5000)
        
        answers1 = Answer(id: 1, text: "A) в результате извержения вулкана Санторин", isTrue: true)
        answers2 = Answer(id: 2, text: "B) из-за длительной засухи", isTrue: false)
        answers3 = Answer(id: 3, text: "C) после нашествия саранчи", isTrue: false)
        answers4 = Answer(id: 4, text: "D) после вторжения внешних врагов", isTrue: false)
        let question2 = Question(id: 2, text: "Как погибла цивилизация на острове Крит?", answers: [answers1, answers2, answers3, answers4], sum: 10000)
        
        answers1 = Answer(id: 1, text: "A) Афродита", isTrue: true)
        answers2 = Answer(id: 2, text: "B) Афина", isTrue: false)
        answers3 = Answer(id: 3, text: "C) Гера", isTrue: false)
        answers4 = Answer(id: 4, text: "D) Европа", isTrue: false)
        let question3 = Question(id: 3, text: "Назовите имя богини любви и красоты из греческой мифологии?", answers: [answers1, answers2, answers3, answers4], sum: 100000)
        
        answers1 = Answer(id: 1, text: "A) из-за торговых споров", isTrue: false)
        answers2 = Answer(id: 2, text: "B) Гиз-за похищения женщины", isTrue: true)
        answers3 = Answer(id: 3, text: "C) из-за личной неприязни греков к троянцам", isTrue: false)
        answers4 = Answer(id: 4, text: "D) Гиз-за убийства греческого царя", isTrue: false)
        let question4 = Question(id: 4, text: "Из-за чего, согласно Гомеру, началась Троянская война?", answers: [answers1, answers2, answers3, answers4], sum: 385000)
        
        answers1 = Answer(id: 1, text: "A) ойкумена", isTrue: false)
        answers2 = Answer(id: 2, text: "B) столица", isTrue: false)
        answers3 = Answer(id: 3, text: "C) метрополис", isTrue: false)
        answers4 = Answer(id: 4, text: "D) полис", isTrue: true)
        let question5 = Question(id: 1, text: "Как назывался греческий город?", answers: [answers1, answers2, answers3, answers4], sum: 500000)
        
        self.questions = [question1, question2, question3, question4, question5]
    }
}
