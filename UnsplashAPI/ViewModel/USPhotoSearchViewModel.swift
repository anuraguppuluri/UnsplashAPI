//
//  USPhotoSearchViewModel.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/23/23.
//

import Foundation

class USPhotoSearchViewModel {
    var delegate: USPhotoSearchProtocol?
    
    func segueOrDisplay(searchStr: String?) {
        //print(delegate)
        if searchStr == "" {
            self.delegate?.displayAlert(alertMessage: "Empty Search String Provided")
        } else {
            self.delegate?.segueToPhotoResults()
        }
    }
}
