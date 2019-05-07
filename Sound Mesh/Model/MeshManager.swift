//
//  MeshManager.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 27/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//
import MultipeerConnectivity

class MeshManager: MCSessionDelegate, MCBrowserViewControllerDelegate{
    
    let peerID: MCPeerID = MCPeerID.init(displayName: UIDevice.current.name)
    var session: MCSession!
    var meshAdvertiserAssistant: MCAdvertiserAssistant!
    
    init(mode: Int){
        if mode == 0 {
            session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
            session.delegate = self
        } else {
            // Join Mesh?
        }
        
    }
    
    func createMesh() {
        self.meshAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "Sound Mesh", discoveryInfo: nil, session: self.session)
        self.meshAdvertiserAssistant.start()
    }
    
    func disolveMesh() {
        self.meshAdvertiserAssistant.stop()
    }
    
    func joinMesh() {
        let meshBrowser = MCBrowserViewController(serviceType: "Sound Mesh", session: self.session)
        meshBrowser.delegate = self
        // self.present(meshBrowser, animated: true, completion: nil) <- This doesn't work in my case... 🙄
        
    }
    
    func obtainPeers() -> [MCPeerID] {
        return session.connectedPeers
    }
    
    // MARK: - MC Delegate Functions / ALL OF THIS MAKES NO SENSE TO ME...
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        <#code#>
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        <#code#>
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        <#code#>
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        <#code#>
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        <#code#>
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        <#code#>
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        <#code#>
    }
    
    func isEqual(_ object: Any?) -> Bool {
        <#code#>
    }
    
    var hash: Int
    
    var superclass: AnyClass?
    
    // THIS THROWS AN ERROR OUT OF THE BOX
    func `self`() -> Self {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func isProxy() -> Bool {
        <#code#>
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        <#code#>
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        <#code#>
    }
    
    var description: String
    
   
    
}
