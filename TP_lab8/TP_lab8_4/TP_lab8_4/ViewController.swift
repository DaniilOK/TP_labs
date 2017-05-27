//
//  ViewController.swift
//  TP_lab8_4
//
//  Created by Admin on 28.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var descrFiled: UITextView!
    var items = [[String:String]]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = loadPlist()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func loadPlist()->[[String:String]]
    {
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        return NSArray(contentsOf: NSURL(fileURLWithPath: path!) as URL) as! [[String:String]]
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    internal func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCell(withIdentifier: "bookCell")!
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item["title"]
        cell.detailTextLabel?.text = item["description"]
        cell.imageView?.image = UIImage(named: item["image"]!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    

    
}

