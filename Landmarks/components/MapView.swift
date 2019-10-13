//
//  MapView.swift
//  Landmarks
//
//  Created by awave on 2019-10-06.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  typealias UIViewType = MKMapView
  var coordinate: CLLocationCoordinate2D

  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    let span = MKCoordinateSpan(latitudeDelta: 2.00, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: coordinate, span: span)
    uiView.setRegion(region, animated: true)
  }

  func makeUIView(context: UIViewRepresentableContext<MapView>) -> MapView.UIViewType {
    MKMapView(frame: .zero)
  }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
      MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
