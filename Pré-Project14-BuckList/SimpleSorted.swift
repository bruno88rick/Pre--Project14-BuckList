//
//  SimpleSorted.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 24/09/24.
//

/*Swift does really well is extend functionality into lots of places using protocols and protocol extensions. For example, we know that 4 < 5 is true because we’re able to compare two integers and decide whether the first one comes before or after the second. Swift extends that functionality to arrays of integers: we can compare all the integers in an array to decide whether each one should come before or after the others. Swift then uses that result to sort the array
 
 So, in Swift we expect this kind of code to Just Work:
 */

import SwiftUI

struct SimpleSorted: View {
    let values = [1, 5 ,3, 6, 2, 9].sorted()
    
    var body: some View {
        List(values, id: \.self) {
            Text(String($0))
        }
        .padding()
    }
}

//We don’t need to tell sorted() how it should work, because it understands how arrays of integers work

#Preview {
    ContentView()
}
