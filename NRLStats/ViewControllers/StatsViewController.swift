//
//  StatsViewController.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController, StatsApiManager, UITableViewDelegate, UITableViewDataSource, StatsCellDelegate {

    @IBOutlet weak var tableMatches: UITableView!
    @IBOutlet var labelNote: UILabel!
    
    let innerPlayerTableHt = 100
    let remainingHt = 130
    var arrStatTypes = [MatchModel]()
    var selectedIndexPath:NSIndexPath?
    var selectedTeam:TeamModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Statistics"
        webserviceForStatsData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Custom Methods
    
    func webserviceForStatsData(){
        self.showLoader()
        self.getStatsDetails(completionHandler: { (arrMatch) in
            self.arrStatTypes = arrMatch
            DispatchQueue.main.async {
                self.tableMatches.reloadData()
                self.hideLoader()
            }
        }) { (error) in
            self.hideLoader()
            AppUtility.handleError(error: error, viewController: self)
        }
    }
    
    //MARK:- UITableView Delegate & Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrStatTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatsCell", for: indexPath) as? StatsTableViewCell else{
            return UITableViewCell()
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.delegate = self
        cell.fillStatsCell(teamModelA: arrStatTypes[indexPath.section].matchTeamA, teamModelB: arrStatTypes[indexPath.section].matchTeamB)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrStatTypes[section].matchStatType.replacingOccurrences(of: "_", with: " ").capitalized
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(innerPlayerTableHt * arrStatTypes[indexPath.section].matchTeamA.teamTopPlayers.count + remainingHt)
    }
    
    //MARK:- Player Cell Delegate
    
    func playerCellSelected(forTeam: TeamModel?, indexPath: NSIndexPath) {
        selectedIndexPath = indexPath
        selectedTeam = forTeam
        self.performSegue(withIdentifier: "PlayerStats", sender: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "PlayerStats"{
            guard let playerStatsVC = segue.destination as? PlayerStatsViewController else{
                return
            }
            guard let indexPath = selectedIndexPath else{
                return
            }
            guard let team = selectedTeam else{
                return
            }
            playerStatsVC.modelPlayer = team.teamTopPlayers[indexPath.row]
            playerStatsVC.teamID = team.teamId
        }
    }
}
