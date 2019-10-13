//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by awave on 2019-10-06.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: CGFloat(50), height: CGFloat(50))
            Text(landmark.name)

            Spacer()

            if landmark.isFavorite {
                Favorite(isFavorite: true)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarkData[0])
    }
}
