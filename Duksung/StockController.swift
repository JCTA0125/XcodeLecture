
import UIKit
import Kanna
import Alamofire

class StockController: UITableViewController {
    var scheduleItem: [String] = []
    var scheduleDate: [String] = []
    var urlLinks: [String] = []
    
    var bookmark: [String:Int] = [:]
    
    func getSchedule() -> Void {
        let urlString = "https://www.paxnet.co.kr/stock/sise/totalRanking?wlog_rpax=User_rank"
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
        for item in doc.xpath("//div[@class='list-box'][1]/dl/dd/table/tbody/tr/td/a") {
            if let text = item.text {
                scheduleItem.append(text)
            }
        }
        for date in doc.xpath("//div[@class='list-box'][1]/dl/dd/table/tbody/tr/td[@class='per']") {
            if let text = date.text {
                let txt = text.dropFirst(2)
                scheduleDate.append(String(txt))
            }
        }
        for urlLink in doc.xpath("//div[@class='list-box'][1]/dl/dd/table/tbody/tr/td/a/@href"){
            if let urlString = urlLink.text{
                urlLinks.append(urlString)
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
        if let label = cell.contentView.viewWithTag(1) as? UILabel{
            label.text = scheduleItem[indexPath.row]
        }
        if let label = cell.contentView.viewWithTag(2) as? UILabel{
            label.text = scheduleDate[indexPath.row]
        }        // Configure the cell...
        //cell.textLabel?.text = scheduleItem[indexPath.row]
        //cell.detailTextLabel?.text = scheduleDate[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = scheduleItem[indexPath.row]
        if let count = bookmark[selectedItem] {
            bookmark[selectedItem] = count + 1
        } 
        else {
            bookmark[selectedItem] = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? WebController
        let index = tableView.indexPathForSelectedRow?.row
        print(index!)
        if let destination = destination, let index = index {
            destination.urlStr = urlLinks[index]
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        //print("refresh")
        scheduleDate = []
        scheduleItem = []
        urlLinks = []
        self.getSchedule()
    }
    @IBAction func markList(_ sender: Any) {
        let sortedBookmark = bookmark.sorted { $0.value > $1.value }
        var rankList : String = ""
        for kkey in 0..<sortedBookmark.count{
            rankList = rankList + sortedBookmark[kkey].0 + " "
        }
        print(rankList)
        let alertController = UIAlertController(title:"내 종목검색랭킹", message: rankList, preferredStyle: UIAlertController.Style.actionSheet)
        alertController.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
