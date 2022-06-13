//
//  Arrow.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 12.06.2022.
//

import SwiftUI
import NavigationStack

struct Arrow: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack

    let title: String
    let action: () -> Void
    var iconPath: String?
    var iconBGColorOpacity: Double = 1
    
    var body: some View {
        Button(action: action) {
        Image(systemName: "arrow.left")
            .font(.system(size: 30))
            .foregroundColor(.primary)
        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        Arrow(title: "arrow.left", action: {})
    }
}
