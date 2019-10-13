//
//  LandmarkList.swift
//  Landmarks
//
//  Created by awave on 2019-10-06.

import SwiftUI


struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    @State var searchString = ""


    var body: some View {
        NavigationView {
            List {
                TextField ("Search", text: $searchString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(
                    searchString.isEmpty
                        ? userData.landmarks
                        : userData.landmarks.filter { searchFor(landmark: $0) }
                ) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }.navigationBarTitle(Text("Landmarks"))
        }
    }

    func searchFor(landmark: Landmark) -> Bool {
        let name = landmark.name.lowercased()
        let state = landmark.state.lowercased()
        let search = self.searchString.lowercased()

        return name.contains(search) || state.contains(search)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone XS Max", "iPhone SE"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
