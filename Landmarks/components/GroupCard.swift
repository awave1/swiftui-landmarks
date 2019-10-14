//
//  GroupCard.swift
//  Landmarks
//
//  Created by awave on 2019-10-13.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct GroupCard: View {
    var group: Group
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black)
                .cornerRadius(20)
                .frame(minWidth: 50, maxWidth: .infinity, minHeight: 155, maxHeight: 155)

            Text(group.name).foregroundColor(.white).bold()
        }.shadow(radius: 15).padding()
    }
}


struct GroupCard_Previews: PreviewProvider {
    static var previews: some View {
        GroupCard(group: groupData[0])
    }
}
