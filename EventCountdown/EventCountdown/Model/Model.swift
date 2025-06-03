import SwiftUI
import SwiftData

@Model
final class Item {
    var id: UUID = UUID()
    var name: String
    var detail: String
    
    var red: Double = 0.0
    var green: Double = 0.0
    var blue: Double = 0.0
    var alpha: Double = 0.0
    
    var color: Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    init(name: String, detail: String, red: Double = 0.0, green: Double = 0.0, blue: Double = 0.0, alpha: Double = 0.0) {

        self.name = name
        self.detail = detail
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}


extension Item {
    static var emptyItem: Item {
        Item(name: "", detail: "")
    }
}

extension Color {
    var components: (red: Double, green: Double, blue: Double, opacity: Double) {
        #if canImport(UIKit)
        let uiColor = UIColor(self)
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (Double(red), Double(green), Double(blue), Double(alpha))
        #else
        return (0, 0, 0, 0)
        #endif
    }
}
