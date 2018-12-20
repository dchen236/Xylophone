//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        let tag = sender.tag
        let pathUrl = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav")
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: pathUrl!)
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
  

}

