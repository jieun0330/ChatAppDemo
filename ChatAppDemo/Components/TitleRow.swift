//
//  TitleRow.swift
//  ChatAppDemo
//
//  Created by 박지은 on 2023/07/15.
//

import SwiftUI


//struct MessageField: View {
    

struct TitleRow: View {
    
//    @EnvironmentObject var messageManager: MessagesManager
//    @State private var message = ""
//    @Binding var name: String
    
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3164&q=80")
    @Binding var name: String
//    var name = (text:)
    
    
    
    
    
    
    
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                Text(name)
                    .font(.title).bold()
                
                Button {
                    
                } label: {
                    Image(systemName: "pencil")

                }

                
                
//                Text("Online")
//                    .font(.caption)
//                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
//            Button {
                
//                messageManager.sendMessage(text: message)
//                message = ""
                                
//                var user = User(firstname: "jay", lastname: "koo", age: 0)
//                user.name = "지은"
//                user.email = "순순@~~~~"
//
//                FirebaseService.createUser(user: user, completion: {
//                    print("로그인 뷰로 이동")
//                    print("222")
//                })

                // 위에 작업이 끝났다는걸 우리는 알수가 없어
                
//            } label: {
//                Text("닉네임 수정")
//            }
//
            
//            CustomTextField(placeholder: Text("닉네임을 입력하세요(messagefield)"), text: $message)
//
//            Button {
//                messageManager.sendMessage(text: message)
//                message = ""
//            } label: {
//                Image(systemName: "paperplane.fill")
//                    .foregroundColor(.white)
//                    .padding(10)
//                    .background(Color("Peach"))
//                    .cornerRadius(50)
//            }
            
            
            
            
        }
        .padding()
    }
}

//struct TitleRow_Previews: PreviewProvider {
//    static var previews: some View {
//        TitleRow()
//            .background(Color("Peach"))
//    }
//}
