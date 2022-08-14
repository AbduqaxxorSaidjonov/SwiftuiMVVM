//
//  HomeViewScreen.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import SwiftUI

struct HomeViewScreen: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var showingEdit = false
    
    func delete(indexSet: IndexSet){
        let post = viewModel.posts[indexSet.first!]
        viewModel.apiPostDelete(post: post, handler: { value in
            if value {
                viewModel.apiPostList()
            }
        })
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(0..<viewModel.posts.count, id:\.self) { index in
                        Button {
                            showingEdit.toggle()
                        } label: {
                            PostCell(post: viewModel.posts[index])
                            
                        }
                        .sheet(isPresented: $showingEdit){
                            EditViewScreen(postId: viewModel.posts[index].id!)
                                .onDisappear{
                                    viewModel.apiPostList()
                                }
                        }
                    }.onDelete(perform: delete)
                }
                .listStyle(PlainListStyle())
                if viewModel.isLoading{
                    ProgressView()
                }
            }
            .navigationBarItems(leading: Button{
                viewModel.apiPostList()
            } label: {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(.white)
            }, trailing: NavigationLink(destination: CreateViewScreen()
        , label: { Image(systemName: "note.text.badge.plus").foregroundColor(.white)
            }))
            .navigationBarTitle("SwiftUI MVVM", displayMode: .inline)
        }
        .onAppear{
            viewModel.apiPostList()
        }
    }
}

struct HomeViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewScreen()
    }
}
