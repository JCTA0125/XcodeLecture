//
//  DetailController.swift
//  DustStoryBoard
//
//  Created by mac12 on 6/18/24.
//  Copyright © 2024 dheum. All rights reserved.
//

import UIKit
import Alamofire

class DetailController: UIViewController{
    var infoStr : String = ""
    var weatherStr : String = ""
    
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var weatherLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoLabel.text = infoStr
        weatherLabel.text = weatherStr
    }
}
