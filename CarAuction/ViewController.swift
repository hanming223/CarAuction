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

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var takePictureButton: UIButton!
    @IBOutlet weak var nextPictureButton: UIButton!
    
    @IBOutlet weak var pictureCollectionView: UICollectionView!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    var pictureArray: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
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
        }  */
        
        self.title = "Please select a sale date"
        
        pictureCollectionView.delegate = self
        pictureCollectionView.dataSource = self
        
        takePictureButton.backgroundColor = .clear
        takePictureButton.layer.cornerRadius = 18
        takePictureButton.layer.borderWidth = 1
        takePictureButton.layer.borderColor = UIColor.black.cgColor
        
        nextPictureButton.backgroundColor = .clear
        nextPictureButton.layer.cornerRadius = 18
        nextPictureButton.layer.borderWidth = 1
        nextPictureButton.layer.borderColor = UIColor.black.cgColor
        
        pictureCollectionView.layer.borderWidth = 1
        pictureCollectionView.layer.borderColor = UIColor.black.cgColor
        
    }

    @IBAction func onTakePictureClicked(_ sender: Any) {
     
        showActionSheet()
        
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        pictureArray.append(image!)
        pictureCollectionView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    func photoLibrary()
    {
        
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureArray.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: PictureCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PictureCell", for: indexPath as IndexPath) as! PictureCell
        
        cell.imageView.image = pictureArray[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let yourWidth = (pictureCollectionView.bounds.width - 2) / 2.0
        let yourHeight = yourWidth
        
        return CGSize(width: yourWidth, height: yourHeight)
    }

    @IBAction func dateEditingDidBegin(_ sender: Any) {
        
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        (sender as! UITextField).inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(self.handleDatePicker), for: UIControlEvents.valueChanged)
        
        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(self.dismissPicker))
        dateTextField.inputAccessoryView = toolBar
        
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    @objc func dismissPicker() {
        
        dateTextField.resignFirstResponder()
        
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        
        let vc: InfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIToolbar {
    
    func ToolbarPiker(mySelect : Selector) -> UIToolbar {
        
        let toolBar = UIToolbar()
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.black
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: mySelect)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
    
}

