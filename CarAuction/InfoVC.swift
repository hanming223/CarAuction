//
//  InfoVC.swift
//  CarAuction
//
//  Created by Han on 2018/10/2.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Vehicle information"
        
        
        nextButton.backgroundColor = .clear
        nextButton.layer.cornerRadius = 18
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.black.cgColor
    }
    
    
    @IBAction func onNextButton(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
