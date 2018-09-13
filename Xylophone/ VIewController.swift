//
//  ViewController.swift
//  Xylophone
//
//  Created by Anastasiia Veremiichyk on 11/09/2018.
//

import UIKit
import AVFoundation // step 1

class ViewController: UIViewController, AVAudioPlayerDelegate { // step 2
    
    var audioPlayer : AVAudioPlayer! // step 3
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(selectedSoundFileName: soundArray[sender.tag - 1])
        
    }
        

    
    func playSound(selectedSoundFileName : String) {
        
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav") // step 4 <- sets up the location of where our sound is
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundURL!) // step 5 <- we try to initialize or set up our audio player
        }
            
        catch {
            print(error) // step 6 <- catching errors if there are any
        }
        
        audioPlayer.play()
    }

}
