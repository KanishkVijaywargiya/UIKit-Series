//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    //all are in seconds i.e. 5*60=300
    //PROD Timer Code
    let eggTimes: [String: Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    //Test Timer Code
    //let eggTimes: [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var stopTimerButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBAction func stopTimer(_ sender: UIButton) {
        stopSound() //kills sound
        stopTimerButton.isHidden = true
        progressBar.setProgress(0, animated: true)
        secondsPassed = 0
        titleLabel.text = "How do you like your eggs?"
        timeLeft.isHidden = true
        titleLabel.alpha = 1
        timeLeft.alpha = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLeft.isHidden = true
        progressBar.setProgress(0, animated: true)
        titleLabel.font = .boldSystemFont(ofSize: 30)
        stopTimerButton.isHidden = true
        stopTimerButton.layer.cornerRadius = 40
        timeLeft.font = .boldSystemFont(ofSize: 40)
        
        //rounded edges on progress bar
        progressBar.layer.cornerRadius = 11
        progressBar.clipsToBounds = true
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if progressBar.progress == 0 {
            timer.invalidate()
            titleLabel.font = .boldSystemFont(ofSize: 50)
            let hardness = sender.currentTitle!
            totalTime = eggTimes[hardness]!
            
            progressBar.setProgress(0, animated: true)
            secondsPassed = 0
            titleLabel.font = .boldSystemFont(ofSize: 30)
            titleLabel.text = "\(hardness) eggs coming up!"
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        } else {
            print("Player is playing!")
        }
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.setProgress(Float(secondsPassed) / Float(totalTime), animated: true)
            timeLeft.isHidden = false
            
            //update ui label with mintes & seconds
            let i = (totalTime - secondsPassed)
            timeLeft.text = String(timeString(TimeInterval(i)))
        } else {
            timer.invalidate()
            titleLabel.font = .boldSystemFont(ofSize: 30)
            titleLabel.text = "Egg's are Ready!!!"
            playSound(soundName: "alarm_sound")
            stopTimerButton.isHidden = false
            //timeLeft.text = ""
            timeLeft.font = .boldSystemFont(ofSize: 40)
            
            //flash animation
            UIView.animate(withDuration: 0.5, delay: 0.25, options: [.repeat, .autoreverse], animations: {
                self.titleLabel.alpha = 0
                self.timeLeft.alpha = 0
            }, completion: nil)
            
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: url!)
        self.player.play()
        self.player.numberOfLoops = -1
    }
    
    func stopSound() {
        player.stop()
    }
    
    func timeString(_ time: TimeInterval) -> String {
        //let hour = Int(time) / 3600 % 60
        let min = Int(time) / 60 % 60
        let sec = Int(time) % 60
        
        return String(format: "%02i:%02i", min, sec)
    }
}
