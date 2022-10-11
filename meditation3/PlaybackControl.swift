//
//  PlaybackControl.swift
//  meditation3
//
//  Created by Sean Hartigan on 10/11/22.
//

import SwiftUI

struct PlaybackControl: View {
    var systemName: String = "play"
    var fontSize: CGFloat = 24
    var color: Color = .white
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontSize))
                .foregroundColor(color)
        }
    }
}

struct PlaybackControl_Previews: PreviewProvider {
    static var previews: some View {
        PlaybackControl(action: {})
            .preferredColorScheme(.dark)
    }
}


