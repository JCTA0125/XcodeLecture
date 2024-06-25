//
//  ViewController.swift
//  Homework7
//
//  Created by mac12 on 4/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func convertButton(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            resultLabel.text = "name을 입력하세요"
            return
        }
        
        guard let ageStr = ageTextField.text, !ageStr.isEmpty, let age = Int(ageStr) else {
            resultLabel.text = "age를 입력하세요"
            return
        }
        
        resultLabel.text = determineDing(name: name, age: age)
        
        nameTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
    }
    func determineDing(name: String, age: Int) -> String {
        switch age {
        case 8..<14:
            return "\(name)님은 초딩"
        case 14..<17:
            return "\(name)님은 중딩"
        case 17..<20:
            return "\(name)님은 고딩"
        default:
            return "\(name)님은 기타"
        }
    }
    
}
