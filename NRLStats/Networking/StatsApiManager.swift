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
}
