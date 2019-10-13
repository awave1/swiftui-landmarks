//
//  ContentView.swift
//  Landmarks
//
//  Created by awave on 2019-10-02.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct LandmarkDetailsPage: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark

    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id }) ?? 0
    }

    var body: some View {
        VStack {
            MapView(landmark: landmark)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)

            CircleImage(image: landmark.image).offset(y: -130).padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)

                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        Favorite(isFavorite: self.userData.landmarks[self.landmarkIndex].isFavorite)
                    }
                }
                HStack {
                    Text(landmark.park).font(.subheadline)
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        LandmarkDetailsPage(landmark: landmarkData[0])
    }
}
#endif
