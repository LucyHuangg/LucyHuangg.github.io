import SwiftUI

class TimerLogic: ObservableObject {
    
    var currentDate = Date()
    var days: Int = 0
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @AppStorage("isTimerRunning") var isTimerRunning: Bool = false
    @AppStorage("endDate") var endDate = Date()
    
    func getTime(from date: Date, untill nowDate: Date) -> (Int, Int, Int, Int) {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([ .day, .hour, .minute, .second], from: date, to: nowDate)
        
        return (
            components.self.day ?? 0,
            components.self.hour ?? 0,
            components.self.minute ?? 0,
            components.self.second ?? 0,
        )
    }
}

//extension Date {
    //var components: (day: Int, hour: Int, minute: Int, second: Int) {
        //#if canImport(UIKit)
        //let uiDate = self as Date
        //var day: Int = 0, hour: Int = 0, minute: Int = 0, second: Int = 0
//}
