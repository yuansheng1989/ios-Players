//
//  SomethingInfo.swift
//  Players
//
//  Created by Yuansheng Lu on 2018-10-09.
//  Copyright © 2018 Yuansheng Lu. All rights reserved.
//

import UIKit

class SomethingInfo: UIViewController {
    
    // Local Fileds
    
    var selectedPlayer: QBPerf!
    var dataModelManager: QBPerfManager!
    
    // Outlets
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var gamesPlayed: UILabel!
    @IBOutlet weak var completions: UILabel!
    @IBOutlet weak var attempts: UILabel!
    @IBOutlet weak var completionPercentage: UILabel!
    @IBOutlet weak var attemptsPerGame: UILabel!
    @IBOutlet weak var yards: UILabel!
    @IBOutlet weak var averagePerCompletion: UILabel!
    @IBOutlet weak var yardsPerGame: UILabel!
    @IBOutlet weak var touchdownPasses: UILabel!
    @IBOutlet weak var interceptions: UILabel!
    @IBOutlet weak var firstDowns: UILabel!
    @IBOutlet weak var sacks: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var playerPhoto: UIImageView!
    @IBOutlet weak var teamLogo: UIImageView!
    

    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerName.text = selectedPlayer.playerName
        teamName.text = selectedPlayer.teamName
        rank.text = "Rank: " + String(selectedPlayer.rank!)
        gamesPlayed.text = "Games played: " + String(selectedPlayer.gamesPlayed!)
        completions.text = "Completions: " + String(selectedPlayer.completions!)
        attempts.text = "Attempts: " + String(selectedPlayer.attempts!)
        completionPercentage.text = "Completion percentage: " + String(selectedPlayer.completionPercentage!) + "%"
        attemptsPerGame.text = "Attempts per game: " + String(selectedPlayer.attemptsPerGame!)
        yards.text = "Total yards: " + String(selectedPlayer.yards!)
        averagePerCompletion.text = "Average per completion: " + String(selectedPlayer.averagePerCompletion!)
        yardsPerGame.text = "Yards per game: " + String(selectedPlayer.yardsPerGame!)
        touchdownPasses.text = "Touchdown passes: " + String(selectedPlayer.touchdownPasses!)
        interceptions.text = "Interceptions: " + String(selectedPlayer.interceptions!)
        firstDowns.text = "First downs: " + String(selectedPlayer.firstDowns!)
        sacks.text = "Sacks: " + String(selectedPlayer.sacks!)
        rating.text = "Rating: " + String(selectedPlayer.rating!)
        
        var photoName: String = "a2-"
        photoName.append(selectedPlayer.playerName!.replacingOccurrences(of: " ", with: "-").lowercased())
        photoName.append(".png")
        playerPhoto.image = UIImage(named: "a2-player-photos/" + photoName)
        
        teamLogo.image = UIImage(named: "a2-team-logos/" + selectedPlayer.teamCode! + ".png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
