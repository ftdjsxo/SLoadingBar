//
//  ViewController.swift
//  SLoadingBar
//
//  Created by Francesco Thiery on 25/06/16.
//  Copyright © 2016 Francesco Thiery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let bar = SLoadingBarView.GetLoadingBar()
    var percentage : Double = 0
    var timer : NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(1,
                                                       target: self,
                                                       selector: #selector(ViewController.setBarPercentage),
                                                       userInfo: nil,
                                                       repeats: true)
        
        timer.fire()
        self.view.addSubview(bar)
        bar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setBarPercentage(){
        if percentage >= 10 {
            self.bar.setError()
            return
        }
        self.percentage = percentage + 1
        bar.setPercentage(doubleValue: percentage)
    }

}

