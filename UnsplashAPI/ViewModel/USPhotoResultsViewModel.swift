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
    var photosDataSource: [USPhoto] = []
    
    func loadDataSource() {
        USAPIManager.shared.decodePhotos(url: K.photoSearchURL, query: query) { [self] success, photos, error in
            if success, let photos = photos {
                //print(photos.count)
                //print(photos)
                photosDataSource = photos
                DispatchQueue.main.async { [self] in
                    delegate?.reloadCollection()
                }
            } else {
                print(error!)
            }
        }
    }
    
    func segueWhenPressed(item: Int) {
        //print(delegate)
        self.delegate?.segueToPhotoDisplay(item: item)
    }
}
