//
//  USNetworkManager.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/22/23.
//

import Foundation
import AVFoundation

class USNetworkManager: NSObject {
    static let shared: USNetworkManager = {
        let instance = USNetworkManager()
        return instance
    }()

    private override init() {
        super.init()
    }
    
    func getData(url: String, completionHandler: @escaping (Bool, Data?) -> ()) {
        guard let url = URL(string: url) else {
            print("Error: cannot create URL from string")
            completionHandler(false, nil)
            return
        }
        let request = URLRequest(url: url)
        
        let dt = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error hitting API with GET request:")
                print(error.localizedDescription)
                completionHandler(false, nil)
            }
            guard let data = data else {
                print("Error: Did not recieve data from API")
                completionHandler(false, nil)
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300).contains(response.statusCode) else {
                print("Error: HTTP request did not get a response")
                completionHandler(false, nil)
                return
            }
            completionHandler(true, data)
        }
        dt.resume()
    }
}
