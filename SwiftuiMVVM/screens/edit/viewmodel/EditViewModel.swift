//
//  EditViewModel.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import Foundation

class EditViewModel: ObservableObject{
    
    @Published var isLoading = false
    
    func apiCallPost(id: Int, completion: @escaping (Post) -> Void) {
        self.isLoading = true
        AFHttp.get(url: AFHttp.API_POST_SINGLE + String(id), params: AFHttp.paramsPostWith(id: id), handler: { response in
            self.isLoading = false
            switch response.result {
            case .success:
                let decode = try! JSONDecoder().decode(Post.self, from: response.data!)
                completion(decode)
            case let .failure(error):
                print(error)
                completion(Post())
            }
        })
    }
    
    func apiEditPost(id: Int, post: Post, completion: @escaping (Bool) -> Void) {
        self.isLoading = true
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(id), params: AFHttp.paramsPostUpdate(post: post)) { response in
            self.isLoading = false
            switch response.result {
            case .success:
                print("SUCCESS")
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
                completion(true)
            case let .failure(error):
                print(error)
                completion(false)
            }
        }
    }
}
