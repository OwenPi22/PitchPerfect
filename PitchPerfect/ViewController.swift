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
        print("Run")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any)
    {
        recordingLabel.text = "Recording!";
    }
    
    @IBAction func stopRecording(_ sender: Any)
    {
        print("stop recording");
    }
}

