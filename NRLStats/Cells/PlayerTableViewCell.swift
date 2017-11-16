//
//  PlayerTableViewCell.swift
//  NRLStats
//
//  Created by Bharti Sharma on 16/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit
import SDWebImage

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var imgVwPlayer: UIImageView!
    @IBOutlet weak var labelShortName: UILabel!

    @IBOutlet weak var labelJumpNo: UILabel!
    @IBOutlet weak var labelStatsValue: UILabel!
    @IBOutlet weak var labelPosition: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:- Custom Methodsanimated
    
    /// Fill Cell
    ///
    /// - Parameter playerModel: model
    func fillPlayerCell(playerModel:PlayerModel){
      
        imgVwPlayer.sd_setImage(with:  NSURL(string: AppConstants.imageURL+"\(playerModel.playerId).jpg")! as URL, placeholderImage:  UIImage(named: "default"))
        labelShortName.text = playerModel.playerShortName
        labelJumpNo.text = "\(playerModel.playerJumperNo)"
        labelStatsValue.text = "\(playerModel.playerStatValue)"
        labelPosition.text = playerModel.playerPosition
    }

}
