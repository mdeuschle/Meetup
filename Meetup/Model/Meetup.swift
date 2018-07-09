//
//  Meetup.swift
//  Meetup
//
//  Created by Matt Deuschle on 6/28/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import Foundation

struct Results: Codable {
    let name: String?
    let venue: Venue?
    let event_url: URL?
    let photo_url: URL?
    struct Venue: Codable {
        let name: String?
        let address_1: String?
    }
}

struct Meetup: Codable {
    let results: [Results]?
}






