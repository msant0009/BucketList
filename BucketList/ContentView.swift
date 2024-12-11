//
//  ContentView.swift
//  BucketList
//
//  Created by Mark Santoro on 12/11/24.
//

import MapKit
import SwiftUI

struct ContentView: View {

    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 36.113146, longitude: -115.176397),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    )
    var body: some View {
        
        MapReader { proxy in
            Map(initialPosition: startPosition)
                .onTapGesture {position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print("Tapped at \(coordinate)")
                        
                    }
                }
            
        }
        

        
    }
    
 
}
 
#Preview {
    ContentView()
}
