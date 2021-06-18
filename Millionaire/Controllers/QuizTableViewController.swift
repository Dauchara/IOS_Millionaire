//
//  QuizTableViewController.swift
//  Millionaire
//
//  Created by Ниязов Ринат Раимжанович on 6/15/21.
//

import UIKit

class QuizTableViewController: UITableViewController {

    var questions = Quiz().questions
    var gameSession: GameSession?
    
    var queue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.estimatedRowHeight = 44 // временно, нужно сделать динамическим
        tableView.sectionHeaderHeight = 44 // временно, нужно сделать динамическим
        
        Game.default.resotreResults() //Временно, почему то в AppDelegate не запускается функция
        
        if Game.default.gameSession.id > 0 && queue == 0 {
            gameSession = Game.default.gameSession
            let lastQuestionId = gameSession?.lastQuestionId
            queue = questions.firstIndex(where: {$0.id==lastQuestionId })!
        } else {
            // create gameSession temp
            let lastQuestionId = questions[queue].id
            gameSession = GameSession(id: 1, date: Date(), winSum: 0, correctAnswers: 0, lastQuestionId: lastQuestionId, hasCallHelp: true, hasHallHelp: true, hasFiftyHelp: true, answers: [])
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

            return questions[queue].answers.count

    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! CustomHeader
        view.backgroundColor = UIColor.purple
        view.title.text = questions[queue].text
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
        cell.textLabel?.text = questions[queue].answers[indexPath.row].text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionId = questions[queue].id
        let answerId = questions[queue].answers[indexPath.row].id
        let isTrue = questions[queue].answers[indexPath.row].isTrue
        
        gameSession?.correctAnswers += isTrue ? 1 : 0
        gameSession?.winSum += isTrue ? questions[queue].sum : 0
        gameSession?.lastQuestionId = questions[queue].id
        gameSession?.answers.append(SavedAnswer(questionId: questionId, answerId: answerId))
        
        Game.default.saveSession(gameSession!)
        
        queue += 1
        
        let totalQuestions = questions.count
        
        if queue >= totalQuestions {
            let correctAnswers = Game.default.gameSession.correctAnswers
            let alert = UIAlertController(title: "Вы завершили тест!", message: "Поздравляем вы ответили верно на \(correctAnswers) из \(totalQuestions) и заработали \(Game.default.gameSession.winSum)", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Класс!", style: .default, handler: {_ in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainMenu") as! ViewController
                self.present(vc, animated: true, completion: nil)
            }))
            //Сохраняем результат
            Game.default.saveResults()
            Game.default.removeSession()
            self.present(alert, animated: true,completion: nil)
        } else {
            self.tableView.reloadData()
        }
    }
}

class CustomHeader: UITableViewHeaderFooterView {
    let title = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textColor = UIColor.white
        contentView.backgroundColor = UIColor.purple
        contentView.addSubview(title)
        
        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 5),
            
        ])
    }
    
}
