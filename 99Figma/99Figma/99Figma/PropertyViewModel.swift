//
//  PropertyViewModel.swift
//  99Figma
//
//  Created by prk on 03/11/24.
//

//
//  PropertyViewModel.swift
//  figmaproject
//
//  Created by prk on 03/11/24.
//


import SwiftUI
 
@MainActor
class PropertyViewModel: ObservableObject {
    @Published var properties: [Property] = []
 
    func fetchProperties() async {
        guard let url = URL(string: "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app/listings.json") else {
            print("Invalid URL")
            return
        }
 
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedProperties = try JSONDecoder().decode([Property].self, from: data)
            properties = decodedProperties
        } catch {
            print("Failed to fetch properties:", error)
        }
    }
}

