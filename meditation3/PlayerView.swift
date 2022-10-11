//
//  PlayerView.swift
//  meditation3
//
//  Created by Sean Hartigan on 10/11/22.
//

import SwiftUI

struct PlayerView: View {
    var meditationVM: MeditationViewModel
    @State private var value: Double = 0.0
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
           
            
            //Blur View
            
            Rectangle()
                .background(.thinMaterial)
                .opacity(0.25)
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            
            
            
            VStack(spacing: 32) {
                // Dismiss Button
                HStack {
                    Button{
                        dismiss()
                        
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size:36))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                
                // TITLE::
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                //Playback
                
                VStack(spacing: 5) {
                    //Playback Timeline
                    
                    Slider(value: $value, in: 0...60)
                        .accentColor(.white)
                    
                    HStack {
                        Text("0:00")
                        
                        Spacer()
                        
                        Text("1:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                }
                
                //Playback Control
                
                HStack {
                    //Repeat Button
                    
                    PlaybackControl(systemName: "repeat") {
                    }
                    Spacer()
                    
                    //back 10 seconds button
                    
                    PlaybackControl(systemName: "gobackward.10") {
                    }
                    
                    Spacer()
                    
                    PlaybackControl(systemName: "play.circle.fill", fontSize: 44) {
                    }
                    
                    Spacer()
                    
                    PlaybackControl(systemName: "goforward.10") {
                    }
                    
                    Spacer()
                    PlaybackControl(systemName: "stop.fill") {
                    }
                }
            }
            .padding(20)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    
    static var previews: some View {
        PlayerView(meditationVM: meditationVM)
    }
}
