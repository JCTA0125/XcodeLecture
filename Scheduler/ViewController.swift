//
//  ViewController.swift
//  Scheduler
//
//  Created by mac12 on 4/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var welcome: UILabel!

    @IBAction func nameUse(_ sender: Any) {
        if let nameStr = nameTextField.text{
            welcome.text = "Welcome " + nameStr + "!!!"
        } else{
            welcome.text = "Enter name please!"
        }
        
        nameTextField.resignFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.text = ""
        welcome.text = "Enter name please!"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController2 else{
            return
        }
        let name = nameTextField.text
        tempController.nameString = name
    }
}
