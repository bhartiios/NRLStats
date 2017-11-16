//
//  StatsApiManager.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

protocol StatsApiManager: ApiManager {}

extension StatsApiManager{
    
    //MARK:- Webservices
    
    /// Webservice to fetch stat details
    ///
    /// - Parameters:
    ///   - completionHandler: block to handle success
    ///   - failureHandler: block to handle failure
    func getStatsDetails(completionHandler: @escaping (_ arrMatch:[MatchModel]) -> Void, failureHandler: @escaping (_ error: Error?) -> Void){
        self.makeGETWebserviceCall(strURL: AppConstants.statsUrl, completionHandler: { (response) in
            guard let arrResponse = response as? [[String:Any]] else{
                failureHandler(nil)
                return
            }
            var arrMatch = [MatchModel]()
            for dictMatch in arrResponse{
                var match = MatchModel()
                match.fillMatchData(dictMatch: dictMatch)
                arrMatch.append(match)
            }
            completionHandler(arrMatch)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    
    /// Get statistics of particular team's player
    ///
    /// - Parameters:
    ///   - teamID: team id whom player belongs to
    ///   - playerID: id of player
    ///   - completionHandler: block to handle success
    ///   - failureHandler: block to handle failure
    func getPlayerStatsDetails(teamID:Int, playerID:Int, completionHandler: @escaping (_ response:StatisticsModel) -> Void, failureHandler: @escaping (_ error: Error?) -> Void){
        self.makeGETWebserviceCall(strURL: getPlayerStatsUrl(teamID: teamID, playerID: playerID) , completionHandler: { (response) in
            guard let dictResponse = response as? [String:Any] else{
                failureHandler(nil)
                return
            }
            
            var statsModel = StatisticsModel()
            statsModel.fillStatsData(dicResponse: dictResponse)
            completionHandler(statsModel)
        }) { (error) in
            failureHandler(error)
        }
    }

    //MARK:- Custom Methods
    
    /// Get the url by appending team id & player id
    ///
    /// - Parameters:
    ///   - teamID: value
    ///   - playerID: value
    /// - Returns: url
    func getPlayerStatsUrl(teamID:Int, playerID:Int)->String{
        
        let url = "https://statsapi.foxsports.com.au/3.0/api/sports/league/series/1/seasons/115/teams/\(teamID)/players/\(playerID)/detailedstats.json?&userkey=9024ec15-d791-4bfd-aa3b-5bcf5d36da4f"
        return url
    }
}
