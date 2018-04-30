//
//  ViewController.swift
//  SeltSizeTextViewInTableView
//
//  Created by iDeveloper2 on 09/01/18.
//  Copyright © 2018 iDeveloper2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var button: Custom!
    
    @IBOutlet weak var tableView: UITableView!
    var itemsArray:[String] = []
    
    required init(coder aDecoder: NSCoder) {
        itemsArray = [String]()
        
        let item1 = "Bananas"
        let item2 = "Oranges"
        let item3 = "Kale"
        let item4 = "Milk"
        let item5 = "Yogurt"
        let item6 = "Cracker Reading from private effective user settings."
    
        itemsArray.append(item1)
        itemsArray.append(item2)
        itemsArray.append(item3)
        itemsArray.append(item4)
        itemsArray.append(item5)
        itemsArray.append(item6)
        
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.button.addTarget(self, action: #selector(self.didClick(_:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didClick(_ sender:UIButton) {
        print(sender.state)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Mycell
        cell.textView.delegate = self
        cell.textView.text = self.itemsArray[indexPath.row]
        
        
        return cell
    }
}



extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
}

