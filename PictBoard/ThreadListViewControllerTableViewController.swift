//
//  ThreadListViewControllerTableViewController.swift
//  PictBoard
//
//  Created by Shintaro Katafuchi on 9/7/16.
//  Copyright © 2016 Shintaro Katafuchi. All rights reserved.
//

import UIKit

class ThreadListViewControllerTableViewController: UITableViewController {
    
    let threadStore = ThreadStore()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        threadStore.retrieveThreads { error in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadStore.threads.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ThreadCell") as! ThreadCell
        let thread = threadStore.threads[indexPath.row]
        cell.titleLabel.text = thread.title
        cell.thumbnailImageView.sd_setImageWithURL(thread.imageURL)
        cell.urlLabel.text = thread.imageURL.absoluteString
        return cell
    }
}
