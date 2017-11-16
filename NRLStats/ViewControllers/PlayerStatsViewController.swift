//
//  PlayerStatsViewController.swift
//  NRLStats
//
//  Created by Bharti Sharma on 16/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class PlayerStatsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, StatsApiManager {

    @IBOutlet weak var collVwStats: UICollectionView!
    
    var arrNames = ["Errors", "Goals", "Intercepted", "Intercepts", "Kicks", "Points", "Possessions", "Runs", "Tackles", "Tries", "Mins Played", "Attacking Kicks", "Bombs Caught", "Bombs Dropped", "Charged Down", "Charges Down", "Drop Outs", "Dummy Half Runs", "Effective Offloads", "Fantasy Points", "Field Goal Attempts", "Field Goal Misses", "Field Goals", "Forced Drop Outs", "General Play Pass", "Goal Misses", "Ineffective Tackles", "In Goal Escapes", "Interchanges Off", "Interchanges On", "Kick Errors", "Kick Metres", "Kick Return Metres", "Kick Returns", "Kicks 4020", "Kicks Dead", "Last Touch Try Assists", "Line Break Assists", "Line Break Causes", "Line Breaks", "Line Engagements", "Long Kicks", "Missed Tackles", "Off Loads", "One Pass Runs", "Penalties Conceded", "Play The Balls", "Run Metres", "Runs 7Less Meters", "Runs 8Plus Meters", "Send Offs", "Sin Bins", "Steals One On One", "Stolen One On One", "Tackle Busts", "Tackled Opp20", "Tackle Opp Half", "Tackles One On One", "Try Assists", "Try Causes", "Try Contribution Percentage", "Try Contributions", "Try Involvements", "Twenty Metre Restarts", "Weighted Kicks"]
    var arrValues = [Int]()
    
    var modelPlayer = PlayerModel()
    var teamID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webserviceForPlayerStats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Webservice Method
    
    func webserviceForPlayerStats(){
        self.showLoader()
        self.getPlayerStatsDetails(teamID: teamID, playerID: modelPlayer.playerId, completionHandler: { (statsModel) in
            
            let mirroredObject = Mirror(reflecting: statsModel)
            // Add all the value from model in array
            for (_, attr) in mirroredObject.children.enumerated() {
                if let value = attr.value as? NSNumber{
                    self.arrValues.append(value.intValue)
                }
            }
            self.collVwStats.reloadData()
            self.hideLoader()
        }) { (error) in
            self.hideLoader()
            AppUtility.handleError(error: error, viewController: self)
        }
    }
    
    //MARK:- UICollection View Delegate & Datasource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerStatsCell", for: indexPath) as? PStatsCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.fillPlayerLastMatchStats(name: arrNames[indexPath.row], value: arrValues[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.width/4)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{

        return CGSize(width: collectionView.frame.width, height: 301)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as? PStatsHeaderCollReusableVw else{
                return UICollectionReusableView()
            }
            
            headerView.fillPlayerData(modelPlayer: modelPlayer)
            return headerView
        }
        
        return UICollectionReusableView()
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
