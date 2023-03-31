//
//  USConstantsManager.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/23/23.
//

import Foundation

struct K
{
    /*
     GET https://api.unsplash.com/search/photos?client_id=zSagqoF0q4vE0CWewFC9TSeqFPuR-ZGUKmwOn2OXJ_M&query=<query>&page=<page>&per_page=<perPage>&order_by=<orderBy>&collections=<collection1,collection2,collection3,...>&content_filter=<contentFilter>&color=<color>&orientation=<orientation>
     */
    static let photoSearchURL = "https://api.unsplash.com/search/photos"
    static let apiClientID = "zSagqoF0q4vE0CWewFC9TSeqFPuR-ZGUKmwOn2OXJ_M"
    
    static let quotesResultsSegueID = "quotesResultsSegue"
    static let newsResultsSegueID = "newsResultsSegue"
    
    static let orderByOptions = ["relevant", "latest"]
    static let orientationOptions = ["landscape", "portrait", "squarish"]
    
    static let photoResultsViewID = "photoResultsView"
    static let photoDisplayViewID = "photoDisplayView"
    static let newsWebsiteViewID = "newsWebsiteView"
    
    static let photoCellID = "photoCell"
    static let photoLoadingCellID = "photoLoadingCell"
    static let photoCellWidth = 128.0
    static let photoCellHeight = 128.0
}
