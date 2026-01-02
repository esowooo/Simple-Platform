






import Foundation

struct Vendor: Codable, Identifiable, Hashable {
    
    let id : String
    let name: String
    let manager: String
    let images: [String] 
    let locationCountry: String
    let locationCity: String
    let locationDetail: String
    let isActive: Bool
    let createdAt: Date
    let updatedAt: Date
    let contactEmail: String?
    let contactPhone: String?
    let language: [String]
    let category: String
    let reviewCount: Int
    let rating: Double
    var favoriteCount: Int
    let description: String
}

enum VendorCategory: String, CaseIterable, Identifiable {
    var id: Self { self }
    case all = "All"
    case studio = "Studio"
    case dress = "Dress"
    case hairMake = "Hair&Make"
    
    var iconName: String {
        switch self {
        case .all: return "list.bullet"
        case .studio: return "camera"
        case .dress: return "figure.stand.dress"
        case .hairMake: return "scissors"
            
        }
        
    }
    
}



//MARK: - Mock Data
var vendors: [Vendor] = [
    Vendor(
        id: "studioA",
        name: "Studio Apple",
        manager: "admin1",
        images: ["studioA01","studioA02","studioA03","studioA04","studioA05","studioA06"],
        locationCountry: Country.kr.rawValue,
        locationCity: "Seoul",
        locationDetail: "Gangnam-ku",
        isActive: true,
        createdAt: Date(),
        updatedAt: Date(),
        contactEmail: "admin@example.com",
        contactPhone: "010-1234-5678",
        language: [Language.kr.rawValue],
        category: VendorCategory.studio.rawValue,
        reviewCount: 10,
        rating: 4.8,
        favoriteCount: 98,
        description: "We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs. We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs. We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs. We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs. We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs. We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs. We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs."
    ),
    Vendor(
        id: "studioB",
        name: "Studio Banana",
        manager: "admin1",
        images: ["studioB01","studioB02","studioB03","studioB04","studioB05","studioB06", "studioB07"],
        locationCountry: Country.kr.rawValue,
        locationCity: "Seoul",
        locationDetail: "Gangnam-ku",
        isActive: true,
        createdAt: Date(),
        updatedAt: Date(),
        contactEmail: "admin@example.com",
        contactPhone: nil,
        language: [Language.kr.rawValue, Language.jp.rawValue, Language.en.rawValue],
        category: VendorCategory.studio.rawValue,
        reviewCount: 32,
        rating: 4.5,
        favoriteCount: 48,
        description: "We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs."
    ),
    Vendor(
        id: "studioC",
        name: "Studio Cocoa",
        manager: "admin1",
        images: ["studioC01", "studioC02", "studioC03", "studioC04", "studioC05", "studioC06", "studioC07", "studioC08", "studioC09"],
        locationCountry: Country.kr.rawValue,
        locationCity: "Seoul",
        locationDetail: "Seocho-ku",
        isActive: true,
        createdAt: Date(),
        updatedAt: Date(),
        contactEmail: "studioC@example.com",
        contactPhone: "010-9000-0000",
        language: [Language.kr.rawValue],
        category: VendorCategory.studio.rawValue,
        reviewCount: 48,
        rating: 4.3,
        favoriteCount: 0,
        description: "We are a professional photo studio based in Seoul. We offer a wide range of services to suit all your needs."
    ),

    Vendor(
        id: "dressA",
        name: "Dress Dream",
        manager: "admin2",
        images: ["dressA01", "dressA02", "dressA03", "dressA04", "dressA05", "dressA06", "dressA07"],
        locationCountry: Country.kr.rawValue,
        locationCity: "Seoul",
        locationDetail: "Gangnam-ku",
        isActive: true,
        createdAt: Date(),
        updatedAt: Date(),
        contactEmail: "dressA@example.com",
        contactPhone: "010-8888-0000",
        language: [Language.kr.rawValue, Language.en.rawValue],
        category: VendorCategory.dress.rawValue,
        reviewCount: 8,
        rating: 4.8,
        favoriteCount: 17,
        description: "We provide luxury dress that is made with high quality materials and designed with care. We can make sure you are satified with your choice of dress. A dress of your dream."
    ),

    Vendor(
        id: "dressB",
        name: "Dress Elegance",
        manager: "admin2",
        images: ["dressB01", "dressB02", "dressB03", "dressB04"],
        locationCountry: Country.kr.rawValue,
        locationCity: "Seoul",
        locationDetail: "Mapo-ku",
        isActive: true,
        createdAt: Date(),
        updatedAt: Date(),
        contactEmail: "dressB@example.com",
        contactPhone: "010-8888-0001",
        language: [Language.kr.rawValue],
        category: VendorCategory.dress.rawValue,
        reviewCount: 31,
        rating: 4.2,
        favoriteCount: 46,
        description: "We provide elegant dress that is made with high quality materials and designed with care. We can make sure you are satified with your choice of dress. A dress of your dream."
    ),

    Vendor(
        id: "hmA",
        name: "HairMake Floral",
        manager: "admin3",
        images: ["hmA01", "hmA02", "hmA03", "hmA04", "hmA05", "hmA06", "hmA07", "hmA08", "hmA09"],
        locationCountry: Country.kr.rawValue,
        locationCity: "Seoul",
        locationDetail: "Jongro-ku",
        isActive: true,
        createdAt: Date(),
        updatedAt: Date(),
        contactEmail: "hairmakea@example.com",
        contactPhone: "010-7000-0000",
        language: [Language.kr.rawValue, Language.jp.rawValue],
        category: VendorCategory.hairMake.rawValue,
        reviewCount: 3,
        rating: 5.0,
        favoriteCount: 33,
        description: "We are highly motivated hair and makeup artists. We provide high quality services with a passion for beauty."
    ),

    Vendor(
        id: "hmB",
        name: "HairMake Glam",
        manager: "admin3",
        images: ["hmB01", "hmB02", "hmB03", "hmB04", "hmB05", "hmB07", "hmB08"],
        locationCountry: Country.kr.rawValue,
        locationCity: "Seoul",
        locationDetail: "Seongdong-ku",
        isActive: true,
        createdAt: Date(),
        updatedAt: Date(),
        contactEmail: "hairmakeb@example.com",
        contactPhone: "010-7000-0001",
        language: [Language.kr.rawValue],
        category: VendorCategory.hairMake.rawValue,
        reviewCount: 99,
        rating: 4.7,
        favoriteCount: 9,
        description: "We are highly motivated hair and makeup artists. We provide high quality services with a passion for beauty."
    )
]
