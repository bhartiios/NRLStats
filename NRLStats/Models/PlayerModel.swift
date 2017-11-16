//
//  PlayerModel.swift
//  NRLStats
//
//  Created by Bharti Sharma on 15/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation

struct PlayerModel {
    var playerId = 0
    var playerPosition = ""
    var playerFullName = ""
    var playerShortName = ""
    var playerStatValue = 0
    var playerJumperNo = 0
    
    /// Fill Model from server data
    ///
    /// - Parameter dictPlayer: Dictionary
    mutating func fillPlayerData(dictPlayer:[String:Any]){
        
        if let id = dictPlayer["id"] as? NSNumber{
            playerId = id.intValue
        }
        
        if let position = dictPlayer["position"] as? String{
            playerPosition = position
        }
        
        if let fullName = dictPlayer["full_name"] as? String{
            playerFullName = fullName
        }
        
        if let shortName = dictPlayer["short_name"] as? String{
            playerShortName = shortName
        }
        
        if let statValue = dictPlayer["stat_value"] as? NSNumber{
            playerStatValue = statValue.intValue
        }
        
        if let jumperNo = dictPlayer["jumper_number"] as? NSNumber{
            playerJumperNo = jumperNo.intValue
        }
    }
}
