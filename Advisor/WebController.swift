
import UIKit
import WebKit

class WebController: UIViewController {
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 외부 아이피
        let urlString = "http://10.219.0.15:8080/FinalProject/"
        //let urlString = "http://203.252.213.36:8080/FinalProject/"
        // 로컬 호스트
        //let urlString = "http://127.0.0.1:8080/FinalProject/"
        let url = URL(string: urlString)
        let req = URLRequest(url: url!)

        webView.load(req)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
