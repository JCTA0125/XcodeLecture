//
//  ViewController3.swift
//  Scheduler
//
//  Created by mac12 on 5/1/24.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet var textView: UITextView!
    
    @IBAction func done(_ sender: Any) {
        textView.resignFirstResponder()
        guard let controller = self.navigationController,
              let tempController = controller.viewControllers[1] as? ViewController2 else {
            return
        }
        tempController.dateString = textView.text
    }
    
    var dateString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view3 탄생")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view3 나 들어 가요")
        textView.text = dateString
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view3 나 들어 왔어요")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view3 나 나가요")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view3 나 나왔어요")
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
