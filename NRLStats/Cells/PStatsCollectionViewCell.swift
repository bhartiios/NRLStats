//
//  PStatsCollectionViewCell.swift
//  NRLStats
//
//  Created by Bharti Sharma on 16/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import UIKit

class PStatsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    func fillPlayerLastMatchStats(name:String, value: Int){
        labelName.text = name
        labelValue.text = "\(value)"
    }
}
