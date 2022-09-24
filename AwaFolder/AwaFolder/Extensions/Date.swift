import Foundation

fileprivate var formatter: DateFormatter {
    let format = DateFormatter()
    format.dateStyle = .medium
    format.timeStyle = .none
    format.dateFormat = "yyyy/MM/dd"
    return format
}

extension Date {
    var string: String {
        return formatter.string(from: self)
    }

    init?(dateString: String, dateFormat: String = "yyyy/MM/dd") {
        formatter.dateFormat = dateFormat
        guard let date = formatter.date(from: dateString) else { return nil }
        self = date
    }
}
