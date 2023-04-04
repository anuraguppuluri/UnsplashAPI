//
//  USPhotoSearchViewModel.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/23/23.
//

import Foundation

class USPhotoSearchViewModel {
    var delegate: USPhotoSearchProtocol?
    let ap = USAPIManager.shared
    var params: [String: Any] = [:]
    var photosDataSource: [USPhoto] = []
    var photoImagesDataSource: [Data] = []
    var currentPage = 1, totalPages = 1
    
    func initDataSources() {
        //print(delegate)
        if params["query"] as! String == "" {
            self.delegate?.displayAlert(alertMessage: "Empty Search String Provided")
        } else {
            for i in 1 ... K.numberOfPagesToLoad {
                params["page"] = i
                ap.decodePhotos(params: params) { [self] success, photos, error in
                    if success, let photos = photos, let results = photos.results {
                        if i == 1, let totalPages = photos.totalPages {
                            self.totalPages = totalPages
                        }
                        photosDataSource.append(contentsOf: results)
                        print(photosDataSource.count)
                        //print(photosDataSource)
                        currentPage = i
                        print("Current Page = \(currentPage)")
                        for result in results {
                            if let photoURL = result.urls?.smallS3 {
                                //print(photoURL)
                                DispatchQueue.global().async {
                                    USAPIManager.shared.downloadImageData(from: photoURL) { [self] success, photoData, error in
                                        if success, let data = photoData {
                                            photoImagesDataSource.append(data)
                                        } else {
                                            print(error!)
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        print(error!)
                    }
                }
            }
            self.delegate?.segueToPhotoResults()
        }
    }
}
