//
//  meditationView3.swift
//  meditation3
//
//  Created by Sean Hartigan on 10/11/22.
//

import SwiftUI

struct meditationView3: View {
    @StateObject var meditationVM: MeditationViewModel
    @State private var showPlayer = false
    
    var body: some View {
        VStack{
            //IMAGE:
            
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(height: UIScreen.main.bounds.height / 3)
            
            //MEDITATION DETAILS:
            
            ZStack {
                //BACKGROUND:
                
                Color(red: 24/255, green: 23/255, blue: 22/255)
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 8 ) {
                        Text("Music")
                        
                        Text(DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "S")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    Text(meditationVM.meditation.title)
                        .font(.title)
                    
                    //Play Button::
                    
                    Button {
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                    //Description::
                    
                    Text(meditationVM.meditation.description)
                    Spacer()
                    
                }
                .foregroundColor(.white)
                .padding(20)
            }
            .frame(height: UIScreen.main.bounds.height * 2 / 3)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showPlayer) {
            PlayerView(meditationVM: meditationVM)
        }
    }
}

struct meditationView3_Previews: PreviewProvider {
    static let meditationVM = MeditationViewModel(meditation: Meditation.data)
    static var previews: some View {
        meditationView3(meditationVM: meditationVM)
    }
}
