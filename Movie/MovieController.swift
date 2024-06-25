//
//  MovieController.swift
//  Movie
//
//  Created by mac12 on 5/17/24.
//

import UIKit

class MovieController: UITableViewController {
    //let meals = ["Caprese Salad", "Chicken and Potatos", "Pasta with Meatballs"]
    
    @IBOutlet var mealList: UITableView!
    var mealImages: [UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealList.delegate = self
        
        for (title, description, imageName, price) in dataset{
            let meal = Meal()
            meal.title = title
            meal.description = description
            meal.image = UIImage(named: imageName)
            meal.price = price
            meals.append(meal)
        }
        
                        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)

        // Configure the cell...
        //cell.textLabel?.text = meals[indexPath.row].title
        if let label = cell.contentView.viewWithTag(1) as? UILabel{
            label.text = meals[indexPath.row].title
        }
        if let label = cell.contentView.viewWithTag(2) as? UILabel{
            label.text = String(meals[indexPath.row].price ?? 0) + "won"
            //??의 의미. 앞 값을 벗겨서 nil이면 0으로 표기. nil이 아니면 그대로 처리.
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let currentCell = tableView.cellForRow(at: indexPath)
        //let currentText = currentCell?.textLabel?.text
        //let naviController = self.tabBarController?.viewControllers?[1] as? ViewController

        //naviController?.menu = currentText
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destination = segue.destination as? DetailController
        let index = tableView.indexPathForSelectedRow?.row
        if let destination = destination, let index = index {
            destination.image = meals[index].image
            destination.desc = meals[index].description!
        }
    }
    

}
