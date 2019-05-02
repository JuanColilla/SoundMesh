//
//  OratorViewController.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 05/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit

class OratorViewController: UIViewController {
    
    @IBOutlet weak var micImage: UIImageView!
    
    @IBAction func tapMicImage(_ sender: UITapGestureRecognizer) {
        // TAP GESTURE RECOGNIZER?
        // https://developer.apple.com/documentation/uikit/touches_presses_and_gestures/handling_uikit_gestures/handling_tap_gestures#overview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        micImage.image = UIImage(named: "Mic")
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func micImageTap(_ sender: UITapGestureRecognizer) {
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
