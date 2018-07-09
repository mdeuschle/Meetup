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
    struct Venue: Codable {
        let name: String?
    }
}

struct Meetup: Codable {
    let results: [Results]?
}






