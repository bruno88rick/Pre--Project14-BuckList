//
//  MapAdvanced2.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 26/09/24.
//

import MapKit
import SwiftUI

struct MapAdvanced2: View {
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    ///Now that's it's stored as program state, we can change it by adding some buttons to jump to other locations. For example, we could wrap the map in a VStack, then place this below it:
    
    var body: some View {
        
        ///Although we're now passing a binding to the map, we can't just read the location as the map moves around. Instead, we have a separate onMapCameraChange() modifier that tells us when the position changes, either immediately or once movement has ended
        
        VStack(spacing: 16) {
            Map(position: $position)
                .onMapCameraChange { context in
                    print(context.region)
                }
            
            Spacer()
            
            //Alternatively, you can have it post continuous updates like this
            
            Map(position: $position)
                .onMapCameraChange(frequency: .continuous) { context in
                    print(context.region)
                }
            ///You might think continuous mode is always preferable, but it's not that simple – if you're running a search on where the user has positioned the map, that's the kind of thing you'd want to do only when they have finished moving
        }
        .padding()
        
        HStack (spacing: 50) {
            Button("Paris") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }
            
            Button("Tokyo") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }
            
        }
        
    }
}

#Preview {
    MapAdvanced2()
}
