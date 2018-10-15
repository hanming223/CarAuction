//
//  ReportVC.swift
//  CarAuction
//
//  Created by Han on 2018/10/9.
//  Copyright © 2018 Han. All rights reserved.
//

import UIKit
import SwiftyDropbox
import WebKit

class ReportVC: UIViewController, WKNavigationDelegate  {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var firstPageButton: UIButton!
    
    @IBOutlet weak var purchaseWebView: WKWebView!
    @IBOutlet weak var noticeWebView: WKWebView!
    
    @IBOutlet weak var stock: UITextField!
    @IBOutlet weak var ryear: UITextField!
    @IBOutlet weak var trim: UITextField!
    @IBOutlet weak var rengine: UITextField!
    @IBOutlet weak var fuel: UITextField!
    @IBOutlet weak var rmake: UITextField!
    @IBOutlet weak var door: UITextField!
    @IBOutlet weak var trans: UITextField!
    @IBOutlet weak var odo: UITextField!
    @IBOutlet weak var rmodel: UITextField!
    @IBOutlet weak var body: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var row: UITextField!
    @IBOutlet weak var seats: UITextField!
    @IBOutlet weak var remote: UITextField!
    @IBOutlet weak var windows: UITextField!
    @IBOutlet weak var locks: UITextField!
    @IBOutlet weak var system: UITextField!
    @IBOutlet weak var roof: UITextField!
    @IBOutlet weak var rack: UITextField!
    @IBOutlet weak var note: UITextView!
    
    
    var purchaseHTMLContent, noticeHTMLContent: String!
    
    var client: DropboxClient!
    
    var folderPath: String!
    
    let dispatchGroup = DispatchGroup()

    var isFailure: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Vehicle Information Report"
        
        nextButton.backgroundColor = .clear
        nextButton.layer.cornerRadius = 18
        nextButton.layer.borderWidth = 1
        nextButton.layer.borderColor = UIColor.black.cgColor
        
        firstPageButton.backgroundColor = .clear
        firstPageButton.layer.cornerRadius = 18
        firstPageButton.layer.borderWidth = 1
        firstPageButton.layer.borderColor = UIColor.black.cgColor
        
        note.layer.borderWidth = 1
        note.layer.borderColor = UIColor.black.cgColor
        
        purchaseWebView.navigationDelegate = self
        purchaseWebView.alpha = 0
        
        noticeWebView.navigationDelegate = self
        noticeWebView.alpha = 0
        
