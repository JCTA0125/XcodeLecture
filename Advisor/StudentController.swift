
import UIKit
import Kanna
import Alamofire

class StudentController: UITableViewController {
    var advisorName: String?
    var studentArray: [String] = []
    var employeeNum: [String] = []
    
    func getStudents() -> Void {
        guard let advisor = advisorName else {
            return
        }
        // 외부 아이피
        //let urlString = "http://10.219.0.15:8080/FinalProject/advisorProHome.jsp" + "?dept=" + advisor
        let urlString = "http://203.252.213.36:8080/FinalProject/advisorProHome.jsp" + "?dept=" + advisor
        // 로컬 호스트
        //let urlString = "http://127.0.0.1:8080/FinalProject/advisorPro.jsp" + "?advisor=" + advisor
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let encodedUrlStr = encodedUrlString else {
            return
        }
        AF.request(encodedUrlStr).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(let str):
                print(str)
                self.parseHTML(htmlStr: str)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func parseHTML(htmlStr string: String) -> Void {
        let document = try? Kanna.HTML(html: string, encoding: .utf8)
        guard let doc = document else {
            print("nothing")
            return
        }
        for node in doc.xpath("//h5") {
            if let text = node.text {
                studentArray.append(text)
                print(text)
            }
        }
        for num in doc.xpath("//h6"){
            if let text = num.text{
                employeeNum.append(text)
                print(text)
            }
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getStudents()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = studentArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: studentArray[indexPath.row], message: "사번 : "+employeeNum[indexPath.row], preferredStyle: UIAlertController.Style.actionSheet)
        alertController.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}
