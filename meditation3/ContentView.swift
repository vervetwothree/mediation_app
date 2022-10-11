//
//  ContentView.swift
//  meditation3
//
//  Created by Sean Hartigan on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        meditationView3(meditationVM: MeditationViewModel(meditation: Meditation.data))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
