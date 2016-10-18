//
//  MessagesTableViewCell.swift
//  chat_test_ios
//
//  Created by Hayato Ishino on 2016/10/17.
//  Copyright © 2016年 haya_channel. All rights reserved.
//

import UIKit

class MessagesTableViewCell: UITableViewCell {

    @IBOutlet weak var MessageBody: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
