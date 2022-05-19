//
//  LocationsDataService.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 19.05.2022.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
    Location(
        name: "Globus Center Underground Parking",
        cityName: "Baku",
        coordinates: CLLocationCoordinate2D(latitude: 40.3852302, longitude: 49.8280174),
        description: "Globus Center Underground Parking offers the safety, security, and convenience of a 24-hour, fully-automated parking system by Globus Center so your vehicle is ready when you are. And with retrieval times within two minutes, you’ll be on your way in no time.",
        imageNames: [
            "GlobusCenter1",
            "GlobusCenter2",
            "GlobusCenter3",
        ],
        link: "http://globuscenter.az/welcome/"),
    Location(
        name: "Parking under Freedom Square",
        cityName: "Baku",
        coordinates: CLLocationCoordinate2D(latitude: 40.3741495, longitude: 49.8546365),
        description: "Outsourcing your parking needs to a trusted and reputable company like Parking under Freedom Square means that we take care of each and every detail so that you can focus on the bigger picture. We don’t just notice details, we embrace them. The result? An unparalleled experience for you and your guests.",
        imageNames: [
            "FreedomSquare1",
            "FreedomSquare2",
        ],
        link: "    "
        ),
    ]
}
