
import UIKit
import Alamofire

class LoginController: UIViewController {
    
    @IBOutlet var idField: UITextField!
    @IBOutlet var passwdField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func login(_ sender: Any) {
        guard let id = idField.text, let passwd = passwdField.text else {
            return
        }
        let urlString = "http://10.219.0.15:8080/FinalProject/loginPro.jsp" +
            "?id=" + id + "&passwd=" + passwd
        let encodedUrlStr = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        guard let encodedUrlString = encodedUrlStr else {
            return
        }
        AF.request(encodedUrlString).responseString(encoding: .utf8) { response in
            switch response.result {
            case .success(var str):
                str = str.trimmingCharacters(in: .whitespaces)
                if str.contains("0") || str.contains("-1") {
                    self.idField.text = "Try Again!"
                    self.passwdField.text = ""
                } else {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let scheduleController = storyBoard.instantiateViewController(withIdentifier: "Schedule") as! ScheduleController
                    self.navigationController?.pushViewController(scheduleController, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
