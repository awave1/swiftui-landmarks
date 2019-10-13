//
//  Favorite.swift
//  Landmarks
//
//  Created by awave on 2019-10-12.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct Favorite: View {
    var isFavorite: Bool
    var body: some View {
        Image(systemName: "star\(self.isFavorite ? ".fill" : "")")
            .imageScale(.medium)
            .foregroundColor(self.isFavorite ? Color.yellow : Color.black)
    }
}

struct Favorite_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Favorite(isFavorite: true)
            Favorite(isFavorite: false)
        }
    }
}
