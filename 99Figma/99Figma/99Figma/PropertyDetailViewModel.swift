//
//  PropertyDetailVewModel.swift
//  figmaproject
//
//  Created by prk on 03/11/24.
//

import SwiftUI
 
@MainActor
class PropertyDetailViewModel: ObservableObject {
    @Published var propertyDetail: DetailedProperty?
 
    func fetchPropertyDetail(for id: Int) async {
        guard let url = URL(string: "https://ninetyninedotco-b7299.asia-southeast1.firebasedatabase.app/details/\(id).json") else {
            print("Invalid URL")
            return
        }
 
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedProperty = try JSONDecoder().decode(DetailedProperty.self, from: data)
            propertyDetail = decodedProperty
        } catch {
            print("Failed to fetch property detail:", error)
        }
    }
}
