import SwiftUI

struct ItemGridView: View {
    @Bindable var item: Item
    
    let places: [String] = [ "DAY", "HOUR", "MIN", "SEC"]
    @EnvironmentObject var logic: TimerLogic
    
    var body: some View {
        VStack {
            Text("\(logic.days)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(width: 180, height: 180)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(item.color))
            
                .padding(6)
            Text(item.name)
                .font(.callout)
        }
        .contextMenu {
                Button("Delete", role: .destructive, action: {})
        }
    }
}

#Preview {
    ItemGridView(item: Item(name: "Sample Item", detail: "Detail", red: 0.5, green: 0.5, blue: 1.0, alpha: 0.8))
        .environmentObject(TimerLogic())
}
