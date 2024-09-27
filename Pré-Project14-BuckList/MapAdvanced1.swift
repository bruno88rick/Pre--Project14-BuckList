//
//  MapAdvanced1.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 26/09/24.
//

/*controlling the position, placing annotations, and handling taps.
 
 First, you can customize the position of the camera. This can be done as an initial position, where you're setting how the map should start, or as a binding to its current position, which tracks its position over time.

 For example, we could create a constant property storing the location of London, with a span specified as 1 degree by 1 degree*/

import MapKit
import SwiftUI

struct MapAdvanced1: View {
    
    let position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var body: some View {
        
        Map(initialPosition: position)
        
    }
    
    ///That value is only an initial position. If you want to change the position over time you'll need to mark it as @State then pass it in as a binding. SEE MAPADVANCED 2
}

#Preview {
    MapAdvanced1()
}
