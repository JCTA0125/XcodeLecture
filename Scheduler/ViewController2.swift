//
//  ViewController2.swift
//  Scheduler
//
//  Created by mac12 on 5/1/24.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    var dateString: String!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController3 else {
            return
        }
        tempController.dateString = dateString
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view2 탄생")
        let c: (UIAlertAction) -> Void = { action in self.dateLabel.text = "Good!!" }
        let alertController = UIAlertController(title: "약속시간",
                        message: dateString, preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: c)
        alertController.addAction(alertAction)
        /*
        alertController.addAction(UIAlertAction(title: "No", style: .cancel,
                                        handler: { action in
                                            self.dateLabel.text = "Oops!"
                                            self.navigationController?.popViewController(animated: true)
                                        }))
        */
        alertController.addAction(UIAlertAction(title: "No", style: .cancel) { action in
            self.dateLabel.text = "Oops!"
            self.navigationController?.popViewController(animated: true)
        })
                    
        self.present(alertController, animated: true, completion: { () in print("alert shown...") } )
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view2 나 들어 가요")
        dateLabel.text = dateString
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view2 나 들어 왔어요")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view2 나 나가요")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view2 나 나왔어요")
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
