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
    
    @IBOutlet private var Nodes: [UIButton]!
    private var currentPlayingTag:Int = 0
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAddPanGestureRecognizer(view: view)
        
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        print("pressed")
        let tag = sender.tag
        playAudio(tag: tag)
        
    }
    
    
    private func viewAddPanGestureRecognizer(view:UIView){
        let pan = UIPanGestureRecognizer()
        pan.addTarget(self, action: #selector(panHandler(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc private func panHandler(sender:UIPanGestureRecognizer){
        let location = sender.location(in: view)
        switch sender.state {
            case .began:
                let nodeTag = correspondingNode(panLocation: location)
                print(nodeTag)
                currentPlayingTag = nodeTag
                playAudio(tag: nodeTag)
        case .changed:
            
            
            let nodeTagChanged = correspondingNode(panLocation:location)
            
            
            if nodeTagChanged != currentPlayingTag{
                playAudio(tag: nodeTagChanged)
                currentPlayingTag = nodeTagChanged
            }
            default:
                break
        }
    }
//  This function is used for panGesture, when passing a CGPoint it will return the tag of the corresponding
//  node such that the node's frame contains the CGpoint
   
    private func correspondingNode(panLocation:CGPoint) -> Int{
        for node in Nodes {
            print(panLocation)
            if node.frame.contains(panLocation){
                return node.tag
            }
        }
        return currentPlayingTag
    }


    private func playAudio(tag:Int){
        let pathUrl = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav")
        do {
            print(tag)
            audioPlayer = try AVAudioPlayer(contentsOf: pathUrl!)
        }catch let erorr{
            print(erorr.localizedDescription)
        }
        audioPlayer.play()
    }
    
    
    
  

}

