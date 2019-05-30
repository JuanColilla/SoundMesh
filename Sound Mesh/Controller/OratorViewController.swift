//
//  OratorViewController.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 05/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit
import AVFoundation

class OratorViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var recordingSession: AVAudioSession!
    
    @IBOutlet weak var micImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        micImage.image = UIImage(named: "Mic")
        
        recordingSession = AVAudioSession.sharedInstance()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func micImageTap(_ sender: UITapGestureRecognizer) {
        
        do {
            try recordingSession.setCategory(.record, mode: .spokenAudio)
            try recordingSession.setActive(true)
            //recordingSession.requestRecordPermission(<#T##response: PermissionBlock##PermissionBlock##(Bool) -> Void#>) 
            
        } catch {
            print("No se han dado permisos.")
        }

        
        
        
        
        if micImage.image == UIImage(named: "Mic") {
            micImage.image = UIImage(named: "RedMic")
        } else {
            micImage.image = UIImage(named: "Mic")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    
    

}
