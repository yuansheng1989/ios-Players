//
//  PlayerList.swift
//  Players
//
//  Created by Yuansheng Lu on 2018-10-07.
//  Copyright © 2018 Yuansheng Lu. All rights reserved.
//

import UIKit

class PlayerList: UITableViewController {
    
    // instance variables
    
    // Get a reference to the data manager
    let mInfo = QBInfoManager.sharedManager
    // Create a local collection to hold the data
    var qbInfo: [QBInfo] = []
    // Get a reference to the data manager
    let mPerf = QBPerfManager.sharedManager
    // Create a local collection to hold the data
    var qbPerf: [QBPerf] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // fetch the data
        qbInfo = mInfo.allQBInfos()
        qbPerf = mPerf.allQBPerfs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return qbInfo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerlistItem", for: indexPath)

        // Configure the cell...
        
        let playerName = cell.viewWithTag(1000) as! UILabel
        let teamName = cell.viewWithTag(2000) as! UILabel
        playerName.text = qbInfo[indexPath.row].playerName
        teamName.text = qbInfo[indexPath.row].teamName
        
        var photoName: String = "a2-"
        photoName.append(qbInfo[indexPath.row].playerName!.replacingOccurrences(of: " ", with: "-").lowercased())
        photoName.append(".png")
        cell.imageView?.image = UIImage(named: "a2-player-photos/" + photoName)
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // Verify that we can get the selected row's index path
        // and that it is associated with data in the app's data model
        
        // If it's a row selection/tap, then deselect the row
        if let ipSelected = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: ipSelected, animated: true)
        }
        
        // Perform two checks...
        // 1. Ensure that we can get an index path, and
        // 2. Ensure that it associated with valid data
        if let ip = tableView.indexPath(for: sender as! UITableViewCell) {
            if qbInfo.indices.contains(ip.row) {
                return true
            } else if qbPerf.indices.contains(ip.row) {
                return true
            } else {
                // Before the return, we can optionally
                // notify or alert the user about the problem
                return false
            }
        } else {
            // Before the return, we can optionally
            // notify or alert the user about the problem
            return false
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toSomethingDetail" {
            // your code goes here
            let vc = segue.destination as! SomethingDetail
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = qbInfo[indexPath!.row]
            vc.selectedPlayer = selectedData
            vc.dataModelManager = mInfo
            vc.title = selectedData.playerName
            
        }
        
        if segue.identifier == "toSomethingInfo" {
            // your code goes here
            let vc = segue.destination as! SomethingInfo
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = qbPerf[indexPath!.row]
            vc.selectedPlayer = selectedData
            vc.dataModelManager = mPerf
            vc.title = selectedData.playerName
        }
    }
    

}
