//
//  SpotScheme.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 23.07.2022.
//

import SwiftUI

struct SpotScheme: View {
    
    var body: some View {
        
        VStack(spacing: 0){
            Divider()
                .frame(width: 260)
                .frame(height: 2)
                .background(Color.gray.opacity(0.3))
            ZStack{
                HStack{
                    Divider()
                        .frame(height: 210)
                        .frame(width: 2)
                        .background(Color.gray.opacity(0.3))
                }
                
                ZStack{
                    VStack(spacing: 62){
                        Divider()
                            .frame(width: 260)
                            .frame(height: 2)
                            .background(Color.gray.opacity(0.3))
                        Divider()
                            .frame(width: 260)
                            .frame(height: 2)
                            .background(Color.gray.opacity(0.3))
                    }
                }
            }
            Divider()
                .frame(width: 260)
                .frame(height: 2)
                .background(Color.gray.opacity(0.3))
        }
    }
}

struct SpotScheme_Previews: PreviewProvider {
    static var previews: some View {
        SpotScheme()
    }
}
