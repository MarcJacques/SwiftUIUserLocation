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

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?
    
    func checkifLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Turn on location")
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Location is resctricted due to parental controls ")
        case .denied:
            print("Location information is denied.")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
