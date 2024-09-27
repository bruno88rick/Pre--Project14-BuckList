//
//  Map3.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 26/09/24.
//

import MapKit
import SwiftUI

struct Map3: View {
    var body: some View {
        
        ///adjust how the user can work with your map, such as whether they can zoom or rotate their position. For example, we could make a map that always remains centered on a particular location, but users can still adjust the rotation and zoom:
        
        Map(interactionModes: [.rotate, .zoom])
        
        Map(interactionModes: [])
        
    }
}

#Preview {
    Map3()
}
