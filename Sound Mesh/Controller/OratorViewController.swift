//
//  OratorViewController.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 05/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit
import AVFoundation
import MultipeerConnectivity

class OratorViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var recordingSession: AVAudioSession!
    var micManager = OratorManager()
    var permission = false
    
    @IBOutlet weak var micImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        micManager.setupRecorder(delegate: self)
        micImage.image = UIImage(named: "Mic")
        recordingSession = AVAudioSession.sharedInstance()
        self.permission = micManager.prepareRecording(session: recordingSession)
    }
    
    @IBAction func micImageTap(_ sender: UITapGestureRecognizer) {
        
        if micImage.image == UIImage(named: "Mic") && permission {
            micImage.image = UIImage(named: "RedMic")
            micManager.startRecording()
        } else {
            micImage.image = UIImage(named: "Mic")
            micManager.stopRecording()
        }
    }
    
}
