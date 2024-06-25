//
//  ViewController.swift
//  Movie
//
//  Created by mac12 on 5/15/24.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var tableNum: UITextField!
    var menu:String?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let menu = menu{
            self.orderLabel.text = "\(menu)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableNum.delegate = self
        // Do any additional setup after loading the view.

    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let table = self.tableNum.text
        if let menu = menu{
            self.orderLabel.text = "table \(table!) ordered \(menu)"
        }
        tableNum.resignFirstResponder()
        return true
    }
}

