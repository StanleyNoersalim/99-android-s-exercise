import SwiftUI
 
struct PropertyDetailView: View {
    @StateObject private var viewModel = PropertyDetailViewModel()
    let propertyId: Int
 
    var body: some View {
        ScrollView {
            if let property = viewModel.propertyDetail {
                VStack(alignment: .leading, spacing: 16) {
                    AsyncImage(url: URL(string: property.photo)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
 
                    Text(property.projectName)
                        .font(.largeTitle)
                        .bold()
                   
                    Text("\(property.address.title) - \(property.address.subtitle)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                   
                    Text(property.description)
                        .font(.body)
                        .padding(.top, 8)
                   
                    HStack {
                        Text("\(property.attributes.bedrooms) Bed")
                        Text("• \(property.attributes.bathrooms) Bath")
                        Text("• $\(property.attributes.price)")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                   
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Property Details")
                            .font(.headline)
                            .padding(.top, 16)
                       
                        ForEach(property.propertyDetails) { detail in
                            HStack {
                                Text("\(detail.label):")
                                    .bold()
                                Text(detail.text)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .padding()
            } else {
                ProgressView("Loading...")
                    .task {
                        await viewModel.fetchPropertyDetail(for: propertyId)
                    }
            }
        }
        .navigationTitle("Property Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

