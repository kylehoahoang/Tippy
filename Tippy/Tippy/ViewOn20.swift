//
//  ViewOn20.swift
//  Tippy
//
//  Created by Kyle Hoang on 1/21/24.
//

import SwiftUI
import AVFoundation

struct ViewOn20: View {
    @State private var audioPlayer: AVAudioPlayer!
    
    func playAudio() {
        guard let path = Bundle.main.path(forResource: "mid", ofType: "mp3") else {
            print("Audio file not found")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
    
    var body: some View {
        VStack {
            Text("You tipped 20%")
                .font(.title)
            Text("You are very average.")
        }
        .onAppear {
            playAudio()
        }
    }
}

#Preview {
    ViewOn20()
}
