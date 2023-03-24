//
//  USPhotoSearchViewModel.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/23/23.
//

import Foundation
import Dispatch

class USPhotoSearchViewModel {
    var delegate: USPhotoSearchProtocol?
    
    func segueWhenTapped() {
        print(delegate)
        self.delegate?.segueToPhotoResults()
    }
}
