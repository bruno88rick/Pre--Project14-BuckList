//
//  Map2.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 25/09/24.
//

import MapKit
import SwiftUI

struct Map2: View {
    var body: some View {
        Map()
            ///.mapStyle(.imagery) //Satellite map
            ///.mapStyle(.hybrid) // hybrid map
            .mapStyle(.hybrid(elevation: .realistic)) //both maps along with realistic elevation, creating a 3D map
    }
}

#Preview {
    Map2()
}
