//
//  MessageField.swift
//  ChatAppDemo
//
//  Created by 박지은 on 2023/07/15.
//

import SwiftUI

struct MessageField: View {
    
    @EnvironmentObject var messageManager: MessagesManager
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("닉네임을 입력하세요"), text: $message)
            
            Button {
                
                var user = User(name: "", email: "")
                user.name = "지은"
                user.email = "순순@~~~~"
                
                FirebaseService.createUser(user: user, completion: {
                    print("로그인 뷰로 이동")
                    print("222")
                })
                
//                messageManager.sendMessage(text: message)
//                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
            
            Button {
                
//                messageManager.sendMessage(text: message)
//                message = ""
                                
                var user = User(name: "", email: "")
                user.name = "지은"
                user.email = "순순@~~~~"

                FirebaseService.updateUser(user: user, completion: {
                    print("수정되었습니다")
                    print("222")
                })

                // 위에 작업이 끝났다는걸 우리는 알수가 없어
                
            } label: {
                Image(systemName: "eraser.line.dashed")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
            
            

        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
            .environmentObject(MessagesManager())
    }
}


struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
            
        }
    }
}
