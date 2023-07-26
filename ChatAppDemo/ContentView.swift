//
//  ContentView.swift
//  ChatAppDemo
//
//  Created by 박지은 on 2023/07/15.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var messagesManager = MessagesManager()
    @State private var name = ""
    
//    struct Message: Identifiable, Codable {
//        var id: String
//        var nickname: String
    
    
    var messageArray = ["Hello you", "How are you doing?", "I've been building SwiftUI application from scratch and it's so much fun!"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow(name: $name)
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
//                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .onChange(of: messagesManager.lastMessageId) { id in
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)

                    }
                }
                }
                
            }
            .background(Color("Peach"))
            
            MessageField(name: $name)
                .environmentObject(messagesManager)
        }
        .onAppear {
            messagesManager.getMessages()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
