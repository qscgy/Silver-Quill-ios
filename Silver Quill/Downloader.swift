//
//  Downloader.swift
//  Silver Quill
//
//  Created by Sam Ehrenstein on 11/2/15.
//  Copyright © 2015 MBHS Smartphone Programming Club. All rights reserved.
//

import Foundation

class Downloader{
    class func load(URL:NSURL){
        let sessionCfg=NSURLSessionConfiguration.defaultSessionConfiguration()
        let session=NSURLSession(configuration: sessionCfg)
        let request=NSMutableURLRequest(URL: URL)
        request.HTTPMethod="GET"
        let task=session.dataTaskWithRequest(request, completionHandler: {(data:NSData?,response:NSURLResponse?,error:NSError?)->Void in
            if let e=error{
                print("Failure: \(e)")
            } else {
                let statusCode=(response as! NSHTTPURLResponse).statusCode
                print("Success: \(statusCode)")

            }
        })
        task.resume()
    }
}