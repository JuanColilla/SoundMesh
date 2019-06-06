//
//  MediaViewController.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 08/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit
import MultipeerConnectivity
import MediaPlayer

class MediaViewController: UIViewController, MCSessionDelegate {
    
    let player = MediaManager()
    
    var connectedPeerIDs: [String] = [String()]
    var tableViewTab: UITabBarController!
    
    // NCSession Variables:
    let peerID: MCPeerID = MCPeerID.init(displayName: UIDevice.current.name)
    var session: MCSession!
    var meshAdvertiserAssistant: MCAdvertiserAssistant!
    
    // Outlets to charge:
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var mediaStatusButton: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        session.delegate = self
        self.createMesh()
        /* ------------------------ UNDER CONSTRUCTION---------------------------------------------------------
        
        tableViewTab = self.tabBarController?.viewControllers[1] as DevicesListTableViewController -> 1) Necesito pasar la sesión de este controller al segundo controller de mi tabBarView para poder obtener los peerIDs. Parece que el prepareForSegue no funciona en este tipo de Views.
 
    ----------------------------------------------------------------------------------------------------------*/
        
        coverImage.image = UIImage(named: "Cover")
        player.preparePlayer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //self.disolveMesh()
    }
    
    
    // Player related functions:
    
    @IBAction func pressPlayButton(_ sender: UITapGestureRecognizer) {
        if player.requestLibraryAccess() {
            if mediaStatusButton.image == UIImage(named: "play") {
                player.playSong()
                self.sendData()
                songTitle.text = player.getTitle()
                coverImage.image = player.getCover(size: CGSize(width: coverImage.frame.width, height: coverImage.frame.height))
                mediaStatusButton.image = UIImage(named: "pause")
            } else {
                mediaStatusButton.image = UIImage(named: "play")
                player.pause()
            }
        }
    }
    
    @IBAction func pressPreviousButton(_ sender: UITapGestureRecognizer) {
        player.previousSong()
        self.sendData()
        songTitle.text = player.getTitle()
        coverImage.image = player.getCover(size: CGSize(width: coverImage.frame.width, height: coverImage.frame.height))
    }
    
    @IBAction func pressNextButton(_ sender: UITapGestureRecognizer) {
        player.nextSong()
        self.sendData()
        songTitle.text = player.getTitle()
        coverImage.image = player.getCover(size: CGSize(width: coverImage.frame.width, height: coverImage.frame.height))
    }
    
    // Mesh related functions:

    func createMesh() {
        self.meshAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "jc-sm", discoveryInfo: nil, session: self.session)
        self.meshAdvertiserAssistant.start()
    }
    
    func disolveMesh() {
        self.meshAdvertiserAssistant.stop()
        self.session.disconnect()
    }
    
    func sendData() {
        let infoToSend = player.getSongURL()
        //var dataToSend: Data =
        if infoToSend != nil {
        /* for peer in session.connectedPeers {
            do {
                try session.send(infoToSend, toPeers: [peer], with: .reliable)
                // TESTING:
                
                //
            
            } catch {
                print("Failed to send Data... JC")
            }
            } */
        }
    }
    
    /* ------------------------ UNDER CONSTRUCTION---------------------------------------------------------
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let peersListView = segue.destination as? DevicesListTableViewController {
            if let destinySession = self.session {
                peersListView.session = destinySession
                tableViewTab.session
            }
               /* for peer in session.connectedPeers {
                    peersListView.connectedPeerIDs.append(peer.displayName)
            } */
        }
    }
 
 ----------------------------------------------------------------------------------------------------------*/
    
    
    
    // MARK: -> Métodos del MCSessionDelegate
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
   /*     switch state {
        case .connected:
            connectedPeerIDs.append(peerID.displayName)
            
        case .notConnected:
            connectedPeerIDs.removeAll{( $0.contains(peerID.displayName) )}
            
        case .connecting:
            break
        } */
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        
    }

}
