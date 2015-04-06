//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Mark Zhang on 15/4/5.
//  Copyright (c) 2015年 Mark Zhang. All rights reserved.
//

import UIKit
import Foundation

class RecordedAudio: NSObject {
    var filePathURL: NSURL!
    var title: String!
    
    override init () {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        title = "default.wav"
        var pathArray = [dirPath, title]
        let filePathURL = NSURL.fileURLWithPathComponents(pathArray)
        //println(filePathURL)
    }
}
