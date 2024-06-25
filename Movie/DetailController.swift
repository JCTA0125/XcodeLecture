//
//  DetailController.swift
//  Movie
//
//  Created by mac12 on 5/17/24.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet var movieImageView: UIImageView!
    var image:UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieImageView.image = image
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
