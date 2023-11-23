//
//  ChatConversationView.swift
//  SimoneInsta
//
//  Created by Simone Mercolino on 22/11/23.
//

import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let message: String
    let isSentByUser: Bool // Indicates if the message is sent by the user or received
}

struct ChatConversationView: View {
    @Binding var isPresented: Bool
    @Binding var locationName: String
    @Binding var locationImage: Image
    
    @State private var newMessage = ""
    @State private var messages: [ChatMessage] = []
    

    var body: some View {
        VStack (alignment: .leading, spacing: 2){
                   
                   
                    
                    Spacer()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(messages) { message in
                        ChatBubbleView(message: message)
                    }
                }
            }
            
            HStack {
                TextField("Type a message", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: sendMessage) {
                    Text("Send")
                }
                .padding(.trailing)
            }
            .padding(.bottom)
        }
        
        .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading:
                        Button(action: {
                            isPresented = false
                    }) {  VStack {
                        HStack {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        HStack {
                            locationImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 6))
                                .overlay(Circle().stroke(Color.red, lineWidth: 2))
                            
                            Text(locationName)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                }
            )
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(false)
        }
       
    func sendMessage() {
        guard !newMessage.isEmpty else { return }
        let message = ChatMessage(message: newMessage, isSentByUser: true)
        messages.append(message)
        newMessage = ""
        // Simulate received message (for demonstration)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let receivedMessage = ChatMessage(message: "This is an automated reply.", isSentByUser: false)
            messages.append(receivedMessage)
        }
    }
        
}

struct ChatBubbleView: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isSentByUser {
                Spacer()
                Text(message.message)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            } else {
                Text(message.message)
                    .padding(12)
                    .foregroundColor(.black)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Spacer()
            }
        }
        .padding(.horizontal)
    }
        
}

