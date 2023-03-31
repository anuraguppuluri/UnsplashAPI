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
    
    func decodePhotos(url: String, query: String?, page: Int, orderBy: String?, orientation: String?, completionHandler: @escaping (_ success: Bool, _ results: USPhotos?, _ error: String?) -> ()) {
        var urlBuilder = URLComponents(string: url)
        urlBuilder?.queryItems = [
            URLQueryItem(name: "client_id", value: K.apiClientID)
        ]
        if let q = query {
            urlBuilder?.queryItems?.append(URLQueryItem(name: "query", value: q))
        }
        urlBuilder?.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        if let ord = orderBy {
            urlBuilder?.queryItems?.append(URLQueryItem(name: "order_by", value: ord))
        }
        if let ori = orientation {
            urlBuilder?.queryItems?.append(URLQueryItem(name: "orientation", value: ori))
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
