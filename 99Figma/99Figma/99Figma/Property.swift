//
//  _9FigmaApp.swift
//  99Figma
//
//  Created by prk on 03/11/24.
//

import Foundation
 
struct Address: Codable {
    let district: String
    let streetName: String
 
    enum CodingKeys: String, CodingKey {
        case district
        case streetName = "street_name"
    }
}
 
struct Attributes: Codable {
    let areaSize: Int
    let bathrooms: Int
    let bedrooms: Int
    let price: Int
 
    enum CodingKeys: String, CodingKey {
        case areaSize = "area_size"
        case bathrooms
        case bedrooms
        case price
    }
}
 
struct Property: Identifiable, Codable {
    let id: Int
    let projectName: String
    let category: String
    let photo: String
    let address: Address
    let attributes: Attributes
 
    enum CodingKeys: String, CodingKey {
        case id
        case projectName = "project_name"
        case category
        case photo
        case address
        case attributes
    }
}
 
struct MapCoordinates: Codable {
    let lat: Double
    let lng: Double
}
 
struct AddressDetail: Codable {
    let mapCoordinates: MapCoordinates
    let subtitle: String
    let title: String
 
    enum CodingKeys: String, CodingKey {
        case mapCoordinates = "map_coordinates"
        case subtitle
        case title
    }
}
 
struct PropertyDetail: Codable, Identifiable {
    var id: String { label }
    let label: String
    let text: String
}
 
struct DetailedProperty: Identifiable, Codable {
    let id: Int
    let projectName: String
    let photo: String
    let address: AddressDetail
    let attributes: Attributes
    let description: String
    let propertyDetails: [PropertyDetail]
 
    enum CodingKeys: String, CodingKey {
        case id
        case projectName = "project_name"
        case photo
        case address
        case attributes
        case description
        case propertyDetails = "property_details"
    }
}
