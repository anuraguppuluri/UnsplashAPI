#  README

This application is supposed to pull from the Unsplash API and display pulled data using a variety of UIKit and other iOS frameworks.

How to use Unsplash API for photo search:
https://youtu.be/_AprVrgnq4w

Unsplash API params:
https://unsplash.com/documentation#search-photos

Error: typeMismatch(Swift.Double, Swift.DecodingError.Context(codingPath: [_JSONKey(stringValue: "Index 0", intValue: 0), CodingKeys(stringValue: "created_at", intValue: nil)], debugDescription: "Expected to decode Double but found a string/data instead.", underlyingError: nil))
The data couldn’t be read because it isn’t in the correct format.

Just need to convert date to string to resolve this issue.

Error: typeMismatch(Swift.Array<Any>, Swift.DecodingError.Context(codingPath: [], debugDescription: "Expected to decode Array<Any> but found a dictionary instead.", underlyingError: nil))
The data couldn’t be read because it isn’t in the correct format.

"" and nil, are they the same?
will accessing nil.count result in error?

Great observation: don't call image download closure inside cell

UnsplashAPI project completed 70%; remaining: —
1. Adding filters both on UI and programmatically
2. Using URL component builder to build url and trying out different user inputs
3. Figuring out using backend server pagination and loading more than 10 results per page
4. Using activity indicator when the subsequent pages are loading

collection view size resizing
- sizeatitem
- image constraint
- aspect ratio

https://api.unsplash.com/search/photos?client_id=zSagqoF0q4vE0CWewFC9TSeqFPuR-ZGUKmwOn2OXJ_M&query=nature&page=1
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1469474968028-56623f02e42e
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1501854140801-50d01698950b
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1472214103451-9374bd1c798e
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1433086966358-54859d0ed716
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1586348943529-beaae6c28db9
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1518173946687-a4c8892bbd9f
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1447752875215-b2761acb3c5d
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1441974231531-c6227db76b6e
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1470071459604-3b5ec3a7fe05
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1426604966848-d7adac402bff
Current Page = 1
https://api.unsplash.com/search/photos?client_id=zSagqoF0q4vE0CWewFC9TSeqFPuR-ZGUKmwOn2OXJ_M&query=nature&page=2
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1465146344425-f00d5f5c8f07
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1475924156734-496f6cac6ec1
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1505144808419-1957a94ca61e
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1470252649378-9c29740c9fa8
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1475113548554-5a36f1f523d6
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1510784722466-f2aa9c52fff6
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1505765050516-f72dcac9c60e
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1500382017468-9049fed747ef
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1439853949127-fa647821eba0
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1502082553048-f009c37129b9
Current Page = 2
2023-04-03 08:01:02.038368-0700 UnsplashAPI[16868:537119] [UICollectionView] Performing reloadData as a fallback — Invalid update: invalid number of items in section 0. The number of items contained in an existing section after the update (20) must be equal to the number of items contained in that section before the update (10), plus or minus the number of items inserted or deleted from that section (1 inserted, 1 deleted) and plus or minus the number of items moved into or out of that section (0 moved in, 0 moved out). Collection view: <UICollectionView: 0x7fa6ee87d400; frame = (0 88; 414 774); clipsToBounds = YES; autoresize = RM+BM; gestureRecognizers = <NSArray: 0x60000230d260>; layer = <CALayer: 0x600002de2620>; contentOffset: {0, -4}; contentSize: {414, 542}; adjustedContentInset: {4, 0, 0, 0}; layout: <UICollectionViewFlowLayout: 0x7fa6f06320e0>; dataSource: <UnsplashAPI.USPhotoResultsViewController: 0x7fa6f0033f60>>
2023-04-03 08:01:02.370857-0700 UnsplashAPI[16868:537499] [boringssl] boringssl_metrics_log_metric_block_invoke(153) Failed to log metrics
https://api.unsplash.com/search/photos?client_id=zSagqoF0q4vE0CWewFC9TSeqFPuR-ZGUKmwOn2OXJ_M&query=nature&page=3
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1455218873509-8097305ee378
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1444464666168-49d633b86797
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1418065460487-3e41a6c84dc5
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1431794062232-2a99a5431c6c
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/reserve/HgZuGu3gSD6db21T3lxm_San_Zenone.jpg
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1414609245224-afa02bfb3fda
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1490730141103-6cac27aaab94
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1546514355-7fdc90ccbd03
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1518837695005-2083093ee35b
https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1446329813274-7c9036bd9a1f
Current Page = 3
Swift/ContiguousArrayBuffer.swift:575: Fatal error: Index out of range
2023-04-03 08:01:02.627565-0700 UnsplashAPI[16868:537119] Swift/ContiguousArrayBuffer.swift:575: Fatal error: Index out of range

The idea for getting out of this could be that before we reach the penultimate page of the already loaded pages, we need to load the next 5 pages in the willDisplay block = so that it is not all 10000 images at once and taking a while to download but also the user scrolling swiftly will also be able to have a smooth interaction

remaining = adding per_page and color filters
