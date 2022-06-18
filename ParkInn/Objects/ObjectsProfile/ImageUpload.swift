//
//  ImageUpload.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI

struct ImageUpload: View {
    
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            Button(action: {
                
                changeProfileImage = true
                openCameraRoll = true
                
            } , label: {
                if changeProfileImage {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .foregroundColor(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                        
                }
            })
            Button(action: {
                
                changeProfileImage = true
                openCameraRoll = true
                
            } , label: {
                if changeProfileImage {
                Image(systemName: "plus")
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.white)
                    .background(Color("AccentColor"))
                    .cornerRadius(11)
                } else {
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color("AccentColor"))
                        .cornerRadius(11)
                }
            })
            
        }.sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
        }
    }
}

struct ImageUpload_Previews: PreviewProvider {
    static var previews: some View {
        ImageUpload()
    }
}
