//
//  DevicesListViewController.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 05/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class DevicesListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var connectedPeerIDs: [String] = [String]()
    var session: MCSession!
    
    @IBOutlet weak var peerTable: UITableView!
    
    let reuseIdentifier = "Cell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let mvc = self.tabBarController?.viewControllers?[0] as? MediaViewController{
            connectedPeerIDs = mvc.connectedPeerIDs
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        peerTable.delegate = self
        peerTable.dataSource = self
         // self.obtainPeers() -> NOT FINNISHED
        peerTable.reloadData()
        
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return connectedPeerIDs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DeviceListViewCell
        
        let peer: String = connectedPeerIDs[indexPath.row]
        cell.title.text = peer
        
        return cell
    }
    
    /* ------------------------ UNDER CONSTRUCTION---------------------------------------------------------
    
    func obtainPeers() {
        for peer in session.connectedPeers {
            connectedPeerIDs.append(peer.displayName)
        }
    }
    
    ----------------------------------------------------------------------------------------------------------*/
    
}
