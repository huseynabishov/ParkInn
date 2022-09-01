//
//  CardDataModel.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 31.07.2022.
//

import Foundation

struct CardModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String

    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
    }
}
