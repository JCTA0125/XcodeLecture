//
//  ViewController2.swift
//  Scheduler
//
//  Created by mac12 on 5/1/24.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet var youName: UILabel!
    @IBOutlet var youCards: UILabel!
    @IBOutlet var meLabel: UILabel!
    @IBOutlet var whowin: UILabel!
    var nameString: String!
    var numberOfPlay: Int = 0
    var youTotal: Int = 0
    var meTotal: Int = 0
    var sumText: String = "You and me are even!"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("eum")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        youName.text = nameString
        
        print("doo")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view2 나 들어 왔어요")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("hun")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view2 나 나왔어요")
    }
    
    @IBAction func GoButton(_ sender: Any) {
        numberOfPlay += 1
        var cards: [Card] = []
        for i in 1...4 {
            for j in 1...13 {
                let s = Suit(rawValue: i)
                let r = Rank(rawValue: j)
                cards.append(Card(suit: s!, rank: r!))
            }
        }
        cards.shuffle()
        
        var youDescription = ""
        var youScore = 0
        for i in 0..<5 {
            cards[i].flip()
            youScore += cards[i].rank.rawValue * cards[i].suit.rawValue
            youDescription += "\(cards[i].description())\n"
        }
        youCards.text = youDescription
        youTotal += youScore
        
        var meDescription = ""
        var meScore = 0
        for i in 5..<10 {
            cards[i].flip()
            meScore += cards[i].rank.rawValue * cards[i].suit.rawValue
            meDescription += "\(cards[i].description())\n"
        }
        meLabel.text = meDescription
        meTotal += meScore
        
        if youScore > meScore{
            sumText = "You Won!\n"
        } else if youScore == meScore{
            sumText = "You and me are even\n"
        } else {
            sumText = "You Lost!\n"
        }
        whowin.text = sumText + "\(youScore):\(meScore)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tempController = segue.destination as? ViewController3 else{
            return
        }
        tempController.numOfPlay = numberOfPlay
        tempController.meTot = meTotal
        tempController.youTot = youTotal
        tempController.sumTxt = sumText
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
