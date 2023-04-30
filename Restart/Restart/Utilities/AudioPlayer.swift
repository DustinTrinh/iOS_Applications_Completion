//
//  AudioPlayer.swift
//  Restart
//
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    guard let path = Bundle.main.path(forResource: sound, ofType: type) else {
        return
    }
    
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
    } catch {
        print("Could not play the sound file.")
    }
}
