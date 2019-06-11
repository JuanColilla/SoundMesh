//
//  OratorManager.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 27/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import Foundation
import AVFoundation

class OratorManager {
    
    var microphone: AVAudioRecorder!
    // let player: AVAudioPlayer!
    
    func setupRecorder(delegate: AVAudioRecorderDelegate) {
        
        let recordSettings = [AVFormatIDKey: kAudioFormatMPEG4AAC,
                              AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
                              AVEncoderBitRateKey: 12000,
                              AVNumberOfChannelsKey: 1 ] as [String : Any]
        
        let audioRUL = self.getFileURL()
        
        do {
            try microphone = AVAudioRecorder(url: audioRUL as URL, settings: recordSettings)
            microphone.delegate = delegate
        } catch {
            print("Fallo al grabar.")
        }
    }
    
    func prepareRecording(session: AVAudioSession) -> Bool {
        var grantedPermissions = false
        do {
            try session.setCategory(.record, mode: .spokenAudio)
            try session.setActive(true)
             // -> Ask for user permission on using microphone.
            
        } catch {
            print("FAIL")
        }
        
        session.requestRecordPermission({(granted: Bool)-> Void in
            if granted {
                grantedPermissions = true
            }else{
                grantedPermissions = false
            }
        })
        return grantedPermissions
    }

    
    func startRecording() {
        microphone.record()
    }
    
    func stopRecording() {
        microphone.stop()
    }
    
    func getAudioToStream() {
        
    }
    
    func getCacheDirectory() -> NSURL {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory , FileManager.SearchPathDomainMask.userDomainMask, true)
        return NSURL.init(fileURLWithPath: paths[0])
    }
    
    func getFileURL() -> NSURL {
        let path = NSURL(string:"audioToStream.m4a", relativeTo: self.getCacheDirectory() as URL)  // getCacheDirectory() + "/audioFileName.m4a"
        
        return path!
    }
    
    
    
}
