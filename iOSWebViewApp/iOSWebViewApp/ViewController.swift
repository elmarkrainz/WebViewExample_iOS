//
//  ViewController.swift
//  iOSWebViewApp
//
//  Created by Elmar Krainz on 10/03/16.
//  Copyright © 2016 All rights reserved.
//

//  inspired from
//  https://tetontech.wordpress.com/2014/07/15/swift-to-javascript-and-javascript-to-swift-a-round-trip/
//


import UIKit
import WebKit


class ViewController: UIViewController, WKScriptMessageHandler {
    
    
    // my webview not in Storyboard
    var theWebView: WKWebView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
      
        // ---  access local html file in project root folder
        let url = Bundle.main.url(forResource: "index", withExtension:"html")
        let request = URLRequest(url: url!)
        
        
        //  create new Webview
        let theConfiguration = WKWebViewConfiguration()
        theConfiguration.userContentController.add(self,
            name: "interOp")
        
        theWebView = WKWebView(frame: self.view.frame,
            configuration: theConfiguration)
        theWebView!.load(request)
        self.view.addSubview(theWebView!)

    
    }

    // --- Callback WKScriptMessageHandler
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        // ---  get the messeg from js
        // TODO ... anything you get from JS can be handled now in iOS
        print(message.body)
        
        
        
        // respond with a call to a JS function from swift
        // --- TODO ... anything from iOs possible to send to HTML
        
        // e.g. som text
        //theWebView!.evaluateJavaScript(" setTextinJS ('from Swift')", completionHandler: nil)
        
        
        // e.g. send device ID
        let devID = "Device id:" + UIDevice.current.identifierForVendor!.uuidString
        print (devID)
        theWebView!.evaluateJavaScript(" setTextinJS ('from Swift \(devID)')", completionHandler: nil)
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

