//
//  CreateViewScreen.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import SwiftUI

struct CreateViewScreen: View {
    @ObservedObject var viewModel = CreateViewModel()
    @Environment(\.presentationMode) var presentation
    @State var createTitle = ""
    @State var createBody = ""
    
    var body: some View {
            ZStack{
                VStack(alignment: .leading){
                    TextField("Title", text: $createTitle)
                        .padding(.leading)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke().foregroundColor(.gray))
                    TextField("Body", text: $createBody)
                        .padding(.leading)
                        .frame(height: 50)
                        .overlay(RoundedRectangle(cornerRadius: 20).stroke().foregroundColor(.gray))
                    Button{
                        viewModel.apiPostCreate(post: Post(title: createTitle, body: createBody), handler: {value in
                            if value{
                                presentation.wrappedValue.dismiss()
                            }
                        })
                    }label: {
                        Text("Create")
                            .frame(maxWidth: .infinity,maxHeight: 50)
                            .foregroundColor(.white)
                    }
                    .background(Color.blue)
                    .cornerRadius(20)
                    Spacer()
                }
                .padding()
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationBarTitle("Create Screen", displayMode: .inline)
            .navigationBarItems(leading: Button{
                presentation.wrappedValue.dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(.white)
            })
        .navigationBarBackButtonHidden(true)
        
    }
}

struct CreateViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateViewScreen()
    }
}
