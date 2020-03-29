//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPass = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        secondsPass = 0
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPass < totalTime {
            secondsPass += 1
            let percent = Float(secondsPass) / Float(totalTime)
            progressBar.progress = percent
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            titleLabel.text = "Done!"
        }
    }
}
