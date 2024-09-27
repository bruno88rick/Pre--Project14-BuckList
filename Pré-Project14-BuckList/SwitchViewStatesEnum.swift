//
//  SwitchViewStatesEnum.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 24/09/24.
//

/*Where conditional views are particularly useful is when we want to show one of several different states, and if we plan it correctly we can keep our view code small and also easy to maintain – it’s a great way to start training your brain to think about SwiftUI architecture.
 
 There are two parts to this solution. The first is to define an enum for the various view states you want to represent. For example, you might define this as a nested enum:*/

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct SwitchViewStatesEnum: View {
    
    //With those two parts in place, we now effectively use SwitchViewStatesEnum or Content View as a simple wrapper that tracks the current app state and shows the relevant child view. That means giving it a property to store the current LoadingState value:
    
    @State private var loadingState = LoadingState.loading
    
    var body: some View {
        switch loadingState {
        case .loading: LoadingView()
        case .success: SuccessView()
        case .failed: FailedView()
        }
    }
}

#Preview {
    SwitchViewStatesEnum()
}
