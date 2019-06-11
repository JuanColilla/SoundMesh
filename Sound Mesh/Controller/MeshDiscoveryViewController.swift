//
//  MeshDiscoveryViewController.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 05/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class MeshDiscoveryViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate  {
  

    let peerID: MCPeerID = MCPeerID.init(displayName: UIDevice.current.name)
    var session: MCSession!
    var meshAdvertiserAssistant: MCAdvertiserAssistant!
    let player = MediaManager()
    
    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var songCover: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        self.SearchButton.isHidden = false
        self.SearchButton.isEnabled = true
        self.songCover.isHidden = true
        self.songTitleLabel.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.session.disconnect()
    }
    
    @IBAction func searchMesh(_ sender: Any) {
        self.joinMesh()
    }
    
    func joinMesh() {
        let mcBrowser = MCBrowserViewController(serviceType: "jc-sm", session: self.session)
        mcBrowser.delegate = self
        self.present(mcBrowser, animated: true, completion: nil)
    }
    
    func playReceivedSong(songTitle: String) {
        if player.requestLibraryAccess() {
               player.prepareJoinedPlayer(songTitle: songTitle)
               songCover.image = player.getCover(size: CGSize(width: songCover.frame.width, height: songCover.frame.height))
               songTitleLabel.text = player.getTitle()
               player.playSong()
        }
    }
    
    
    // MARK: -> MultiPeerConnectivity Related Methods.
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let songTitle = String(decoding: data, as: UTF8.self)
        if (songTitle == "Pause") {
            self.player.pause()
        } else {
            if (songTitle == player.getTitle()) {
                player.playSong()
            } else {
                self.playReceivedSong(songTitle: songTitle)
            }
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
        self.SearchButton.isHidden = true
        self.SearchButton.isEnabled = false
        self.songCover.isHidden = false
        self.songTitleLabel.isHidden = false
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }
    

}
