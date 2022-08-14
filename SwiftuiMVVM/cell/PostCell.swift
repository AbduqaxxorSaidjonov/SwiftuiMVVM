//
//  PostCell.swift
//  SwiftuiMVVM
//
//  Created by Abduqaxxor on 13/8/22.
//

import SwiftUI

struct PostCell: View {
    var post: Post
    
    var body: some View {
        
            VStack(alignment: .leading){
                Text(post.title!.uppercased()).fontWeight(.bold)
                Text(post.body!).padding(.top,5)
            }
            .padding()
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post())
    }
}
