//
//  Thread.swift
//  PictBoard
//
//  Created by Shintaro Katafuchi on 9/7/16.
//  Copyright © 2016 Shintaro Katafuchi. All rights reserved.
//

import Foundation

class Thread {
    let id: Int
    let imageURL: NSURL
    let title: String
    var comments: [Comment] = []
    
    init(id: Int, title: String, imageURL: NSURL) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
}