//
//  DetailViewController.swift
//  Meetup
//
//  Created by Matt Deuschle on 7/8/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {

    var results: Results!
    var city: City!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city.rawValue
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
}
