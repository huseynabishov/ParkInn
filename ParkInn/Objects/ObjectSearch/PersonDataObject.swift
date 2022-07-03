//
//  PersonDataObject.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 29.06.2022.
//

import Foundation

struct PersonDataObject:Identifiable{
   let id=UUID()
   var name=""
   var phone=""
   var email=""
}
extension PersonDataObject{
    
func mock()->PersonDataObject{
       PersonDataObject(name:"Joe Mock Data",phone:"(617)555-8798",email:"joe@mockdata.com")
   }
}
