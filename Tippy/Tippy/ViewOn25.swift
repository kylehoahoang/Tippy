//
//  ViewOn25.swift
//  Tippy
//
//  Created by Kyle Hoang on 1/21/24.
//

import SwiftUI
import AVFoundation

struct ViewOn25: View {
    @State private var audioPlayer: AVAudioPlayer!
    
    func playAudio() {
        guard let path = Bundle.main.path(forResource: "slay", ofType: "mp3") else {
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
            Text("You tipped 25%")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Want to see my pepperonis?")
        }
        .onAppear {
            playAudio()
        }
    }
}

#Preview {
    ViewOn25()
}
