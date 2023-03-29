//
//  USAPIManager.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/22/23.
//

import Foundation

class USAPIManager: NSObject {
    static let shared: USAPIManager = {
        let instance = USAPIManager()
        return instance
    }()

    private override init() {
        super.init()
    }
    
    func decodePhotos(url: String, completionHandler: @escaping (_ success: Bool, _ results: [USPhoto]?, _ error: String?) -> ()) {
        USNetworkManager.shared.getData(url: url) { success, data in
            if success {
                do {
                    let decoder = JSONDecoder()
                    let obj = try decoder.decode(USPhotos.self, from: data!)
                    completionHandler(true, obj.results, nil)
                } catch {
                    print("Error: \(error)")
                    completionHandler(false, nil, error.localizedDescription)
                }
            } else {
                completionHandler(false, nil, "Encountered GET request error")
            }
        }
    }
    
    func downloadImageData(from url: String, completionHandler: @escaping (_ success: Bool, _ result: Data?, _ error: String?) -> ()) {
        USNetworkManager.shared.getData(url: url) { success, data in
            if success {
                completionHandler(true, data!, nil)
            } else {
                completionHandler(false, nil, "Encountered GET request error")
            }
        }
    }
}
