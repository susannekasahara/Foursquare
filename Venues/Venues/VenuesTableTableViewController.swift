//
//  VenuesTableTableViewController.swift
//  Venues
//
//  Created by Susanne Burnham on 10/6/15.
//  Copyright © 2015 Susanne Kasahara. All rights reserved.
//

import UIKit

class VenuesTableTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Foursquare.session().venues.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VenueCell", forIndexPath: indexPath)

        // Configure the cell...
        
        let venue = Foursquare.session().venues[indexPath.row]
        
        cell.textLabel?.text = venue["name"] as? String

        return cell
    }
    }
