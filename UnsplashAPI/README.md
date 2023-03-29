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


