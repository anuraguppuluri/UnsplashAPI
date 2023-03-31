//
//  USPhotoResultsViewModel.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/23/23.
//

import Foundation
import Dispatch

class USPhotoResultsViewModel {
    var delegate: USPhotoResultsProtocol?
    var query: String?
    var photosDataSource: [USPhoto]?
    var currentPage, totalPages: Int?
    
    func reloadDataSource(page: Int) {
        USAPIManager.shared.decodePhotos(url: K.photoSearchURL, query: query, page: page) { [self] success, photos, error in
            if success, let photos = photos {
                if page == 1 {
                    totalPages = photos.totalPages
                    photosDataSource = photos.results
                } else {
                    photosDataSource?.append(contentsOf: photos.results ?? [])
                }
                //print(photos.count)
                //print(photos)
                DispatchQueue.main.async { [self] in
                    delegate?.reloadCollection()
                }
                print("Current Page = \(currentPage ?? -1)")
            } else {
                DispatchQueue.main.async { [self] in
                    delegate?.displayAlert(alertMessage: error!)
                }
            }
        }
    }
    
    func segueWhenPressed(item: Int) {
        //print(delegate)
        self.delegate?.segueToPhotoDisplay(item: item)
    }
}
