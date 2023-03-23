//
//  ViewController.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/22/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        USAPIManager.shared.decodePhotos(url: "https://api.unsplash.com/photos/?client_id=zSagqoF0q4vE0CWewFC9TSeqFPuR-ZGUKmwOn2OXJ_M") { [self] success, photos, error in
            if success, let photos = photos {
                print(photos.count)
                print(photos)
                //photosDataSource = photos
                //DispatchQueue.main.async { [self] in
                    //delegate?.reloadTable()
                //}
            } else {
                print(error!)
            }
        }
    }


}

