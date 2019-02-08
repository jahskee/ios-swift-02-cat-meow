//
//  ViewController.swift
//  ios-swift-project2
//
//  Created by Mac on 2/7/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    var catSound: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.imageView?.contentMode = .scaleAspectFit
        label.isHidden = true
        
        let soundFile = Bundle.main.path(forResource: "Cat", ofType: "wav")
        
        do {
            try catSound = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        }
        
        catch {
            print(error)
        }
    }

    @IBAction func meow(_ sender: Any) {
        label.isHidden = false
        catSound.play()
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(hideLabel), userInfo: nil, repeats: false)
    }
    
    @objc func hideLabel() {
        label.isHidden = true
    }
}

