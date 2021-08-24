//
//  Session Singleton.swift
//  SocialNetwork
//
//  Created by David Varro on 24/08/2021.
//

class Session {
    
    static let shared = Session()
    
    var token: String = ""
    var userID: Int = 0

    private init() {}
}
