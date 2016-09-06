//
//  ThreadStore.swift
//  PictBoard
//
//  Created by Shintaro Katafuchi on 9/7/16.
//  Copyright © 2016 Shintaro Katafuchi. All rights reserved.
//

import Foundation

class ThreadStore {
    var threads: [Thread] = []
}

extension ThreadStore {
    
    func retrieveThreads(block: ((error: NSError?) -> Void)?) {
        let apiURL = NSURL(string: "http://www.mocky.io/v2/57cf049a260000f40664ff0f")!

        let downloadTask = NSURLSession.sharedSession().dataTaskWithURL(apiURL, completionHandler: { data, response, error in
            if error != nil {
                block?(error: error)
                return
            }
            
            let jsonObject = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(rawValue: 0)) as? NSDictionary
            print(jsonObject!)
            
            var threads: [Thread] = []
            if let images = jsonObject?["images"] as? NSArray {
                for image in images {
                    let id = Int(image["id"] as! String)!
                    let title = image["title"] as! String
                    let imageURLString = image["url"] as! String
                    let imageURL = NSURL(string: imageURLString)!
                    
                    let thread = Thread(id: id, title: title, imageURL: imageURL)
                    threads.append(thread)
                }
            }
            self.threads = threads
            
            block?(error: nil)
        })
        downloadTask.resume()
    }
    
}