//
//  FormVC.swift
//  CarAuction
//
//  Created by Han on 2018/10/4.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit

class FormVC: UIViewController {

    @IBOutlet weak var engineTextView: UITextView!
    @IBOutlet weak var transmissionTextView: UITextView!
    @IBOutlet weak var accessoriesTextView: UITextView!
    @IBOutlet weak var servicelightTextView: UITextView!
    @IBOutlet weak var interiorTextView: UITextView!
    @IBOutlet weak var exteriorTextView: UITextView!
    @IBOutlet weak var charingsystemTextView: UITextView!
    @IBOutlet weak var brakesTextView: UITextView!
    @IBOutlet weak var enginecoolingTextView: UITextView!
    @IBOutlet weak var lightsTextView: UITextView!
    @IBOutlet weak var tiresTextView: UITextView!
    @IBOutlet weak var glassTextView: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Form Information"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        
        engineTextView.layer.borderColor = UIColor.black.cgColor
        engineTextView.layer.borderWidth = 1.0;
        
        transmissionTextView.layer.borderColor = UIColor.black.cgColor
        transmissionTextView.layer.borderWidth = 1.0;
        
        accessoriesTextView.layer.borderColor = UIColor.black.cgColor
        accessoriesTextView.layer.borderWidth = 1.0;
        
        servicelightTextView.layer.borderColor = UIColor.black.cgColor
        servicelightTextView.layer.borderWidth = 1.0;
        
        interiorTextView.layer.borderColor = UIColor.black.cgColor
        interiorTextView.layer.borderWidth = 1.0;
        
        exteriorTextView.layer.borderColor = UIColor.black.cgColor
        exteriorTextView.layer.borderWidth = 1.0;
        
        charingsystemTextView.layer.borderColor = UIColor.black.cgColor
        charingsystemTextView.layer.borderWidth = 1.0;
        
        brakesTextView.layer.borderColor = UIColor.black.cgColor
        brakesTextView.layer.borderWidth = 1.0;
        
        enginecoolingTextView.layer.borderColor = UIColor.black.cgColor
        enginecoolingTextView.layer.borderWidth = 1.0;
        
        lightsTextView.layer.borderColor = UIColor.black.cgColor
        lightsTextView.layer.borderWidth = 1.0;
        
        tiresTextView.layer.borderColor = UIColor.black.cgColor
        tiresTextView.layer.borderWidth = 1.0;
        
        glassTextView.layer.borderColor = UIColor.black.cgColor
        glassTextView.layer.borderWidth = 1.0;
        
        
        nextButton.backgroundColor = .clear
        nextButton.layer.cornerRadius = 18
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.black.cgColor
        
    }

    @IBAction func onNextButton(_ sender: Any) {
        
        AppManager.shared.engine = engineTextView.text
        AppManager.shared.transmission = transmissionTextView.text
        AppManager.shared.accessories = accessoriesTextView.text
        AppManager.shared.servicelight = servicelightTextView.text
        AppManager.shared.interior = interiorTextView.text
        AppManager.shared.exterior = exteriorTextView.text
        AppManager.shared.chargingsystem = charingsystemTextView.text
        AppManager.shared.brakes = brakesTextView.text
        AppManager.shared.enginecooling = enginecoolingTextView.text
        AppManager.shared.lights = lightsTextView.text
        AppManager.shared.tires = tiresTextView.text
        AppManager.shared.glass = glassTextView.text

        
        let vc: ReportVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReportVC") as! ReportVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   

}
