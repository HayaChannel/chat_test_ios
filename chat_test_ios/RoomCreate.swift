//
//  RoomCreate.swift
//  chat_test_ios
//
//  Created by Hayato Ishino on 2016/10/10.
//  Copyright © 2016年 haya_channel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RoomCreate: NSObject {
    
    class func CreateRoom(_ roomName: String){
        
        let params: [String: String] = [
            "name": roomName
        ]
        
        Alamofire.request("http://localhost:3000/api/v1/rooms", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            switch(response.result) {
            case .success(_):
                if response.result.value != nil{
                    print(response.result.value)
                }
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
        }
        
    }
}
