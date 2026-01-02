






import Foundation


func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd"
    formatter.locale = Locale(identifier: "ko_KR") 
    return formatter.string(from: date)
}
