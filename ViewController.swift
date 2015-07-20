//
//  ViewController.swift
//  ZhiMaXinYongFen
//
//  Created by Topband on 15/7/20.
//  Copyright (c) 2015年 Topband. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var levelView: LFCreditLevelView!
    
    @IBOutlet var sliders: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.silderAction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func silderAction() {
        var values = [Float]()
        for silder in self.sliders {
            values.append(silder.value)
        }
        self.levelView.contentValue = values
        self.levelView.update()
    }
}

