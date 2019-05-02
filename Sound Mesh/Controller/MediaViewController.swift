//
//  MediaViewController.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 08/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import UIKit

class MediaViewController: UIViewController {
    
    /*var covers = [UIImage(named: "CDCover1"), UIImage(named: "CDCover2")!, UIImage(named: "CDCoverd3"), UIImage(named: "CDCover4"), UIImage(named: "CDCover5")]*/
    
    
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var mediaStatusButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressPlayButton(_ sender: UITapGestureRecognizer) {
        if mediaStatusButton.image == UIImage(named: "play") {
            mediaStatusButton.image = UIImage(named: "pause")
        } else {
            mediaStatusButton.image = UIImage(named: "play")
        }
    }
    
    @IBAction func pressPreviousButton(_ sender: UITapGestureRecognizer) {
        print("previous song")
    }
    
    @IBAction func pressNextButton(_ sender: UITapGestureRecognizer) {
        print("next song")
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
