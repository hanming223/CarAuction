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
    
    @IBOutlet weak var vinnumberTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var mileageTextField: UITextField!
    @IBOutlet weak var sellerTextField: UITextField!
    @IBOutlet weak var licenseTextField: UITextField!
    @IBOutlet weak var receiptTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Vehicle information"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)

        
        nextButton.backgroundColor = .clear
        nextButton.layer.cornerRadius = 18
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.black.cgColor
    }
    
    
    @IBAction func onNextButton(_ sender: Any) {
        
        AppManager.shared.vin = vinnumberTextField.text
        AppManager.shared.year = yearTextField.text
        AppManager.shared.make = makeTextField.text
        AppManager.shared.model = modelTextField.text
        AppManager.shared.mileage = mileageTextField.text
        AppManager.shared.seller = sellerTextField.text
        AppManager.shared.license = licenseTextField.text
        AppManager.shared.receipt = receiptTextField.text
        
        let vc: FormVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FormVC") as! FormVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
