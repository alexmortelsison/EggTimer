//
//  ViewController.swift
//  EggTimer
//
//  Created by Alex Sison on 4/2/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var secondsRemaining = 60
    var timer = Timer()

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()

        let hardness = sender.currentTitle!
        secondsRemaining = eggTimes[hardness]!

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds")
            secondsRemaining -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
}
