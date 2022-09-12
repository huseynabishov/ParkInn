//
//  BookParkingDetailsModel.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 12.09.2022.
//

import Foundation

class BookParkingDetailsModel: ObservableObject {
    @Published var selectedDate: Date = Date()
    @Published var selecetedDuration: Int = 1
    @Published var selectedStartHour: Date = Date()
    @Published var selectedEndHour:  Date = Date()
    @Published var calculatedTotal: Int = 8
    
    
}
