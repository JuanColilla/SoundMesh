//
//  MeshManager.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 27/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import MultipeerConnectivity

class MeshManager {
    
    let peerID = MCPeerID.init(displayName: UIDevice.current.name)
    var session: MCSession?
    
    
    init(mode: Int){
        if mode == 0 {
            session = MCSession.init(peer: peerID)
        }
        
    }
    
    
    
    
    
}
