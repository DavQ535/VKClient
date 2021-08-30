//
//  Session Singleton.swift
//  SocialNetwork
//
//  Created by David Varro on 30/08/2021.
//

import Foundation

class Sessionn {
    
    static let shared = Sessionn()
    
    var token: String = ""
    var userID: Int = 0

    private init() {}
}
