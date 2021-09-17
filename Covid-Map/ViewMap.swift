//
//  ViewMap.swift
//  Covid-Map
//
//  Created by Stefano Brandi on 19/07/21.
//

import UIKit
import WebKit

class ViewMap: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url: URL = URL(string: "https://livecovid19.world/map/")!
        
        let urlRequest:URLRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
    
        webView.scrollView.isScrollEnabled = false
        
        webView.isMultipleTouchEnabled = true
 
    }
     

}
