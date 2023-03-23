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
                    let obj = try decoder.decode([USPhoto].self, from: data!)
                    completionHandler(true, obj, nil)
                } catch {
                    print("Error: \(error)")
                    completionHandler(false, nil, error.localizedDescription)
                }
            } else {
                completionHandler(false, nil, "Encountered GET request error")
            }
        }
    }
}
