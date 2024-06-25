//
//  ViewController.swift
//  Movie
//
//  Created by mac12 on 5/15/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameField.delegate = self
    }

    @IBAction func register(_ sender: Any) {
        self.nameField.resignFirstResponder()
                let text = nameField.text
                if text!.isEmpty {
                    welcomeLabel.text = "Enter name, please~"
                } else {
                    welcomeLabel.text = "\(text!) is registered!"
                    let naviController = self.tabBarController?.viewControllers?[1] as? UINavigationController
                    let controller = naviController?.viewControllers[0] as? MovieController
                    controller?.nameString = nameField.text
                }
    }
    
}
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.nameField.backgroundColor = UIColor.green
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = UIColor.lightGray
        return true;
    }
}
