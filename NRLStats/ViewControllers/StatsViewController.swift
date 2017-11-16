//
//  StatsViewController.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController, StatsApiManager, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableMatches: UITableView!
    
    let innerPlayerTableHt = 140
    let remainingHt = 40
    var arrStatTypes = [MatchModel]()
    
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
        self.getStatsDetails(completionHandler: { (arrMatch) in
            self.arrStatTypes = arrMatch
            DispatchQueue.main.async {
                self.tableMatches.reloadData()
            }
        }) { (error) in
            
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
        cell.fillStatsCell(teamModelA: arrStatTypes[indexPath.section].matchTeamA, teamModelB: arrStatTypes[indexPath.section].matchTeamB)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrStatTypes[section].matchStatType.capitalized
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(innerPlayerTableHt * arrStatTypes[indexPath.section].matchTeamA.teamTopPlayers.count + remainingHt)
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
