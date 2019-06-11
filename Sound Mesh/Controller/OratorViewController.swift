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

class OratorViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate, MCSessionDelegate {
    
    var recordingSession: AVAudioSession!
    var micManager = OratorManager()
    var permission = false
    
    // NCSession Variables:
    let peerID: MCPeerID = MCPeerID.init(displayName: UIDevice.current.name)
    var session: MCSession!
    var meshAdvertiserAssistant: MCAdvertiserAssistant!
    var connectedPeerIDs: [String] = [String()]
    
    @IBOutlet weak var micImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        micManager.setupRecorder(delegate: self)
        micImage.image = UIImage(named: "Mic")
        recordingSession = AVAudioSession.sharedInstance()
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        self.createMesh()
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
    
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            connectedPeerIDs.append(peerID.displayName)
            
        case .notConnected:
            connectedPeerIDs.removeAll{( $0.contains(peerID.displayName) )}
            
        case .connecting:
            break
        @unknown default:
            print("Do nothing...")
        }
    }
    
    func createMesh() {
        self.meshAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "jc-sm", discoveryInfo: nil, session: self.session)
        self.meshAdvertiserAssistant.start()
    }
    
    func disolveMesh() {
        self.meshAdvertiserAssistant.stop()
        self.session.disconnect()
    }
    
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
}
