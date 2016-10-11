//
//  RoomAll.swift
//  chat_test_ios
//
//  Created by Hayato Ishino on 2016/10/07.
//  Copyright © 2016年 haya_channel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RoomAll: NSObject {
    
    static var roomsArray: [String] = []
    
    static let queue = DispatchQueue(label: "RoomAll", attributes: [], target: nil)
    static let group = DispatchGroup()
    
    class func indexRoom() -> Array<String>{

        Alamofire.request("http://localhost:3000/api/v1/rooms").responseJSON{response in
            debugPrint(response)
            
            guard let rooms = response.result.value else{
                return
            }
            
            let json = JSON(rooms)
            
            json.forEach{ (_, json) in
                let room = json["name"].string
                self.roomsArray.append(room!)
            }
        }

        return roomsArray
    }
}
