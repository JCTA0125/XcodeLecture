//
//  ViewController3.swift
//  Scheduler
//
//  Created by mac12 on 5/1/24.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet var summary: UILabel!

    var numOfPlay: Int!
    var youTot : Int!
    var meTot: Int!
    var sumTxt: String!
    override func viewDidLoad() {
        summary.text = "number of play : \(numOfPlay!)\nyour total score : \(youTot!)\nmy total score : \(meTot!)\n" + (sumTxt)
        
        let alertController = UIAlertController(title: "Reset",
                                                message: "Good Luck!", preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default){_ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        alertController.addAction(alertAction)
        /*
         alertController.addAction(UIAlertAction(title: "No", style: .cancel,
         handler: { action in
         self.dateLabel.text = "Oops!"
         self.navigationController?.popViewController(animated: true)
         }))
         */
        alertController.addAction(UIAlertAction(title: "No", style: .cancel))
        self.present(alertController, animated: true, completion: { () in print("alert shown...") } )    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
