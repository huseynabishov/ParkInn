//
//  DateValue.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 13.07.2022.
//

import SwiftUI

// Date Value Model...
struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
