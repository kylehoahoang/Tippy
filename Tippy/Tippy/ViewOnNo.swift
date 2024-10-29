//
//  ViewOnNo.swift
//  Tippy
//
//  Created by Kyle Hoang on 1/21/24.
//

import SwiftUI
import AVKit

struct ViewOnNo: View {
    var body: some View {
        if let videoURL = Bundle.main.url(forResource: "jumpscare", withExtension: "mp4") {
            VideoPlayerView(videoURL: videoURL)
                .frame(width: 940,height: 700)
        }
        else {
            Text("Video not found")
        }
    }
}

#Preview {
    ViewOnNo()
}
