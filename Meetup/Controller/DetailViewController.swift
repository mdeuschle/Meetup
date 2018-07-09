//
//  DetailViewController.swift
//  Meetup
//
//  Created by Matt Deuschle on 7/8/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var results: Results!
    var city: City!

    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var eventUrlButton: UIButton!
    @IBOutlet private weak var eventImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        configURLButton()
    }

    private func configView() {
        mainLabel.text = results.name
        title = city.rawValue
        guard let url = results.photo_url else { return }
        getDataFromUrl(url: url) { data, _, error in
            if data != nil && error == nil {
                DispatchQueue.main.async {
                    self.eventImage.image = UIImage(data: data!)
                }
            }
        }
    }

    private func configURLButton() {
        eventUrlButton.setTitle("Event Website", for: .normal)
        eventUrlButton.addTarget(self,
                                 action: #selector(openURL),
                                 for: .touchUpInside)
    }

    @objc private func openURL() {
        guard let url = results.event_url else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    private func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}
