//
//  RoomCreateViewController.swift
//  chat_test_ios
//
//  Created by Hayato Ishino on 2016/10/09.
//  Copyright © 2016年 haya_channel. All rights reserved.
//

import UIKit
import Alamofire

class RoomCreateViewController: UIViewController {

    @IBOutlet weak var RoomNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CreateRoomButton(_ sender: AnyObject) {
        
        if(RoomNameField.text != nil){
            let name: String = RoomNameField.text!
            RoomCreate.CreateRoom(name)
        }
    }

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/

}
