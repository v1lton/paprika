//
//  HomeView.swift
//  paprika
//
//  Created by Wilton Ramos on 17/07/21.
//

import SwiftUI

struct HomeView: View {
    @State var isActive = false
    
    enum Screen: Hashable {
        case recipe, steps
    }
    var body: some View {
        NavigationView {
            SideBarView()
            RootView()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

