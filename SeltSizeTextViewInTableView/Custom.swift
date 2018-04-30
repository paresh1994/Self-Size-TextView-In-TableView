//
//  Custom.swift
//  SeltSizeTextViewInTableView
//
//  Created by iDeveloper2 on 10/04/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import UIKit

class Custom: UIButton {

    override var isHighlighted: Bool {
        didSet {
            self.backgroundColor = isHighlighted ? UIColor.blue : UIColor.yellow
        }
    }
}
