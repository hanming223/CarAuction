//
//  AppManager.swift
//  Parikramas
//
//  Created by Admin on 10/12/17.
//  Copyright © 2017 Han. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire



final class AppManager {
    
    static let shared: AppManager = {
        return AppManager()
    }()
    
    var imageArray: [UIImage] = []
    
    var loadingNotification: MBProgressHUD!
    
    
    var saleDate: String? = ""
    
    var vin: String? = ""
    var year: String? = ""
    var make: String? = ""
    var model: String? = ""
    var mileage: String? = ""
    var seller: String? = ""
    var license: String? = ""
    var receipt: String? = ""
    
    var engine: String? = ""
    var transmission: String? = ""
    var accessories: String? = ""
    var servicelight: String? = ""
    var interior: String? = ""
    var exterior: String? = ""
    var chargingsystem: String? = ""
    var brakes: String? = ""
    var enginecooling: String? = ""
    var lights: String? = ""
    var tires: String? = ""
    var glass: String? = ""
    
    
    func showAlert(msg: String, activity: UIViewController) -> Void {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        activity.present(alert, animated: true, completion: nil)
    }

    func showAlert(title: String, msg: String, activity: UIViewController, complete:(()->Void)? = nil) -> Void
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alert in
            complete?()
        }
        ))
        activity.present(alert, animated: true, completion: nil)
    }

    
    func showLoadingIndicator(view: UIView){
        loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
    }
    
    func hideLoadingIndicator(){
        loadingNotification.hide(animated: true)
    }
    
   
    
    
 
}
