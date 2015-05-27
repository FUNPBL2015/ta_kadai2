//
//  WebViewController.swift
//  Map
//
//  Created by Kudo Takuya on 2015/05/23.
//  Copyright (c) 2015年 Kudo Takuya. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate  {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.delegate = self
        var myURL = NSURL(string: "http://www.fun.ac.jp/")
        var myURLReq = NSURLRequest(URL: myURL!)
        
        myWebView.loadRequest(myURLReq)
        
      
        // Do any additional setup after loading the view, typically from a nib.
    }

    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        SVProgressHUD.show()
        SVProgressHUD.showWithStatus("読み込み中")
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
         SVProgressHUD.dismiss()
    }

    @IBAction func nextButton(sender: AnyObject) {
        self.myWebView.goBack()

    }
    @IBAction func backButton(sender: AnyObject) {
          self.myWebView.goForward()
    }
    
    @IBAction func refreshButton(sender: AnyObject) {
        self.myWebView.reload()
    }
    
    @IBAction func stopButton(sender: AnyObject) {
        
        self.myWebView.stopLoading()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
