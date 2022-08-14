//
//  Post.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import Foundation

struct Post: Decodable, Hashable{
    
    var id: String?
    var title: String?
    var body: String?
    
    init(){
        
    }
    
    init(title: String?, body: String?){
        self.title = title
        self.body = body
    }
}
