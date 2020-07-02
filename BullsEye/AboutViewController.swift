//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Illy Sell on 30/06/2020.
//  Copyright © 2020 Udacity. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
  
  @IBOutlet weak var webView: WKWebView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
      let myUrl = URL(fileURLWithPath: htmlPath)
      let myRequest = URLRequest(url: myUrl)
      webView.load(myRequest)
    }
  }
  
  @IBAction func close() {
    dismiss(animated: true, completion: nil)
  }
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */

}
