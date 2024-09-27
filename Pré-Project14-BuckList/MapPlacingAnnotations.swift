//
//  MapPlacingAnnotations.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 26/09/24.
//

/*placing annotations.

To do this takes at least three steps depending on your goal: defining a new data type that contains your location, creating an array of those containing all your locations, then adding them as annotations in the map. Whatever new data type you create to store locations, it must conform to the Identifiable protocol so that SwiftUI can identify each map marker uniquely.*/

import MapKit
import SwiftUI

struct MapPlacingAnnotations: View {
    
    ///define an array of locations, wherever we want map annotations to appear
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        ///Step three is the important part: we can feed that array of locations into the Map view as its content. SwiftUI provides us with a couple of different content types, but a simple one is called Marker: a balloon with a title and latitude/longitude coordinate attached
    
        Map {
            ForEach(locations) { location in
                Marker(location.name, coordinate: location.coordinate)
            }
        }
        
        ///When that runs you’ll see two red balloons on the map, and even better you'll see the map adjusts its position and scale so the two markers are visible.
        
        ///If you want more control over the way your markers look on the map, use an Annotation instead. This lets you provide a completely custom view to use instead of the standard system marker balloon, and if you prefer you can hide the default title so you can replace it with your own, like this:
        
        Spacer()
        
        Map {
            ForEach(locations) { location in
                Annotation(location.name, coordinate: location.coordinate) {
                    Text(location.name)
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
                .annotationTitles(.hidden)
                
            }
        }
        
        Spacer()
        
        ///And finally, you can handle taps on the map using onTapGesture(). This tells us where on the map the user tapped, but it does so in screen coordinates – e.g., 50 points from the top, and 100 points from the left.
        
        ///In order to get an actual location on the map, we need a special view called MapReader. When you wrap one of these around your map, you'll be handed a special MapProxy object that is able to convert screen locations to map locations and back the other way.
        
        MapReader { proxy in
            
            Map()
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print(coordinate)
                    }
                }
        }
        ///Tip: The .local part means we're converting that position in the map's local coordinate space, meaning that the tap location we're working with is relative to the top-left corner of the map rather than the whole screen or some other coordinate space.
        
    }
}

///we might start with this kind of Location struct
struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

#Preview {
    MapPlacingAnnotations()
}
