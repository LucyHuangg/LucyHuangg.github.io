import SwiftUI

struct ItemDetailView: View {
    @Bindable var item: Item
    @EnvironmentObject var logic: TimerLogic
    
    var body: some View {
            
        VStack(alignment: .center) {
            ZStack {
                Text(item.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    
                    .padding()
                
                RoundedRectangle(cornerRadius: 30)
                    .padding()
                    .frame(maxHeight: 170)
                    .foregroundStyle(item.color)
                    .padding()
            }
            Spacer()
            TimerView()
            Spacer()
            Spacer()
            ButtonView()
                .padding()
            Text(item.detail)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }

#Preview {
    ItemDetailView(item: Item(name: "Sample Item", detail: "Detail", red: 0.5, green: 0.5, blue: 1.0, alpha: 0.8))
        .environmentObject(TimerLogic())
}
