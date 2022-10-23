//
//  LocationNameButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.06.2022.
//

import SwiftUI

struct LocationNameButton: View {
    
    let title: String
    let action: () -> Void
    let styles : [(description: String, style: UIBlurEffect.Style)] = [
        (description: "ultra thin", style: .systemUltraThinMaterial),
        (description: "thin", style: .systemThinMaterial),
        (description: "normal", style: .systemMaterial),
        (description: "thick", style: .systemThickMaterial),
        (description: "chrome", style: .systemChromeMaterial)
    ]
    
    @State var styleIndex = 2
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: action) {
            HStack{
                ZStack{
                    Image(systemName: "drop.fill")
                        .foregroundColor(Color("AccentColor"))
                        .rotationEffect(.degrees(180))
                        .font(.system(size: 17))
                        .background(Blur(style: .systemUltraThinMaterial).opacity(1))
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundColor(colorScheme == .light ? .white : .black)
                        .padding(.bottom, 4)
                }
                Text(title)
                    .foregroundColor(Color("AccentColor"))
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                    .fixedSize(horizontal: true, vertical: false)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color("AccentColor"), lineWidth:2))
            .background(Blur(style: .systemUltraThinMaterial).opacity(1)
                .foregroundColor(colorScheme == .light ? Color("AccentColor") : .black))
            .cornerRadius(30)
        }
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct LocationNameButton_Previews: PreviewProvider {
    static var previews: some View {
        LocationNameButton(title: "Home", action: {})
    }
}
