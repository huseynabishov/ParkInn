//
//  SearchSampleData.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 29.06.2022.
//

import Foundation

class SearchSampleData{
    public static let shared=SearchSampleData()
    func getData()->[PersonDataObject]{
        return[
            
            PersonDataObject(name:"Mark Moeykens",phone:"+1(801)555-1212",email:"mark@moeykens.com"),
            PersonDataObject(name:"Chris Ching",phone:"+1(416)363-5983",email:"chris@ching.com"),
            PersonDataObject(name:"Sean Allen",phone:"+1(814)453-7827",email:"sean@allen.com"),
            PersonDataObject(name:"Paul Hudson",phone:"+44 121 553 5974",email:"paul@twostraws.com"),
            PersonDataObject(name:"Kavsoft",phone:"+91 96195 04752",email:"balaji@kavsoft.com"),
            PersonDataObject(name:"Scott Smith",phone:"+1(801)355-3037",email:"scott@smith.com"),
            PersonDataObject(name:"Meng To",phone:"+1(450)512-1297",email:"meng@designcode.io"),
            PersonDataObject(name:"Nick Sarno",phone:"+1(801)555-9999",email:"nick@sarno.com"),
            PersonDataObject(name:"Mohammad Azam",phone:"+1(512)912-9188",email:"mohammad@azam.com"),
            PersonDataObject(name:"Jordan Morgan",phone:"+1(417)581-8870",email:"jordan@morgan.com"),
            PersonDataObject(name:"Jared Davidson",phone:"+1(385)685-7000",email:"jared@davidson.com")
        ]
    }
}
