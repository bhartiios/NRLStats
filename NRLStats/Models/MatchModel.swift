//
//  MatchModel.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

struct MatchModel {
    var matchId:Int = 0
    var matchTeams = [TeamModel]()
    var matchStatType = ""
    
    mutating func fillMatchData(dictMatch:[String:Any]){
        
        if let id = dictMatch["match_id"] as? NSNumber{
            matchId = id.intValue
        }
        
        if let statType = dictMatch["stat_type"] as? String{
            matchStatType = statType
        }
        
        if let teamA = dictMatch["team_A"] as? [String:Any]{
            var team = TeamModel()
            team.fillTeamData(dictTeam: teamA)
            matchTeams.append(team)
        }
        
        if let teamA = dictMatch["team_B"] as? [String:Any]{
            var team = TeamModel()
            team.fillTeamData(dictTeam: teamA)
            matchTeams.append(team)
        }
    }
}

