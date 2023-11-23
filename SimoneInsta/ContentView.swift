//
//  ContentView.swift
//  SimoneInsta
//
//  Created by Simone Mercolino on 14/11/23.
//

    
    
/*
struct CustomAnnotationButton: View {
    let imageName: String
    let locationName: String
    @Binding var showModal: Bool

    var body: some View {
        Button(action: {
            showModal = true
            // Pass location information to the modal view if needed
        }) {
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 70)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
                
                // Add any additional content or styling here if needed
            }
        }
        .accessibilityLabel(locationName)
    }
}
*/
import SwiftUI
import MapKit

struct TestingLocation: Identifiable {
    var id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct ContentView: View {
    @State var selectedLocation: TestingLocation? = nil
    @State private var showModal = false // State variable to control the modal presentation
    @State var presentSheet = false
    @State private var searchText = ""
    @State private var isChatPresented = false
    
    
    private let locations: [TestingLocation] = [
        TestingLocation(name: "Barrio Botanico", latitude: 40.84106, longitude: 14.25251),
        TestingLocation(name: "Nennella", latitude: 40.84194, longitude: 14.24745),
        TestingLocation(name: "Ostello Bello", latitude:40.84246, longitude: 14.25077),
        TestingLocation(name: "Piazza del Plebiscito", latitude: 40.8361, longitude: 14.2489),
        TestingLocation(name: "Maschio Angioino", latitude: 40.83842, longitude: 14.25423),
        TestingLocation(name: "Piazza Bellini", latitude:40.85031, longitude: 14.25240),
        TestingLocation(name: "Galleria Umberto", latitude:40.8372, longitude: 14.2506),
        TestingLocation(name: "Piazza Dante", latitude: 40.84876, longitude: 14.25027),
        TestingLocation(name: "Gino Sorbillo", latitude:40.83177, longitude: 14.24175),
        
    ]
        
    var body: some View {
        
        ZStack {
                    Map(
                        coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.83521, longitude: 14.25510), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))),
                        interactionModes: .all,
                        showsUserLocation: false,
                        userTrackingMode: .none,
                        annotationItems: locations
                    ) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                            Button(action: {
                                selectedLocation = location
                                showModal = true
                            }) {
                                getImageForLocation(location)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 6))
                                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
                                    .accessibility(label: Text(location.name))
                                    .accessibility(hint: Text("Select \(location.name)"))
                            }
                           
                            
                            Text(location.name)
                                .fontWeight(.medium)
                                .foregroundColor(.black)
                                .accessibility(label: Text(location.name))
                                .accessibility(hint: Text("Select \(location.name)"))
                        }
                    }
                }
                .edgesIgnoringSafeArea(.all)
                
                .sheet(isPresented: $showModal) {
            if let selectedLocation = selectedLocation {
                switch selectedLocation.name {
                case "Barrio Botanico":
                    BarrioBotanicoView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                        
                case "Nennella":
                    NennellaView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                       
                case "Gino Sorbillo":
                    SorbilloView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                      
                case "Ostello Bello":
                    OstelloBelloView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                        
                case "Piazza Dante":
               PiazzaDanteView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                        
                case "Piazza del Plebiscito":
                    PiazzadelPlebiscitoView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                        
                case "Piazza Bellini":
                    PiazzaBelliniView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                      
                case "Maschio Angioino":
                    MaschioAngioinoView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                        
                case "Galleria Umberto":
                    GalleriaUmbertoView(isPresented: $showModal, searchText: " ", selectedLocation: selectedLocation)
                        
               
                    // Add cases for other locations...
                default:
                    EmptyView() // A default view if the location doesn't match
                }
              }
           
            } .navigationTitle("Map")
        
      
    }
    
    
    func getImageForLocation(_ location: TestingLocation) -> Image {
           switch location.name {
               case "Barrio Botanico":
                     return Image("BarrioBotanicoImage1")
               case "Nennella":
                     return Image("NennellaImage")
               case "Ostello Bello":
                     return Image("OstelloBelloImage")
               case "Gino Sorbillo":
                     return Image("GinoSorbilloImage")
               case "Piazza Dante":
                     return Image("PiazzaDanteImage")
                case "Galleria Umberto":
                     return Image("GalleriaUmbertoImage")
                case "Piazza del Plebiscito":
                     return Image("PiazzadelPlebiscitoImage")
                case "Maschio Angioino":
                      return Image("MaschioAngioionImage")
                case "Piazza Bellini":
                      return Image("PiazzaBelliniImage")
               default:
                   return Image("PiazzaBelliniImage")
           }
           
       }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var selectedTag: Int?
    
    
    private let mapMarkers: [(name: String, coordinate: CLLocationCoordinate2D)] = [
        ("Barrio Botanico", CLLocationCoordinate2D(latitude: 40.836639, longitude: 14.306602)),
        ("Restaurant", CLLocationCoordinate2D(latitude: 40.834890, longitude: 14.304400)),
        ("Coffee Bar", CLLocationCoordinate2D(latitude: 40.836901, longitude: 14.302562))
    ]
    
    var body: some View {
        Map(selection: $selectedTag) {
            Annotation("Barrio Botanico",coordinate: mapMarkers[1].coordinate) {
                Image("BarrioBotanicoImage1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 100)
                    .clipShape(Circle(), style: FillStyle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                    .overlay(Circle().stroke(Color.red, lineWidth: 2))
            }
                .tag(1)
                
            Marker(mapMarkers[1].name, coordinate: mapMarkers[1].coordinate)
                .tag(2)
            Marker(mapMarkers[2].name, coordinate: mapMarkers[2].coordinate)
                .tag(3)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
    }
}
#Preview {
        ContentView()
    } */
