//
//  SomethingDetail.swift
//  Players
//
//  Created by Xiaochen Wang on 2018-10-08.
//  Copyright © 2018 Yuansheng Lu. All rights reserved.
//

import UIKit

class SomethingDetail: UIViewController {
    
    // Local Fileds
    
    var selectedPlayer: QBInfo!
    var dataModelManager: QBInfoManager!
    
    // Outlets
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var physical: UILabel!
    @IBOutlet weak var birthdateAndPlace: UILabel!
    @IBOutlet weak var college: UILabel!
    @IBOutlet weak var experience: UILabel!
    @IBOutlet weak var highSchool: UILabel!
    @IBOutlet weak var playerPhoto: UIImageView!
    @IBOutlet weak var teamLogo: UIImageView!
    
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerName.text = selectedPlayer.playerName! + " " + selectedPlayer.playerNumber!
        teamName.text = selectedPlayer.teamName
        physical.text = selectedPlayer.physical
        birthdateAndPlace.text = selectedPlayer.birthdateAndPlace
        college.text = selectedPlayer.college
        experience.text = selectedPlayer.experience
        highSchool.text = selectedPlayer.highSchool
        
        var photoName: String = "a2-"
        photoName.append(selectedPlayer.playerName!.replacingOccurrences(of: " ", with: "-").lowercased())
        photoName.append(".png")
        playerPhoto.image = UIImage(named: "a2-player-photos/" + photoName)
        
        teamLogo.image = UIImage(named: "a2-team-logos/" + selectedPlayer.teamCode! + ".png")
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
