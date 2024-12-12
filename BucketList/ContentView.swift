//
//  ContentView.swift
//  BucketList
//
//  Created by Mark Santoro on 12/11/24.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @State private var locations = [Location]()
    @State private var selectedPlace: Location?

    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 36.113146, longitude: -115.176397),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    var body: some View {
        
        MapReader { proxy in
            Map(initialPosition: startPosition){
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate){
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundStyle(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(.circle)
                            .onLongPressGesture {
                                selectedPlace = location
                            }
                    }
                }
            }
            
                .onTapGesture {position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
                        locations.append(newLocation)
                        
                    }
                }
                .sheet(item: $selectedPlace) { place in
                    Text(place.name)
                }
            
        }
        
       

    }
    
 
}
 
#Preview {
    ContentView()
}
