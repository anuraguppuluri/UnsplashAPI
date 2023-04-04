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
    
    func decodePhotos(params: [String: Any], completionHandler: @escaping (_ success: Bool, _ results: USPhotos?, _ error: String?) -> ()) {
        var urlBuilder = URLComponents(string: K.photoSearchURL)
        urlBuilder?.queryItems = [
            URLQueryItem(name: "client_id", value: K.apiClientID)
        ]
        if let q = params["query"] {
            urlBuilder?.queryItems?.append(URLQueryItem(name: "query", value: q as? String))
        }
        if let p = params["page"] {
            urlBuilder?.queryItems?.append(URLQueryItem(name: "page", value: String(p as! Int)))
        }
        if let ob = params["orderBy"] {
            urlBuilder?.queryItems?.append(URLQueryItem(name: "order_by", value: ob as? String))
        }
        if let o = params["orientation"] {
            urlBuilder?.queryItems?.append(URLQueryItem(name: "orientation", value: o as? String))
        }
        guard let urlBuilt = urlBuilder?.url else {
            print("Error: Cannot Create URL from URL and Filter Strings")
            return
        }
        print(urlBuilt)
        USNetworkManager.shared.getData(url: urlBuilt.absoluteString, isImage: false) { success, data in
            if success {
                do {
                    let decoder = JSONDecoder()
                    let obj = try decoder.decode(USPhotos.self, from: data! as! Data)
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
    
    func downloadImageData(from url: String, completionHandler: @escaping (_ success: Bool, _ result: Data?, _ error: String?) -> ()) {
        USNetworkManager.shared.getData(url: url, isImage: true) { success, url in
            if success {
                do {
                    let imgData = try Data(contentsOf: url as! URL)
                    completionHandler(true, imgData, nil)
                } catch {
                    completionHandler(false, nil, "Error Retrieving Image in the Form of Data: \(error)")
                }
            } else {
                completionHandler(false, nil, "Encountered GET request error")
            }
        }
    }
}
