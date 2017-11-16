//
//  StatsTableViewCell.swift
//  NRLStats
//
//  Created by Bharti Sharma on 16/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit
import Charts

protocol StatsCellDelegate {
    func playerCellSelected(forTeam:TeamModel?, indexPath:NSIndexPath)
}
class StatsTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate, PlayerCellDelegate {

    @IBOutlet weak var labelTeamA: UILabel!
    @IBOutlet weak var labelTeamB: UILabel!
    @IBOutlet weak var tableAPlayers: UITableView!
    @IBOutlet weak var tableBPlayers: UITableView!
    @IBOutlet weak var pieChartTeamA: PieChartView!
    @IBOutlet weak var pieChartTeamB: PieChartView!
    
    var teamA:TeamModel?
    var teamB:TeamModel?
    var delegate:StatsCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    //MARK:- Custom Methods
    
    /// Fill cell
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
        
        updateChartData(forTeam: teamModelA, pieChartStats: pieChartTeamA)
        updateChartData(forTeam: teamModelB, pieChartStats: pieChartTeamB)
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
    
    func updateChartData(forTeam:TeamModel, pieChartStats:PieChartView)  {
        
        var arrEnteries = [PieChartDataEntry]()
        for (_, player) in forTeam.teamTopPlayers.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = Double(player.playerStatValue)
            entry.label = player.playerShortName.components(separatedBy: " ").last
            arrEnteries.append( entry)
        }
        
        // 3. chart setup
        let set = PieChartDataSet( values: arrEnteries, label: "Pie Chart")
        set.valueFont = NSUIFont.systemFont(ofSize: 12)
        set.entryLabelFont = NSUIFont.systemFont(ofSize: 10)
        
        var colors: [UIColor] = []
        //Add random color to players
        for _ in 0..<forTeam.teamTopPlayers.count {
            colors.append(getRandomColor())
        }
        set.colors = colors
        let data = PieChartData(dataSet: set)
        pieChartStats.data = data
        // user interaction false to increase the size of pie chart
        pieChartStats.isUserInteractionEnabled = false
        
        let desc = Description()
        desc.text = "Top Player's Statistics Piechart"
        pieChartStats.chartDescription = desc
        pieChartStats.holeRadiusPercent = 0.2
        pieChartStats.legend.enabled = false
        pieChartStats.transparentCircleColor = UIColor.clear
        
        pieChartStats.rotationEnabled = true
        pieChartStats.animate(xAxisDuration: 1.0, yAxisDuration: 1.0, easingOption: .easeInBounce)
    }
    
    /// Get random colors for player's stats in piechart
    ///
    /// - Returns: UIColor
    func getRandomColor()->UIColor{
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
        return color
    }
    
    //MARK:- Player Cell Delegate
    
    func playerImageAction(button: UIButton) {
        guard let table = button.superview?.superview?.superview as? UITableView else {
            return
        }
        
        guard let indexPath = table.indexPath(for: button.superview?.superview as! UITableViewCell) as NSIndexPath? else{
            return
        }
        
        if table == tableAPlayers{
            self.delegate?.playerCellSelected(forTeam: teamA, indexPath: indexPath)
        } else{
            self.delegate?.playerCellSelected(forTeam: teamB, indexPath: indexPath)
        }
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
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.delegate = self
        cell.fillPlayerCell(playerModel: player)
        return cell
    }
}
