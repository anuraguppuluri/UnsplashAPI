//
//  USPhotoDataModel.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/22/23.
//

import Foundation

// MARK: - USPhotos
struct USPhotos: Codable {
    let total, totalPages: Int?
    let results: [USPhoto]?

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - USPhoto
struct USPhoto: Codable {
    let id: String?
    //let createdAt, updatedAt, promotedAt: Date?
    let createdAt, updatedAt, promotedAt: String?
    let width, height: Int?
    let color, blurHash: String?
    let description: String?
    let altDescription: String?
    let urls: Urls?
    let links: USPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: ResultTopicSubmissions?
    let user: User?
    let tags: [Tag]?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case topicSubmissions = "topic_submissions"
        case user, tags
    }
}

// MARK: - USPhotoLinks
struct USPhotoLinks: Codable {
    let linksSelf, html, download, downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, download
        case downloadLocation = "download_location"
    }
}

// MARK: - Tag
struct Tag: Codable {
    let type: TypeEnum?
    let title: String?
    let source: Source?
}

// MARK: - Source
struct Source: Codable {
    let ancestry: Ancestry?
    let title, subtitle, description, metaTitle: String?
    let metaDescription: String?
    let coverPhoto: CoverPhoto?

    enum CodingKeys: String, CodingKey {
        case ancestry, title, subtitle, description
        case metaTitle = "meta_title"
        case metaDescription = "meta_description"
        case coverPhoto = "cover_photo"
    }
}

// MARK: - Ancestry
struct Ancestry: Codable {
    let type, category, subcategory: Category?
}

// MARK: - Category
struct Category: Codable {
    let slug, prettySlug: String?

    enum CodingKeys: String, CodingKey {
        case slug
        case prettySlug = "pretty_slug"
    }
}

// MARK: - CoverPhoto
struct CoverPhoto: Codable {
    let id: String?
    //let createdAt, updatedAt, promotedAt: Date?
    let createdAt, updatedAt, promotedAt: String?
    let width, height: Int?
    let color, blurHash: String?
    let description, altDescription: String?
    let urls: Urls?
    let links: USPhotoLinks?
    let likes: Int?
    let likedByUser: Bool?
    let topicSubmissions: CoverPhotoTopicSubmissions?
    let premium: Bool?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case promotedAt = "promoted_at"
        case width, height, color
        case blurHash = "blur_hash"
        case description
        case altDescription = "alt_description"
        case urls, links, likes
        case likedByUser = "liked_by_user"
        case topicSubmissions = "topic_submissions"
        case premium, user
    }
}

// MARK: - CoverPhotoTopicSubmissions
struct CoverPhotoTopicSubmissions: Codable {
    let wallpapers, nature, architectureInterior, colorOfWater: ColorOfWater?
    let interiors: ColorOfWater?

    enum CodingKeys: String, CodingKey {
        case wallpapers, nature
        case architectureInterior = "architecture-interior"
        case colorOfWater = "color-of-water"
        case interiors
    }
}

// MARK: - ColorOfWater
struct ColorOfWater: Codable {
    let status: Status?
    //let approvedOn: Date?
    let approvedOn: String?

    enum CodingKeys: String, CodingKey {
        case status
        case approvedOn = "approved_on"
    }
}

enum Status: String, Codable {
    case approved = "approved"
    case rejected = "rejected"
}

// MARK: - Urls
struct Urls: Codable {
    let raw, full, regular, small: String?
    let thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

// MARK: - User
struct User: Codable {
    let id: String?
    //let updatedAt: Date?
    let updatedAt: String?
    let username, name, firstName: String?
    let lastName, twitterUsername: String?
    let portfolioURL: String?
    let bio, location: String?
    let links: UserLinks?
    let profileImage: ProfileImage?
    let instagramUsername: String?
    let totalCollections, totalLikes, totalPhotos: Int?
    let acceptedTos, forHire: Bool?
    let social: Social?

    enum CodingKeys: String, CodingKey {
        case id
        case updatedAt = "updated_at"
        case username, name
        case firstName = "first_name"
        case lastName = "last_name"
        case twitterUsername = "twitter_username"
        case portfolioURL = "portfolio_url"
        case bio, location, links
        case profileImage = "profile_image"
        case instagramUsername = "instagram_username"
        case totalCollections = "total_collections"
        case totalLikes = "total_likes"
        case totalPhotos = "total_photos"
        case acceptedTos = "accepted_tos"
        case forHire = "for_hire"
        case social
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    let linksSelf, html, photos, likes: String?
    let portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    let small, medium, large: String?
}

// MARK: - Social
struct Social: Codable {
    let instagramUsername: String?
    let portfolioURL: String?
    let twitterUsername: String?

    enum CodingKeys: String, CodingKey {
        case instagramUsername = "instagram_username"
        case portfolioURL = "portfolio_url"
        case twitterUsername = "twitter_username"
    }
}

enum TypeEnum: String, Codable {
    case landingPage = "landing_page"
    case search = "search"
}

// MARK: - ResultTopicSubmissions
struct ResultTopicSubmissions: Codable {
    let travel, nature, wallpapers, colorOfWater: ColorOfWater?
    let spirituality: ColorOfWater?

    enum CodingKeys: String, CodingKey {
        case travel, nature, wallpapers
        case colorOfWater = "color-of-water"
        case spirituality
    }
}
