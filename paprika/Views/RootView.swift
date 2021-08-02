//
//  HomeView.swift
//  paprika
//
//  Created by Wilton Ramos on 17/07/21.
//

import SwiftUI

struct RootView: View {
   
    var body: some View {
        NavigationView {
            SideBarView()
            HomeView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

