//
//  Issue.swift
//  Silver Quill
//
//  Created by Sam Ehrenstein on 12/7/15.
//  Copyright © 2015 MBHS Smartphone Programming Club. All rights reserved.
//

import Foundation

class Issue{
    var uniqueID:Int
    var title:String
    var date:Int
    var coverURL:String
    var contentURL:String
    
    init(id:String,title:String,date:String,cover:String,content:String){
        uniqueID=Int(id)!
        self.title=title
        self.date=Int(date)!
        coverURL=cover
        contentURL=content
    }
}