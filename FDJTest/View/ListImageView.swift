//
//  ListImageView.swift
//  FDJTest
//
//  Created by Ibrahima KH GUEYE on 20/03/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListImageView: View {
    
    @ObservedObject var listImageViewModel = ListImageViewModel()
        
    var body: some View {
        List(listImageViewModel.images) { image in
            HStack {
                AnimatedImage(url: image.url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 110,height: 110)
                    .cornerRadius(10)
                Text(image.description ?? "")
                    .font(.system(size: 10))
                    .font(.subheadline)
            }
            .onAppear {
                if image == listImageViewModel.images.last {
                    listImageViewModel.loadMoreImages()
                }
            }
        }
        .navigationBarTitle("Unsplash Images")
        .searchable(text: $listImageViewModel.query)
        .onSubmit(of: .search) {
            listImageViewModel.searchImages(matching: listImageViewModel.query)
        }
    }
}

