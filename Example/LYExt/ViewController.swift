//
//  ViewController.swift
//  LYExt
//
//  Created by blodely on 04/23/2019.
//  Copyright (c) 2019 blodely. All rights reserved.
//

import UIKit
import LYExt


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		do {
			let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
			self.view.addSubview(view)
			view.border1Px()
		}
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

