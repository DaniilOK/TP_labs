//
//  ViewController.swift
//  TP_lab7_4
//
//  Created by Admin on 28.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureIndicator: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureIndicator.isUserInteractionEnabled = true
        gestureIndicator.textAlignment = NSTextAlignment.center
        gestureIndicator.numberOfLines = 2;
        gestureIndicator.text = "Используйтежесты в этой области"
        gestureIndicator.backgroundColor = UIColor.yellow
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tap(_ sender: Any)
    {
        gestureIndicator.text = "Жест: касание\n Цвет фона:зеленый"
        gestureIndicator.backgroundColor = UIColor.green
    }
    
    @IBAction func pinch(_ sender: Any) {
        gestureIndicator.text = "Жест: масштабирование\n Цвет фона:красный"
        gestureIndicator.backgroundColor = UIColor.red
    }
    
    @IBAction func rotation(_ sender: Any) {
        gestureIndicator.text = "Жест: вращение\n Цвет фона:синий"
        gestureIndicator.backgroundColor = UIColor.blue

    }
    
    @IBAction func swipe(_ sender: Any) {
        gestureIndicator.text = "Жест: смахивание\n Цвет фона: серый"
        gestureIndicator.backgroundColor = UIColor.lightGray

    }
    
    @IBAction func longPress(_ sender: Any) {
        gestureIndicator.text = "Жест: долгое нажатие\n Цвет фона:оранжевый"
        gestureIndicator.backgroundColor = UIColor.orange

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

