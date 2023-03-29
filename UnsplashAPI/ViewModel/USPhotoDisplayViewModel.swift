//
//  USPhotoDisplayViewModel.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/24/23.
//

import Foundation
import Dispatch

class USPhotoDisplayViewModel {
    var currentPhoto: USPhoto?
    
    func getImageData(from url: String, completionHandler: @escaping (_ success: Bool, _ result: Data?, _ error: String?) -> ()) {
        USAPIManager.shared.downloadImageData(from: url) { success, imageData, error in
            if success {
                completionHandler(true, imageData!, nil)
            } else {
                completionHandler(false, nil, "Encountered GET request error")
            }
        }
    }
}
