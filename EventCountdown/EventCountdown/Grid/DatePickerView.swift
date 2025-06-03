import SwiftUI

struct DatePickerView: View {
    //PROPERTIES
    @EnvironmentObject var logic: TimerLogic
    
    //BODY
    var body: some View {
            DatePicker(
                "", selection: logic.$endDate, in: Date()...,
                       displayedComponents: [.date]
            )
            .labelsHidden()
    }
}

//PREVIEW
struct TimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(TimerLogic())
    }
}
