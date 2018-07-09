//
//  WebService.swift
//  Meetup
//
//  Created by Matt Deuschle on 6/28/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import Foundation

struct WebService {
    static let shared = WebService()
    func downloadMeetups(for city: City, handler: @escaping (Bool, Meetup?) -> Void) {
        let url = WebService.url(for: city)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if data != nil && error == nil {
                do {
                    let json = try JSONDecoder().decode(Meetup.self, from: data!)

                    handler(true, json)
                } catch {
                    handler(false, nil)
                }
            } else {
                print(error!)
                handler(false, nil)
            }
        }
        task.resume()
    }

    static func url(for city: City) -> URL {
        let base = "https://api.meetup.com/2/open_events.json?zip="
        let endpoint = "&text=mobile&time=,1w&key=606e6c4151326c43364d463f44b2b3e"
        let path: String
        switch city {
        case .losAngeles:
            path = base + "90017" + endpoint
        case .newYork:
            path = base + "10026" + endpoint
        }
        guard let url = URL(string: path) else { fatalError() }
        return url
    }
}




