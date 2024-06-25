
import UIKit

class AdvisorController: UITableViewController {
    let advisorArray = ["음두헌","이형규","이재호","강지헌","유제혁"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advisorArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvisorCell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.text = advisorArray[indexPath.row]
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destController = segue.destination as? StudentController else {
            return
        }
        let index = tableView.indexPathForSelectedRow?.row
        destController.advisorName = advisorArray[index!]
    }
}
