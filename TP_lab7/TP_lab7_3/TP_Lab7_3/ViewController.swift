//
//  ViewController.swift
//  TP_Lab7_3
//
//  Created by Admin on 28.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var backgroundSwitch: UISwitch!
    @IBOutlet weak var switchIndicator: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        switchIndicator.textColor = UIColor.white
        switchIndicator.text = "Background image: bg1.jpg"
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backgroundSwitchTapped(_ sender: Any) {
        if self.backgroundSwitch.isOn
        {
            switchIndicator.text = "Background image: bg1.jpg"
            view.backgroundColor = UIColor(patternImage: UIImage(named:"bg1")!)
        }
        else
        {
            switchIndicator.text = "Background image: bg2.jpg"
        
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)

        }
    }
}

