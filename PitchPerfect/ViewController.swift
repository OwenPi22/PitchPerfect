//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Owen Pi on 2019-08-18.
//  Copyright © 2019 Owen Pi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        stopRecordingButton.isEnabled = false;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any)
    {
        recordingLabel.text = "Recording!";
        stopRecordingButton.isEnabled = true;
        recordButton.isEnabled = false;
    }
    
    @IBAction func stopRecording(_ sender: Any)
    {
        recordButton.isEnabled = true;
        recordingLabel.text = "Tap to record";
        stopRecordingButton.isEnabled = false;
    }
}

