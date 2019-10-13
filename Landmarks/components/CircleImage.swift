//
//  CircleImage.swift
//  Landmarks
//
//  Created by awave on 2019-10-06.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image;
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(image: landmarkData[0].image)
    }
}
#endif
