






import Foundation

enum Country: String, Identifiable, CaseIterable {
    var id: Self { self }

    case none = "Not Selected"
    case kr = "Korea"
    case jp = "Japan"
}

enum City: String, Identifiable, CaseIterable {
    var id: Self { self }
    
    case none = "Not Selected"
    case seoul = "Seoul"
    case busan = "Busan"
    case tokyo = "Tokyo"
}

enum Language: String {
    case kr = "Korean"
    case jp = "Japanese"
    case en = "English"
}
