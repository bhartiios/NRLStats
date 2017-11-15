//
//  TeamModel.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

struct TeamModel {
    var teamId = 0
    var teamName = ""
    var teamCode = ""
    var teamShortName = ""
    var teamTopPlayers = [PlayerModel]()

    mutating func fillTeamData(dictTeam:[String:Any]){
        
        if let id = dictTeam["id"] as? NSNumber{
            teamId = id.intValue
        }
        
        if let name = dictTeam["name"] as? String{
            teamName = name
        }
        
        if let code = dictTeam["code"] as? String{
            teamCode = code
        }
        
        if let shortName = dictTeam["short_name"] as? String{
            teamShortName = shortName
        }
        
        if let arrTopPlayers = dictTeam["top_players"] as? [[String:Any]]{
            
            for dictPlayer in arrTopPlayers{
                var player = PlayerModel()
                player.fillPlayerData(dictPlayer: dictPlayer)
                teamTopPlayers.append(player)
            }
        }
    }
}

