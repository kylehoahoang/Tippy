//
//  ContentView.swift
//  Tippy
//
//  Created by Kyle Hoang on 1/21/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    
    func playAudio() {
        guard let path = Bundle.main.path(forResource: "waiting", ofType: "mp3") else {
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
        NavigationView {
            VStack {
//                HStack {
//                    Text("Add a tip?!")
//                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//                        .fontWeight(.heavy)
//                        .padding(.trailing, 50.0)
//                    Image("childe")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(height: nil)
//                        .scaledToFit()
//                }
//                .padding(.top)
                
                
                Grid {
                    GridRow {
                        NavigationLink (destination: ViewOn15()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .overlay(
                                    Text("15%\nbruh 💩")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                )
                        }
                        .frame(height: 200.0)
                        NavigationLink (destination: ViewOn20()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .overlay(
                                    Text("20%\nokay🙄")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.white)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                )
                        }
                        NavigationLink (destination: ViewOn25()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .overlay(
                                    Text("25%\nyas🙂")
                                        .fontWeight(.black)
                                        .foregroundColor(.white)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                )
                        }
                    }
                    
                    GridRow {
                        NavigationLink (destination: ViewOnCustom()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .overlay(
                                    Text("custom tip 😏")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                )
                        }
                        .gridCellColumns(3)
                    }
                    
                    GridRow {
                        NavigationLink (destination: ViewOnNo()) {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                                .overlay(
                                    Text("no tip lol")
                                        .foregroundColor(.white)
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                )
                        }
                        .gridCellColumns(3)
                    }
                }
                .padding([.top, .bottom, .trailing])
                .frame(width: 700.0, height: 250)
                
            }
            .onAppear {
                playAudio()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


#Preview {
    ContentView()
}
