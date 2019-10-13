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
    var landmark: Landmark


  func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    let span = MKCoordinateSpan(latitudeDelta: 2.00, longitudeDelta: 2.0)
    let region = MKCoordinateRegion(center: landmark.locationCoordinate, span: span)
    uiView.setRegion(region, animated: true)

    uiView.addAnnotation(LandmarkAnnotation(landmark: landmark))
  }

  func makeUIView(context: UIViewRepresentableContext<MapView>) -> MapView.UIViewType {
    MKMapView(frame: .zero)
  }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
      MapView(landmark: landmarkData[0])
    }
}

final class LandmarkAnnotation: NSObject, MKAnnotation {
    let id: Int
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D


    init(landmark: Landmark) {
        self.id = landmark.id
        self.title = landmark.name
        self.subtitle = "\(landmark.park), \(landmark.state)"
        self.coordinate = landmark.locationCoordinate
    }
}
