//
//  MediaManager.swift
//  Sound Mesh
//
//  Created by Juan Colilla on 27/04/2019.
//  Copyright © 2019 Juan Colilla. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer

class MediaManager {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    var accessToLibraryAuthorized = false
    var query = MPMediaQuery()
    
    init() {
    }
    
    func requestLibraryAccess() -> Bool {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.accessToLibraryAuthorized = true
            } else {
                self.accessToLibraryAuthorized = false
            }
        }
        return self.accessToLibraryAuthorized
    }
    
    func preparePlayer() {
        let predicate = MPMediaPropertyPredicate(value: "Rock", forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.prepareToPlay()
    }
    
    func playSong(){
        musicPlayer.play()
    }
    
    func getTitle() -> String {
        return musicPlayer.nowPlayingItem?.title ?? "Unavailable"
    }
    
    func setSongReceived(song: String) {
        let predicate = MPMediaPropertyPredicate(value: song, forProperty: MPMediaItemPropertyTitle)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.prepareToPlay()
    }
    
    func getCover(size: CGSize) -> UIImage {
        return musicPlayer.nowPlayingItem?.artwork?.image(at: size) ?? UIImage(named: "Cover")!
    }
    
    
    func pause(){
        musicPlayer.pause()
    }

    
    func nextSong(){
        musicPlayer.skipToNextItem()
    }
    
    func previousSong(){
        musicPlayer.skipToPreviousItem()
    }
    
    func getSongURL() -> URL? {
        return musicPlayer.nowPlayingItem?.assetURL
    }
}
