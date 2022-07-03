//
//  PersonRowView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 29.06.2022.
//

import SwiftUI

struct PersonRowView: View {
    var body: some View {
        ZStack{
        Rectangle()
                .foregroundColor(Color.gray)
                .cornerRadius(80)
                .opacity(0.5)
            .frame(width: .infinity, height: 70, alignment: .center)
        }
    }
}

struct PersonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PersonRowView()
    }
}
