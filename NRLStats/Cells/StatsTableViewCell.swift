//
//  StatsTableViewCell.swift
//  NRLStats
//
//  Created by Bharti Sharma on 16/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class StatsTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var labelTeamA: UILabel!
    @IBOutlet weak var labelTeamB: UILabel!
    @IBOutlet weak var tableAPlayers: UITableView!
    @IBOutlet weak var tableBPlayers: UITableView!
    
    var teamA:TeamModel?
    var teamB:TeamModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    //MARK:- Custom Methods
    
    /// Fill cellanimated
    ///
    /// - Parameters:
    ///   - teamModelA: model of team A
    ///   - teamModelB: model of team B
    func fillStatsCell(teamModelA:TeamModel, teamModelB:TeamModel) {
        teamA = teamModelA
        teamB = teamModelB
        labelTeamA.text = "TeamA - \(teamModelA.teamName)"
        labelTeamB.text = "TeamB - \(teamModelB.teamName)"
        
        tableAPlayers.reloadData()
        tableBPlayers.reloadData()
    }
    
    /// Get team model on the basis of current Table
    ///
    /// - Parameter table: table for team A or team B
    /// - Returns: model of team
    func getTeamModel(table:UITableView)->TeamModel?{
        
        if table == tableAPlayers{
            return teamA
        }
        return teamB
    }
    
    //MARK:- UITableView Delegate & Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = getTeamModel(table: tableView)?.teamTopPlayers.count else {
            return 0
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as? PlayerTableViewCell else{
            return UITableViewCell()
        }
        
        guard let player = getTeamModel(table: tableView)?.teamTopPlayers[indexPath.row] else {
            return UITableViewCell()
        }
        cell.fillPlayerCell(playerModel: player)
        return cell
    }
}
