//
//  Listing.swift
//  TradeMe_Categories
//
//  Created by Rich on 1/29/22.
//

import Foundation

struct Listing : Codable {
    var listingId: Int
    var title: String
    var category: String
    var startPrice: Float?
    var buyNowPrice: Float?
    var pictureHref: String?
    var region: String?
    var isClassified: Bool?
    var isReserveMet: Bool?
    var isBuyNowOnly: Bool?

    enum CodingKeys: String, CodingKey {
        case listingId = "ListingId"
        case title = "Title"
        case category = "Category"
        case startPrice = "StartPrice"
        case buyNowPrice = "BuyNowPrice"
        case pictureHref = "PictureHref"
        case region = "Region"
        case isClassified = "IsClassified"
        case isReserveMet = "IsReserveMet"
        case isBuyNowOnly = "isBuyNowOnly"
    }
}

// SwiftUI requirement
extension Listing: Identifiable {
    var id: Int {
        self.listingId
    }
}

extension Listing {
    static var testData: [Listing] {
        return [
            Listing(listingId: 2149369601, title: "Sessel Style Curved Lounge Chair - Leather", category: "0004-0374-0572-4080-", startPrice: Optional(1.0), buyNowPrice: nil, pictureHref: Optional("https://images.tmsandbox.co.nz/photoserver/thumb/9139460.jpg")),
            Listing(listingId: 2149369600, title: "Sessel Style Curved Lounge Chair - Leather", category: "0004-0374-0572-4080-", startPrice: Optional(1.0), buyNowPrice: nil, pictureHref: Optional("https://images.tmsandbox.co.nz/photoserver/thumb/9139449.jpg")),
            Listing(listingId: 2149369599, title: "MyProd MyP-47-114 - 12MTJSW0DQD7X", category: "0004-3267-3270-8322-", startPrice: Optional(100.14), buyNowPrice: Optional(120.14), pictureHref: Optional("https://images.tmsandbox.co.nz/photoserver/thumb/4549999.jpg")),
        ]
    }
}
/*
 {
   "ListingId": 123,
   "Title": "ABC",
   "Category": "ABC",
   "StartPrice": 123.0,
   "BuyNowPrice": 123.0,
   "StartDate": "\/Date(1514764800)\/",
   "EndDate": "\/Date(1514764800)\/",
   "IsFeatured": false,
   "HasGallery": false,
   "IsBold": false,
   "IsHighlighted": false,
   "HasHomePageFeature": false,
   "MaxBidAmount": 123.0,
   "AsAt": "\/Date(1514764800)\/",
   "CategoryPath": "ABC",
   "PictureHref": "ABC",
   "HasPayNow": false,
   "IsNew": false,
   "RegionId": 123,
   "Region": "ABC",
   "SuburbId": 123,
   "Suburb": "ABC",
   "BidCount": 123,
   "IsReserveMet": false,
   "HasReserve": false,
   "HasBuyNow": false,
   "NoteDate": "\/Date(1514764800)\/",
   "ReserveState": 0,
   "Attributes": [
     {
       "Name": "ABC",
       "DisplayName": "ABC",
       "Value": "ABC",
       "DisplayValue": "ABC"
     },
     {
       "Name": "ABC",
       "DisplayName": "ABC",
       "Value": "ABC",
       "DisplayValue": "ABC"
     }
   ],
   "IsClassified": false,
   "OpenHomes": [
     {
       "Start": "\/Date(1514764800)\/",
       "End": "\/Date(1514764800)\/"
     },
     {
       "Start": "\/Date(1514764800)\/",
       "End": "\/Date(1514764800)\/"
     }
   ],
   "Subtitle": "ABC",
   "IsBuyNowOnly": false,
   "RemainingGalleryPlusRelists": 123,
   "IsOnWatchList": false,
   "GeographicLocation": {
     "Latitude": 123.0,
     "Longitude": 123.0,
     "Northing": 123,
     "Easting": 123,
     "Accuracy": 0
   },
   "PriceDisplay": "ABC",
   "TotalReviewCount": 123,
   "PositiveReviewCount": 123,
   "HasFreeShipping": false,
   "IsClearance": false,
   "WasPrice": 123.0,
   "PercentageOff": 123,
   "Branding": {
     "LargeSquareLogo": "ABC",
     "LargeWideLogo": "ABC",
     "BackgroundColor": "ABC",
     "TextColor": "ABC",
     "StrokeColor": "ABC",
     "DisableBanner": false,
     "OfficeLocation": "ABC",
     "LargeBannerURL": "ABC"
   },
   "IsSuperFeatured": false,
   "ShortDescription": "ABC",
   "PhotoUrls": [
     "ABC",
     "ABC"
   ],
   "PromotionId": 123,
   "HasEmbeddedVideo": false,
   "VariantDefinitionSummary": {
     "PriceLow": 123.0,
     "PriceHigh": 123.0,
     "Price": 123.0,
     "HasPriceRange": false,
     "DiscountPercentLow": 123,
     "DiscountPercentHigh": 123,
     "DiscountPercent": 123,
     "HasDiscountPercentRange": false,
     "AllDiscounted": false,
     "AllOnClearance": false
   },
   "AdditionalData": {
     "BulletPoints": [
       "ABC",
       "ABC"
     ],
     "Tags": [
       {
         "Name": "ABC"
       },
       {
         "Name": "ABC"
       }
     ]
   },
   "ListingExtras": [
     "ABC",
     "ABC"
   ],
   "IsLoyaltyEligible": false,
   "HasPing": false,
   "StoreBrandLogoUrl": "ABC",
   "WhyPayPrice": 123.0,
   "Has3DTour": false,
   "ShippingDetails": {
     "ShippingTemplateId": 123,
     "SuggestedShipping": {
       "Price": 123.0,
       "Destination": "ABC",
       "DeliveryTime": {
         "MinValue": "ABC",
         "MaxValue": "ABC"
       },
       "IsRural": false
     }
   }
 },

 */
