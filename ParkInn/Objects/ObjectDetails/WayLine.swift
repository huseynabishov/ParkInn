//
//  WayLine.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.07.2022.
//

import SwiftUI

struct WayLine: View {
    var body: some View {
        VStack(spacing: 23){
            Image(systemName: "arrow.down")
                .font(.system(size: 30))
                .foregroundColor(Color.gray.opacity(0.6))
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
            HStack(spacing: 0){
                Divider()
                    .frame(height: 37)
                    .frame(width: 2)
                    .background(Color.gray.opacity(0.3))
            }
        }
    }
}

struct WayLine_Previews: PreviewProvider {
    static var previews: some View {
        PickParkingSpot()
    }
}
