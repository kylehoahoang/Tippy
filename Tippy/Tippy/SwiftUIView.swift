//
//  SwiftUIView.swift
//  Tippy
//
//  Created by Kyle Hoang on 1/21/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var isLandscape = true;
    var body: some View {
        Group {
            if isLandscape {
                LandscapeView()
            }
            else {
                PortraitView()
            }
        }
        .onAppear {
            self.isLandscape = UIDevice.current.orientation.isLandscape
        }
        .onRotate { newOrientation in
            self.isLandscape = newOrientation.isLandscape
        }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(RotateModifier(action: action))
    }
}

struct RotateModifier: ViewModifier {
    var action: (UIDeviceOrientation) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main) { _ in
                    let orientation = UIDevice.current.orientation
                    self.action(orientation)
                }
            }
    }
}

struct PortraitView: View {
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("ADD A TIP??!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.heavy)
                        .padding([.leading, .bottom], 7.0)
                    Image("childe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom, 7.0)
                        .frame(height: nil)
                        .scaledToFit()
                }
                
                
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
                    .frame(height: 260.0)
                    
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
                .padding([.leading, .bottom, .trailing])
                .frame(width: 435.0, height: 500)
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LandscapeView: View {
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
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    SwiftUIView()
}
