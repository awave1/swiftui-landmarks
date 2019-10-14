//
//  GroupRow.swift
//  Landmarks
//
//  Created by awave on 2019-10-13.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct GroupRow: View {
    var group: Group
    var body: some View {
        HStack {
            Text(group.name)

            Spacer()
        }
    }
}

struct GroupRow_Previews: PreviewProvider {
    static var previews: some View {
        GroupRow(group: groupData[0])
    }
}
