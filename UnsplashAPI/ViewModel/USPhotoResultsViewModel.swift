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
    let ap = USAPIManager.shared
    var params: [String: Any] = [:]
    var photosDataSource: [USPhoto]?
    var photoImagesDataSource: [Data]?
    var currentPage, totalPages: Int?
    
    func addToDataSources(page: Int) {
        for i in page ... (page + K.numberOfPagesToLoad) {
            params["page"] = i
            ap.decodePhotos(params: params) { [self] success, photos, error in
                if success, let photos = photos, let results = photos.results {
                    photosDataSource?.append(contentsOf: results)
                    print(photosDataSource!.count)
                    //print(photosDataSource)
                    currentPage = i
                    print("Current Page = \(currentPage)")
                    for result in results {
                        if let photoURL = result.urls?.smallS3 {
                            //print(photoURL)
                            DispatchQueue.global().async {
                                USAPIManager.shared.downloadImageData(from: photoURL) { [self] success, photoData, error in
                                    if success, let data = photoData {
                                        photoImagesDataSource?.append(data)
                                    } else {
                                        print(error!)
                                    }
                                }
                            }
                        }
                    }
                    DispatchQueue.main.async { [self] in
                        delegate?.reloadCollection()
                    }
                } else {
                    print(error!)
                }
            }
        }
    }
    
    func segueWhenPressed(item: Int) {
        //print(delegate)
        self.delegate?.segueToPhotoDisplay(item: item)
    }
}
