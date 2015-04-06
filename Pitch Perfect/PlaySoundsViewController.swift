//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Mark Zhang on 15/4/5.
//  Copyright (c) 2015年 Mark Zhang. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        audioPlayer=AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        audioPlayer.enableRate=true
    
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile (forReading: receivedAudio.filePathURL, error: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playSound(speed:Float){
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.stop()
        audioPlayer.rate = speed
        audioPlayer.currentTime=0.0
        audioPlayer.play()
    }
    
    func playAudioWithVariablePitch (pitch:Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayNode.scheduleFile(audioFile!, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayNode.play()
    }

    @IBAction func playslowSound(sender: UIButton) {
        playSound(0.5)
}
    
    @IBAction func playfastSound(sender: UIButton) {
        playSound(1.5)
    }
    
    @IBAction func stopPlaying(sender: UIButton) {
        audioPlayer.stop()
    }

    @IBAction func playChipmunkSound(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func palyDarthVaderSound(sender: UIButton) {
        playAudioWithVariablePitch(-500)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
