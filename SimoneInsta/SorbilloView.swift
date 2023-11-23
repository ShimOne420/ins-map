//
//  OstelloBelloView.swift
//  SimoneInsta
//
//  Created by Simone Mercolino on 18/11/23.
//

import SwiftUI


struct SorbilloView: View {
    @Binding var isPresented: Bool
    @State var searchText: String
    @State private var isChatPresented = false
    var selectedLocation: TestingLocation? // Use optional type as it might be nil
    
    @Environment(\.sizeCategory) var sizeCategory
    
    
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
        default:
            return Image("DefaultImage")
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false // Dismiss the modal view
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(10)
                    }
                    .padding()
                    
                }
                VStack(alignment: .leading, spacing: 0) {
                    if let selectedLocation = selectedLocation {
                        HStack(alignment: .top) {
                            getImageForLocation(selectedLocation)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 6))
                                .overlay(Circle().stroke(Color.red, lineWidth: 2))
                                .padding(.trailing, 10)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(selectedLocation.name)
                                    .fontWeight(.bold)
                                
                                Text("22°C Partly cloudy")
                                    .fontWeight(.ultraLight)
                            }
                            .padding(.top, 5)
                        }
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    } else {
                        Text("No location selected")
                            .padding()
                    }
                    
                    ScrollView{
                        VStack(alignment: .leading, spacing: 20) {
                            
                            HStack(spacing: 20) { // HStack for the buttons
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)) // Light grey
                                    Button(action: {
                                        // Action for sharing
                                        // Implement your logic here
                                    }) {
                                        Text("Follow")
                                            .fontWeight(.medium)
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                }
                                
                                .frame(width: geometry.size.width * 0.45,height: geometry.size.height * 0.05) // Adjust width as needed
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9)) // Light grey
                                    
                                    NavigationLink(destination: ChatConversationView(isPresented: .constant(false), locationName: .constant(selectedLocation?.name ?? ""), locationImage: .constant(getImageForLocation(selectedLocation ?? TestingLocation(name: "Ostello Bello", latitude:40.84246, longitude: 14.25077)))), isActive: $isChatPresented) {
                                        EmptyView() // Using an empty view to activate NavigationLink
                                    }
                                    .hidden()
                                    Button(action: {
                                        isChatPresented = true    // Action for messaging
                                        
                                        
                                    })   {
                                        Text("Message")
                                            .fontWeight(.medium)
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                    
                                    
                                }
                                .navigationBarTitle( " ", displayMode: .inline)
                                .frame(width: geometry.size.width * 0.45,height: geometry.size.height * 0.05) // Adjust width as needed
                                
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            
                            HStack {
                                Button(action: {
                                    // Action for sharing
                                    // Implement your logic here
                                }) {
                                    Image(systemName: "paperplane")
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                                        .clipShape(Circle())
                                        .padding(.horizontal, 270) // Adjust the negative horizontal padding as needed
                                    
                                }
                                
                                Spacer() // Spacer to push the save button to the right
                                Button(action: {
                                    // Action for saving the place
                                    // Implement your logic here
                                }) {
                                    Image(systemName: "bookmark")
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                                        .clipShape(Circle())
                                        .padding(.horizontal, -260)
                                }
                            }
                            
                            
                            // Additional images in a VStack inside ScrollView
                            VStack(alignment: .leading, spacing: 2) {
                                HStack(spacing: 2) {
                                    Image("GinoFrittaImage") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                    
                                    
                                    
                                    Image("PizzaFrittaImage") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                    
                                    
                                    Image("SorbilloImage1") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                    
                                }
                                
                                
                                HStack(spacing: 2) {
                                    Image("SorbilloImage2") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                    Image("SorbilloImage3") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                    
                                    Image("SorbilloImage4") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                }
                                
                                HStack(spacing: 2) {
                                    Image("OstelloBelloImage7") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                    Image("OstelloBelloImage8") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                    
                                    Image("OstelloBelloImage9") // Replace with your asset names
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.height / 4)
                                        .clipped()
                                    
                                }
                                // Add more image pairs if needed...
                            }
                            .padding(.horizontal, 0)
                            
                        }
                        .padding(.top, 20)
                        
                    }
                    
                }
                
                    .padding(.leading, 0)
                
                }
           
                
            }
        .presentationDetents([.medium, .large]) // Moved the modifier here
        }
    }


