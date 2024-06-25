//
//  ViewController.swift
//  Converter
//
//  Created by mac12 on 4/22/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var fahrenTextField: UITextField!
    
    @IBOutlet var celsiusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convert(_ sender: Any) {
        /*
                let fahrenStr = fahrenTextField.text
                let fahrenheit = Double(fahrenStr!)
                let celsius = (fahrenheit! - 32.0) / 1.8
                let celsiusStr = String(celsius)
                celsiusLabel.text = "섭씨 " + celsiusStr
                 */
                
                 let fahrenStr = fahrenTextField.text
                 let fahrenheit = Double(fahrenStr!)
                 if let fahren = fahrenheit {
                    let celsius = (fahren - 32.0) / 1.8
                    let celsiusStr = String(celsius)
                    celsiusLabel.text = "섭씨 " + celsiusStr
                 }
                 else {
                    celsiusLabel.text = "화씨 값을 입력하세요"
                }
                
                /*
                let fahrenStr = fahrenTextField.text
                let fahrenheit = Double(fahrenStr!)
                guard let fahren = fahrenheit else {
                    celsiusLabel.text = "화씨 값을 입력하세요"
                    return
                }
                let celsius = (fahren - 32.0) / 1.8
                let celsiusStr = String(celsius)
                celsiusLabel.text = "섭씨 " + celsiusStr
                 */
                fahrenTextField.resignFirstResponder()    }
    
}

