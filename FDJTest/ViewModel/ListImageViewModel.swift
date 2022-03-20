//
//  ListImageViewModel.swift
//  FDJTest
//
//  Created by Ibrahima KH GUEYE on 19/03/2022.
//

import Foundation
import Combine

class ListImageViewModel: ObservableObject {
    @Published var images = [UnsplashImage]()
    @Published var query: String = ""
    
    private var anyCancellables = Set<AnyCancellable>()
    
    private var service: ServiceProtocol
    private var currentPage = 1
    private var numberOfPages = 1
    
    init(service: ServiceProtocol = UnsplashService()) {
        self.service = service
    }
    
    func searchImages(matching query: String) {
        currentPage = 1
        
        do {
            try service.searchImages(.search(matching: query, pages: currentPage))
                .sink { completion in
                    switch completion {
                    case .finished: break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] unsplashResponse in
                    self?.images = unsplashResponse.results
                    self?.numberOfPages = unsplashResponse.total_pages
                }.store(in: &anyCancellables)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    func loadMoreImages() {
        currentPage += 1
        
        if currentPage > numberOfPages {
            return
        }
        
        do {
            try service.searchImages(.search(matching: query, pages: currentPage))
                .sink { completion in
                    switch completion {
                    case .finished: break
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                } receiveValue: { [weak self] unsplashResponse in
                    self?.images.append(contentsOf: unsplashResponse.results)
                }.store(in: &anyCancellables)
        } catch  {
            print(error.localizedDescription)
        }
    }
}
