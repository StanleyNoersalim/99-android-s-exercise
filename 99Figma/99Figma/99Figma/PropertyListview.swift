//
//  PropertyListview.swift
//  99Figma
//
//  Created by prk on 03/11/24.
//
import SwiftUI
 
struct PropertyListView: View {
    @StateObject private var viewModel = PropertyViewModel()
 
    var body: some View {
        NavigationView {
            List(viewModel.properties) { property in
                NavigationLink(destination: PropertyDetailView(propertyId: property.id)) {
                    PropertyRowView(property: property)
                }
            }
            .navigationTitle("Properties")
            .onAppear {
                Task {
                    await viewModel.fetchProperties()
                }
            }
        }
    }
}
 
struct PropertyRowView: View {
    let property: Property
 
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: property.photo)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            
 
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading,spacing: 4) {
            Text(property.projectName)
                    .bold()              .font(.title3)
                    .lineLimit(nil)
                    
                Text("\(property.address.streetName), \(property.address.district)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .padding(.bottom,19)
                HStack {
                    Text("\(property.attributes.bedrooms)Bed • \(property.attributes.bathrooms) Bath •")
                    Text("$\(property.attributes.price)")
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                
            }
        }
        .padding(.vertical,8)
        
    }
}
