//
//  IntExtensions.swift
//  Meetup
//
//  Created by Matt Deuschle on 7/8/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import Foundation

extension Int {
    var selectedCity: City {
        if self == 0 {
            return .newYork
        } else {
            return .losAngeles
        }
    }
}


