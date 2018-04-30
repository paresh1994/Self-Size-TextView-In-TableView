
//
//  Mycell.swift
//  SeltSizeTextViewInTableView
//
//  Created by iDeveloper2 on 09/01/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import UIKit

class Mycell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTag(tag: Int){
        textView.tag = 100 + tag
    }
}

extension Mycell: UITextViewDelegate {
    
}
