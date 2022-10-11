//
//  MeditationViewModel.swift
//  meditation3
//
//  Created by Sean Hartigan on 10/11/22.
//

import Foundation

final class MeditationViewModel: ObservableObject {
    private(set) var meditation: Meditation
    
    init(meditation: Meditation) {
        self.meditation = meditation
    }
}

struct Meditation {
    let id = UUID()
    let title: String
    let description: String
    let duration: TimeInterval
    let track: String
    let image: String
    
    static let data = Meditation(title: "One Minute Meditation", description: "Clear your mind and slumber into nothingness. Give yourself a quick break from everything.", duration: 70, track: "meditation1", image: "meditation_image1")
}
