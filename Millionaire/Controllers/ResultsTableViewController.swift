
import UIKit

class ResultsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Game.default.resotreResults() //Временно, почему то в AppDelegate не запускается функция
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Game.default.records.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let record = Game.default.records[indexPath.row]
        cell.textLabel?.text = "Выигранная сумма: \(record.winSum)"
        cell.detailTextLabel?.text = "Верно \(record.correctAnswers) из \(record.answers.count). \(DateFormatter.localizedString(from: record.date!, dateStyle: .medium, timeStyle: .medium))"
    }
}
