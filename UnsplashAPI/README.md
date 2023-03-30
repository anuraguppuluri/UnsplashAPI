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

UnsplashAPI project completed 70%; remaining: —
1. Adding filters both on UI and programmatically
2. Using URL component builder to build url and trying out different user inputs
3. Figuring out using backend server pagination and loading more than 10 results per page
4. Using activity indicator when the subsequent pages are loading

collection view size resizing
- sizeatitem
- image constraint
- aspect ratio

