import SwiftUI

struct ButtonView: View {
    //PROPERTIES
    @EnvironmentObject var logic: TimerLogic
    
    //BODY
    var body: some View {
        
        HStack(alignment: .center, spacing: 5) {
            Button(action: {
                logic.isTimerRunning.toggle()
            }
                   , label: {
                Spacer()
                Image(systemName: logic.isTimerRunning ? "pause.circle" : "play.fill")
                    .font(.title2)
                    .foregroundStyle(.white)
                Text(logic.isTimerRunning ? "Pause" : "Resume")
                    .font(.system(.title2, design: .rounded))
                    .foregroundStyle(.white)
                Spacer()
                
            })//BUTTON
            .padding(15)
            .background(logic.isTimerRunning ? Color(.systemGray) : Color(.systemIndigo))
            .clipShape(Capsule())
        
        }//HStack
    }
}

//PREVIEW
struct ResetView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
            .environmentObject(TimerLogic())
    }
}
