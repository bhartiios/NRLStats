//
//  MatchModel.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

struct MatchModel {
    var matchId = ""
    var matchTeamA = TeamModel()
    var matchTeamB = TeamModel()
    var matchStatType = ""
    
    
    /// Fill Model from server data
    ///
    /// - Parameter dictMatch: Dictionary
    mutating func fillMatchData(dictMatch:[String:Any]){
        
        if let id = dictMatch["match_id"] as? String{
            matchId = id
        }
        
        if let statType = dictMatch["stat_type"] as? String{
            matchStatType = statType
        }
        
        if let teamA = dictMatch["team_A"] as? [String:Any]{
            var team = TeamModel()
            team.fillTeamData(dictTeam: teamA)
            matchTeamA = team
        }
        
        if let teamB = dictMatch["team_B"] as? [String:Any]{
            var team = TeamModel()
            team.fillTeamData(dictTeam: teamB)
            matchTeamB = team
        }
    }
}

