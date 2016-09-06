//
//  File.swift
//  PictBoard
//
//  Created by Shintaro Katafuchi on 9/7/16.
//  Copyright © 2016 Shintaro Katafuchi. All rights reserved.
//

import Foundation

class Comment {
    let body: String
    let date: NSDate
    
    init(body: String, date: NSDate) {
        self.body = body
        self.date = date
    }
}