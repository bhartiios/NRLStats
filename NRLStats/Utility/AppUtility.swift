//
//  AppUtility.swift
//  NRLStats
//
//  Created by Bharti Sharma on 16/11/17.
//  Copyright © 2017 Bharti Sharma. All rights reserved.
//

import Foundation
import UIKit

class AppUtility: NSObject {
    
    class func showAlert(title: String, message: String, viewController: UIViewController) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    class func handleError(error:Error?, viewController: UIViewController){
        guard let serverError = error else{
            AppUtility.showAlert(title: "", message: "Something went wrong. Please try later", viewController: viewController)
            return
        }
        
        AppUtility.showAlert(title: "Error", message: serverError.localizedDescription, viewController: viewController)
    }
}
