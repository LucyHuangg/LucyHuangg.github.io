import SwiftUI

struct TimerView: View {
    //PROPERTIES
    let places: [String] = [ "DAY", "HOUR", "MIN", "SEC"]
    @EnvironmentObject var logic: TimerLogic
    
    //BODY
    var body: some View {
        
            HStack(alignment: .center, spacing: 30) {
                DigitView(time: logic.days, place: places[0])
                DigitView(time: logic.hours, place: places[1])
                DigitView(time: logic.minutes, place: places[2])
                DigitView(time: logic.seconds, place: places[3])
                
            }.onReceive(logic.timer, perform: { _ in
            let timer = Timer(timeInterval: 1, repeats: true) { Timer in
                    logic.currentDate = Date()
                    let (d,h,m,s) = logic.getTime(from: logic.currentDate, untill: logic.endDate)
                    logic.days = d
                    logic.hours = h
                    logic.minutes = m
                    logic.seconds = s
            }
            
            if logic.currentDate == logic.endDate {
                logic.isTimerRunning = false
            }
            
            logic.isTimerRunning ? timer.fire() : timer.invalidate()
        })
    }
}

//PREVIEW
struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(TimerLogic())
    }
}
