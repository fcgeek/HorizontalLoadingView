//
//  ViewController.swift
//  HorizontalLoadingView
//
//  Created by liujianlin on 2016/11/30.
//  Copyright © 2016年 fcgeek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var horizontalLoadingView: HorizontalLoadingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            horizontalLoadingView.start()
        } else {
            horizontalLoadingView.stop()
        }
    }

}

