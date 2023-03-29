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
    var photosDataSource: [USPhoto] = []
    
    func loadDataSource() {
        USAPIManager.shared.decodePhotos(url: K.photoSearchURL) { [self] success, photos, error in
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
    
    func getImageData(from url: String, completionHandler: @escaping (_ success: Bool, _ result: Data?, _ error: String?) -> ()) {
        USAPIManager.shared.downloadImageData(from: url) { success, imageData, error in
            if success {
                completionHandler(true, imageData!, nil)
            } else {
                completionHandler(false, nil, "Encountered GET request error")
            }
        }
    }
    
    func segueWhenPressed(item: Int) {
        //print(delegate)
        self.delegate?.segueToPhotoDisplay(item: item)
    }
}
