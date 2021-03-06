//
//  CustomTableViewController.swift
//  chat_test_ios
//
//  Created by Hayato Ishino on 2016/10/07.
//  Copyright © 2016年 haya_channel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CustomTableViewController: UITableViewController {
    
    var roomsArray: [String] = []
    
    
    @IBAction func ReloadRoom(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func back(segue:UIStoryboardSegue){//戻るボタン用
        self.tableView.reloadData()
    }
    
    func indexRoom(){
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
            self.tableView.reloadData()
        }
    }
    
    

    override func viewDidLoad() {
        self.indexRoom()
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return roomsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        let room = roomsArray[indexPath.row]
            cell.roomName.text = room
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //let selectData = tableView.cellForRow(at: indexPath as IndexPath)!.textLabel!.text
        self.performSegue(withIdentifier: "showMessagesSegue", sender: nil)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //if segue.identifier == "showMessagesSegue" {
            
        //}
    }
    
}
