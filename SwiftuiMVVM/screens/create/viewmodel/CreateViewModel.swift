//
//  CreateViewModel.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 14/8/22.
//

import Foundation

class CreateViewModel: ObservableObject{
    @Published var isLoading = false
    
    func apiPostCreate(post: Post, handler: @escaping (Bool) -> (Void)){
        self.isLoading = true
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
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
