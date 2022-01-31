//
//  ContentView.swift
//  SwiftUIUserLocation
//
//  Created by Marc Jacques on 1/30/22.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @State private var region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 40.758896, longitude: -73.985130), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
       Map(coordinateRegion: $region)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
