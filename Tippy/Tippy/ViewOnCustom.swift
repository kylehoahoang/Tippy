//
//  ViewOnCustom.swift
//  Tippy
//
//  Created by Kyle Hoang on 1/21/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        playerViewController.showsPlaybackControls = false
        player.play()
        
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Implement any updates if needed
    }
}

struct ViewOnCustom: View {
    var body: some View {
        VStack {
            Text("Custom Tip")
                .font(.title)
            Text("Don't be shy.")
            if let videoURL = Bundle.main.url(forResource: "whistle", withExtension: "mp4") {
                VideoPlayerView(videoURL: videoURL)
                    .frame(width: 530 , height: 300)
            }
            else {
                Text("Video not found")
            }
        }
    }
}

#Preview {
    ViewOnCustom()
}
