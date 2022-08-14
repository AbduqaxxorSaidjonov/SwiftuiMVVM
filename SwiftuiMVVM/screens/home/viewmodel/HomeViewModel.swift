//
//  HomeViewModel.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var posts = [Post]()
    
    func apiPostList(){
        isLoading = true
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: {response in
            self.isLoading = false
            switch response.result{
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: response.data!)
                self.posts = posts
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func apiPostDelete(post: Post, handler: @escaping (Bool) -> Void){
        isLoading = true
        AFHttp.del(url: AFHttp.API_POST_DELETE + post.id!, params: AFHttp.paramsEmpty(), handler: {response in
            self.isLoading = false
            switch response.result{
            case .success:
                print(response.result)
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        })
    }
}
