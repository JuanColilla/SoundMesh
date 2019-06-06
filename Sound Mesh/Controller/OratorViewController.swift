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
    
    @IBOutlet weak var micImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        micImage.image = UIImage(named: "Mic")
        recordingSession = AVAudioSession.sharedInstance()
    }
    
    @IBAction func micImageTap(_ sender: UITapGestureRecognizer) {
        
        do {
            try recordingSession.setCategory(.record, mode: .spokenAudio)
            try recordingSession.setActive(true)
            //recordingSession.requestRecordPermission(<#T##response: PermissionBlock##PermissionBlock##(Bool) -> Void#>) -> Ask for user permission on using microphone. / NOT FINNISHED
            
        } catch {
            print("No se han dado permisos.")
        }
        
        if micImage.image == UIImage(named: "Mic") {
            micImage.image = UIImage(named: "RedMic")
            micManager.startRecording()
        } else {
            micImage.image = UIImage(named: "Mic")
            micManager.stopRecording()
        }
    }
    
    
    
}
