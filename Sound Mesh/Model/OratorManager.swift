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
    
    var microphone = AVAudioRecorder()
    let player = AVAudioPlayer()
    
    func setupRecorder(delegate: AVAudioRecorderDelegate) {
        
        let recordSettings = [AVFormatIDKey: kAudioFormatMPEG4AAC,
                              AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
                              AVEncoderBitRateKey: 12000,
                              AVNumberOfChannelsKey: 1 ] as [String : Any]
        
        let audioRUL = OratorManager.getFileURL()
        
        do {
        try microphone = AVAudioRecorder(url: audioRUL, settings: recordSettings)
            microphone.delegate = delegate
        } catch {
            print("Fallo al grabar.")
        }
    }

    
    func startRecording() {
        microphone.record()
    }
    
    func stopRecording() {
        microphone.stop()
    }
    
    func getAudioToStream() {
        
    }
    
    
    
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func getFileURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("audioToStream.m4a")
    }
    
    
    
}
