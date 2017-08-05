//
//  MessageService.swift
//  Smack
//
//  Created by Super Awesome on 8/2/17.
//  Copyright © 2017 Super Awesome. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    var selectedChannel: Channel?
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        
        Alamofire.request(Constants.URL.getChannels, method: .get, parameters: nil , encoding: JSONEncoding.default, headers:  Constants.Header.bearerHeader).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                // SwiftyJSON way
                if let json = JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: Constants.Notif.channelsLoaded, object: nil)
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func clearChannels() {
        channels.removeAll()
    }
    
    
}
