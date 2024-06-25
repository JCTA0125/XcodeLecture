import UIKit
import WebKit

class WebController: UIViewController {
    @IBOutlet var webView: WKWebView!
    var urlStr: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("url : " + urlStr)
        let url = URL(string: urlStr)
        let req = URLRequest(url: url!)

        webView.load(req)
    }
}
