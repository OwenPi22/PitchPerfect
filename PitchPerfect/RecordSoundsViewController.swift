//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Owen Pi on 2019-08-18.
//  Copyright © 2019 Owen Pi. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate
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
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, mode: AVAudioSessionModeDefault, options: AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
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
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool)
    {
        if flag
        {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }
        else
        {
            print("Recording failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "stopRecording"
        {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}