        DropboxClientsManager.authorizedClient = DropboxClient.init(accessToken: API_KEY)
        client = DropboxClientsManager.authorizedClient
        
        
    }

    @IBAction func onSaveButton(_ sender: Any) {
        
        AppManager.shared.showLoadingIndicator(view: self.view)
        
        let last2OfYear: String = String(AppManager.shared.year!.suffix(2))
        folderPath = "/\(AppManager.shared.saleDate!)/\(last2OfYear)_\(AppManager.shared.model!)_\(AppManager.shared.vin!)/"
        
        //upload purchase pdf
        
        let purchaseHTMLPath = Bundle.main.path(forResource: "purchase", ofType: "html")
        
        do {
            purchaseHTMLContent = try String(contentsOfFile: purchaseHTMLPath!)
        } catch {    }

        
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#sale_date", with: AppManager.shared.saleDate!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#seller", with: AppManager.shared.seller!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#license", with: AppManager.shared.license!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#vin", with: AppManager.shared.vin!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#year", with: AppManager.shared.year!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#make", with: AppManager.shared.make!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#model", with: AppManager.shared.model!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#mileage", with: AppManager.shared.mileage!)
        purchaseHTMLContent = purchaseHTMLContent.replacingOccurrences(of: "#receipt", with: AppManager.shared.receipt!)
        
        dispatchGroup.enter()
        purchaseWebView.loadHTMLString(purchaseHTMLContent, baseURL: nil)
        
        
        //upload notice pdf
        
        let noticeHTMLPath = Bundle.main.path(forResource: "notice", ofType: "html")
        
        do {
            noticeHTMLContent = try String(contentsOfFile: noticeHTMLPath!)
        } catch {    }
        
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#engine", with: AppManager.shared.engine!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#transmission", with: AppManager.shared.transmission!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#accessories", with: AppManager.shared.accessories!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#servicelight", with: AppManager.shared.servicelight!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#interior", with: AppManager.shared.interior!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#exterior", with: AppManager.shared.exterior!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#chargingsystem", with: AppManager.shared.chargingsystem!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#brakes", with: AppManager.shared.brakes!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#enginecooling", with: AppManager.shared.enginecooling!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#lights", with: AppManager.shared.lights!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#tires", with: AppManager.shared.tires!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#glass", with: AppManager.shared.glass!)
        
   
        
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#stock", with: stock.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#ryear", with: ryear.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#trim", with: trim.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#rengine", with: rengine.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#fuel", with: fuel.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#rmake", with: rmake.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#door", with: door.text!)
        
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#trans", with: trans.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#odo", with: odo.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#rmodel", with: rmodel.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#body", with: body.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#color", with: color.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#row", with: row.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#seats", with: seats.text!)
        
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#remote", with: remote.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#windows", with: windows.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#locks", with: locks.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#roof", with: roof.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#system", with: system.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "rack", with: rack.text!)
        noticeHTMLContent = noticeHTMLContent.replacingOccurrences(of: "#note", with: note.text!)

        
        dispatchGroup.enter()
        noticeWebView.loadHTMLString(noticeHTMLContent, baseURL: nil)
        
        
        //upload images
        
        for i in 0..<AppManager.shared.imageArray.count {

            dispatchGroup.enter()
            
            let fileData = UIImagePNGRepresentation(AppManager.shared.imageArray[i]) as Data?

            client?.files.upload(path: folderPath + "pictures/" + String(i + 1) + ".jpg", input: fileData!)
                .response { response, error in
                    if let response = response {
                        print(response)
                    } else if let error = error {
                        print(error)
                        self.isFailure = true
                    }
                    self.dispatchGroup.leave()
                }
                .progress { progressData in
                   
            }

        }
        
        dispatchGroup.notify(queue: .main) {
            AppManager.shared.hideLoadingIndicator()
            
            if (self.isFailure == true){
                AppManager.shared.showAlert(msg: "Upload Failure", activity: self)
            }else{
                AppManager.shared.showAlert(msg: "Upload Success", activity: self)
            }
            
            self.isFailure = false
        }
        
    }
    
    func createPDF(html: String, formmatter: UIViewPrintFormatter, filename: String) -> String {
        
        print("createPDF: \(html)")
        
        // 2. Assign print formatter to UIPrintPageRenderer
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(formmatter, startingAtPageAt: 0)
        
        // 3. Assign paperRect and printableRect
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        let printable = page.insetBy(dx: 0, dy: 0)
        
        render.setValue(NSValue(cgRect: page), forKey: "paperRect")
        render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        
        // 4. Create PDF context and draw
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)
        
        for i in 1...render.numberOfPages {
            
            UIGraphicsBeginPDFPage();
            let bounds = UIGraphicsGetPDFContextBounds()
            render.drawPage(at: i - 1, in: bounds)
        }
        
        UIGraphicsEndPDFContext();
        
        // 5. Save PDF file
        let path = "\(NSTemporaryDirectory())\(filename).pdf"
        pdfData.write(toFile: path, atomically: true)
        print("open \(path)")
        
        return path
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        if webView == purchaseWebView{
            
            let path = createPDF(html: purchaseHTMLContent, formmatter: webView.viewPrintFormatter(), filename: "Auto Purchase Agreement")
            print("PDF location: \(path)")
            
            if let data = NSData(contentsOfFile: path){
                client?.files.upload(path: folderPath + "pdf/" + "Auto Purchase Agreement.pdf", input: data as Data)
                    .response { response, error in
                        if let response = response {
                            print(response)
                        } else if let error = error {
                            print(error)
                            self.isFailure = true
                        }
                        self.dispatchGroup.leave()
                    }
                    .progress { progressData in
                        
                }
            }
            
        }else if webView == noticeWebView{
            
            let path = createPDF(html: noticeHTMLContent, formmatter: webView.viewPrintFormatter(), filename: "Condition Report")
            print("PDF location: \(path)")
            
            if let data = NSData(contentsOfFile: path){
                client?.files.upload(path: folderPath + "pdf/" + "Condition Report.pdf", input: data as Data)
                    .response { response, error in
                        if let response = response {
                            print(response)
                        } else if let error = error {
                            print(error)
                            self.isFailure = true
                        }
                        self.dispatchGroup.leave()
                    }
                    .progress { progressData in
                        
                }
            }
            
        }
        

    }

    
    @IBAction func onFirstPageButton(_ sender: Any) {
        
//        self.navigationController!.viewControllers.removeAll()
        
        AppManager.shared.imageArray.removeAll()
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "Nav") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = viewController
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

