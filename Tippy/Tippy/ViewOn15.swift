//
//  ViewOn15.swift
//  Tippy
//
//  Created by Kyle Hoang on 1/21/24.
//

import SwiftUI
import AVFoundation

struct ViewOn15: View {
    @State private var audioPlayer: AVAudioPlayer!
    
    func playAudio() {
        guard let path = Bundle.main.path(forResource: "bad", ofType: "mp3") else {
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
            Text("You tipped 15%")
                .font(.title)
            Text("Literal dog water.")
        }
        .onAppear {
            playAudio()
        }
    }
}

#Preview {
    ViewOn15()
}
