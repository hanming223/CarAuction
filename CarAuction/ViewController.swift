//
//  ViewController.swift
//  CarAuction
//
//  Created by Han on 2018/9/27.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit
import SwiftyDropbox

let API_KEY = "dVa6Cjf4SrAAAAAAAAAAI1a9JG5jgPPbp7Fekw6Ungm01qwXTkoOhwcyiJlBuSbT"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DropboxClientsManager.authorizedClient = DropboxClient.init(accessToken: API_KEY)
        let client = DropboxClientsManager.authorizedClient
        
        for i in 0..<10{
            client?.files.createFolderV2(path: "/" + String(100 - i)).response { response, error in
                if let response = response {
                    print(response)
                } else if let error = error {
                    print(error)
                }
            }
        }
        

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

