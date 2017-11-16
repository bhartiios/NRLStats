//
//  PStatsHeaderCollReusableVw.swift
//  NRLStats
//
//  Created by Bharti Sharma on 17/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class PStatsHeaderCollReusableVw: UICollectionReusableView {
    @IBOutlet weak var vwTopHeader: UIView!
    @IBOutlet weak var labelPName: UILabel!
    @IBOutlet weak var labelPPosition: UILabel!
    @IBOutlet weak var imgVwPlayer: UIImageView!
    
    func fillPlayerData(modelPlayer:PlayerModel){
        labelPName.text = modelPlayer.playerFullName
        labelPPosition.text = modelPlayer.playerPosition
        imgVwPlayer.sd_setImage(with:  NSURL(string: AppConstants.imageURL+"\(modelPlayer.playerId).jpg")! as URL, placeholderImage:  UIImage(named: "default"))
    }
}
