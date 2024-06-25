
import UIKit
import Kanna
import Alamofire

class ScheduleController: UITableViewController {
    var scheduleItem: [String] = []
    var scheduleDate: [String] = []

    func getSchedule() -> Void {
        let urlString = "http://www.duksung.ac.kr/"
        AF.request(urlString).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let htmlStr):
                self.parseHTML(str: htmlStr)
            case .failure(let error):
                print(error)
            }
        }
    }

    func parseHTML(str: String) -> Void {
        let document = try? Kanna.HTML(html: str, encoding: .utf8)
        guard let doc = document else {
            return
        }
        for item in doc.xpath("//p[@class='con']") {
            if let text = item.text {
                scheduleItem.append(text)
            }
        }
        for date in doc.xpath("//p[@class='date']") {
            if let text = date.text {
                scheduleDate.append(text)
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getSchedule()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleItem.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = scheduleItem[indexPath.row]
        cell.detailTextLabel?.text = scheduleDate[indexPath.row]
        return cell
    }
}
