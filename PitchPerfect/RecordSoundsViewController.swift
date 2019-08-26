//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Owen Pi on 2019-08-18.
//  Copyright © 2019 Owen Pi. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController
{
    var audioRecorder : AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        stopRecordingButton.isEnabled = false;
    }


    @IBAction func recordAudio(_ sender: Any)
    {
        //Lets the user know recording started
        recordingLabel.text = "Recording!";
        stopRecordingButton.isEnabled = true;
        recordButton.isEnabled = false;
        
        //Record audio
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any)
    {
        //Lets the user know recording stopped
        recordButton.isEnabled = true;
        recordingLabel.text = "Tap to record";
        stopRecordingButton.isEnabled = false;
        
        //Stops recording
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}

