//
//  App.swift
//  Landmarks
//
//  Created by awave on 2019-10-12.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct App: View {
    var body: some View {
        TabView {
            LandmarksPage().tabItem {
                Image(systemName: "house.fill")
                Text("Landmarks")
            }.tag(0)

            GroupsPage().transition(.opacity).tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Groups")
            }.tag(1)
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        App()
    }
}
