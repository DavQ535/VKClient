//
//  APIRequests.swift
//  SocialNetwork
//
//  Created by David Varro on 30/08/2021.
//

import Alamofire
import WebKit

let session: Session = {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 60
    return Session(configuration: config)
}()

func getData(token: String, method: String) {
    let host = "https://api.vk.com"
    let path = "/method/" + method
    let params: Parameters = ["access_token": token, "extended": 1, "v": 5.131]
    session.request(host + path, method: .get, parameters: params).responseJSON { response in
        print("----\(method)----")
        print(response.value)
    }


}

func getSearchGroup(token: String, method: String, searchText: String) {
    let host = "https://api.vk.com"
    let path = "/method/" + method
    let params: Parameters = ["access_token": token, "extended": 1, "v": 5.131, "q": searchText, "type": "group"]
    session.request(host + path, method: .get, parameters: params).responseJSON { response in
        print("----\(method)----")
        print(response.value)
    }


}
