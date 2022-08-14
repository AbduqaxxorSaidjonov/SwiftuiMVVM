//
//  EditViewScreen.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import SwiftUI

struct EditViewScreen: View {
    
    @Environment(\.presentationMode) var presentation
    @State var editTitle = ""
    @State var editBody = ""
    @ObservedObject var viewModel = EditViewModel()
    var postId: String
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading,spacing: 15){
                   TextField("Title", text: $editTitle)
                        .padding(.leading)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke().foregroundColor(.gray))
                   TextField("Body", text: $editBody)
                        .padding(.leading)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke().foregroundColor(.gray))
                    Button{
                        viewModel.apiEditPost(id: Int(postId)!, post: Post(title: editTitle, body: editBody)) { result in
                            if result {
                                presentation.wrappedValue.dismiss()
                            }
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    Spacer()
                }
                .padding()
                if viewModel.isLoading{
                    ProgressView()
                }
            }
            .navigationBarTitle("Edit Screen", displayMode: .inline)
            .navigationBarItems(leading: Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
            })
        }
        .onAppear{
            viewModel.apiCallPost(id: Int(postId)!) { item in
                self.editTitle = item.title ?? ""
                self.editBody = item.body ?? ""
            }

        }
        
    }
}

struct EditViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditViewScreen(postId: "")
    }
}
