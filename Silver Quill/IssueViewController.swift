//
//  IssueViewController.swift
//  Silver Quill
//
//  Created by Sam Ehrenstein on 11/2/15.
//  Copyright © 2015 MBHS Smartphone Programming Club. All rights reserved.
//

import UIKit
import Alamofire

class IssueViewController: UIViewController {

    @IBOutlet var pdfViewer: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let destination=Alamofire.Request.suggestedDownloadDestination(directory: .DocumentDirectory, domain: .UserDomainMask)
        let manager = NSFileManager.defaultManager()
        let url=manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        let path=url.URLByAppendingPathComponent("abstraction.pdf").path!
        if !(manager.fileExistsAtPath(path)) {
            Alamofire.download(.GET, "https://silverquill.mbhs.edu/magazines/abstraction/abstraction.pdf", destination: destination)
                .progress { bytesRead, totalBytesRead, totalBytesExpectedToRead in
                    //print(totalBytesRead)
                    
                    // This closure is NOT called on the main queue for performance
                    // reasons. To update your ui, dispatch to the main queue.
                    dispatch_async(dispatch_get_main_queue()) {
                        print("Total bytes read on main queue: \(totalBytesRead)")
                    }
                }
                .response { _, _, _, error in
                    if let error = error {
                        print("Failed with error: \(error)")
                    } else {
                        print("Downloaded file successfully")
                    }
            }

        }
        pdfViewer.loadRequest(NSURLRequest(URL: url.URLByAppendingPathComponent("abstraction.pdf")))
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
