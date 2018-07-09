//
//  ViewController.swift
//  Meetup
//
//  Created by Matt Deuschle on 6/28/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var meetups = [Results]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMeetups(for: .losAngeles)
        let segmentControl = UISegmentedControl(items: [City.newYork.rawValue, City.losAngeles.rawValue])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(citySelected(_:)), for: .valueChanged)
        navigationItem.titleView = segmentControl
        title = "MeetUps"
    }

    @objc func citySelected(_ sender: UISegmentedControl) {
        loadMeetups(for: sender.selectedSegmentIndex.selectedCity)
    }

    private func loadMeetups(for city: City) {
        meetups = [Results]()
        tableView.reloadData()
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        let cgPoint = CGPoint(x: view.bounds.midX,
                              y: view.bounds.midY)
        activityIndicator.center = cgPoint
        activityIndicator.startAnimating()
        DispatchQueue.main.async {
            self.view.addSubview(activityIndicator)
        }
        WebService.shared.downloadMeetups(for: city) { success, meetup in
            if success {
                DispatchQueue.main.async {
                    guard let meetup = meetup else { return }
                    guard let meetups = meetup.results else { return }
                    self.meetups = meetups
                    activityIndicator.stopAnimating()
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "meetupCell")
        let meetup = meetups[indexPath.row]
        cell.textLabel?.text = meetup.name
        cell.detailTextLabel?.text = meetup.venue?.name
        return cell
    }
}




