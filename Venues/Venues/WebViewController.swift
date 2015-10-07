//
//  WebViewController.swift
//  Venues
//
//  Created by Susanne Burnham on 10/7/15.
//  Copyright © 2015 Susanne Kasahara. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    var url: NSURL!

    @IBOutlet weak var myWebView: UIWebView!
    
    
    @IBAction func Cancel(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        
        let request = NSURLRequest(URL: url)
        
        myWebView.loadRequest(request)

        // Do any additional setup after loading the view.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        print(myWebView.request?.URL?.absoluteString)
        
        "http://venues.jo2.co/?code=NWG1Q44FUUFFA1VKBSGRI1CCE1AUROLUTOXIDLXWFSMWL4DR#_=_"
        

        if let string = webView.request?.URL?.absoluteString {
            
            let strParts = string.componentsSeparatedByString("#")
            
            if strParts.count > 0 {
                
                let strParts2 = strParts[0].componentsSeparatedByString("code=")
                
                if strParts2.count > 1 {
                
                    let code = strParts2[1]
                    
                    Foursquare.session().getAccessTokenWithCode(code)
                    
                    dismissViewControllerAnimated(true, completion: nil)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}