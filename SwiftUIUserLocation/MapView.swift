//
//  ContentView.swift
//  SwiftUIUserLocation
//
//  Created by Marc Jacques on 1/30/22.
//

import SwiftUI
import MapKit



struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    
    @State private var region = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: 40.758896, longitude: -73.985130), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true)
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

final class MapViewModel: ObservableObject {

    var locationManager: CLLocationManager?
    
    func checkifLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Turn on location")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            <#code#>
        case .restricted:
            <#code#>
        case .denied:
            <#code#>
        case .authorizedAlways:
            <#code#>
        case .authorizedWhenInUse:
            <#code#>
        @unknown default:
            <#code#>
        }
    }
}