//
//  GroupList.swift
//  Landmarks
//
//  Created by awave on 2019-10-13.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct GroupList: View {
    @EnvironmentObject var userData: UserData
    @Environment(\.editMode) var mode
    @State var groupName: String = ""
    @State var isEditing: Bool = false
    var group: Group

    var groupIndex: Int {
        userData.groups.firstIndex(where: { $0.id == group.id }) ?? 0
    }

    var body: some View {
        List {
            if (self.isEditing) {
                TextField("Group name", text: $groupName)
                ForEach(userData.landmarks.filter { !self.userData.groups[self.groupIndex].landmarks.contains($0) }) { newLandmark in
                    MultipleSelectionRow(landmark: newLandmark)
                }
            }

            ForEach(userData.groups[groupIndex].landmarks) { landmark in
                NavigationLink(destination: LandmarkDetailsPage(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }.onDelete(perform: { pos in
                self.userData.groups[self.groupIndex].landmarks.remove(atOffsets: pos)
                })

        }
        .navigationBarTitle(Text(groupName.isEmpty ? group.name : groupName))
        .navigationBarItems(trailing: Button(action: { self.edit() }) {
                if self.isEditing {
                    Text("Done").bold()
                } else {
                    Text("Edit")
                }
            }
        )
    }

    func edit() {
        self.isEditing.toggle()

        if !self.isEditing {
            self.userData.groups[groupIndex].name = groupName

            self.userData.selectedLandmarks.forEach {
                if !self.userData.groups[groupIndex].landmarks.contains($0) {
                    self.userData.groups[groupIndex].landmarks.append($0)
                }
            }
        } else {
            groupName = self.userData.groups[groupIndex].name
        }
    }

}

struct GroupList_Previews: PreviewProvider {
    static var previews: some View {
        GroupList(group: groupData[0])
    }
}
