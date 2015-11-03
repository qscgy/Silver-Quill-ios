//
//  IssueViewController.swift
//  Silver Quill
//
//  Created by Sam Ehrenstein on 11/2/15.
//  Copyright © 2015 MBHS Smartphone Programming Club. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController {

    @IBOutlet var pdfViewer: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path=NSBundle.mainBundle().pathForResource("Linguistics34", ofType: "pdf")
        pdfViewer.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: path!)))
        //view.sendSubviewToBack(pdfViewer)
        //print("done")
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
