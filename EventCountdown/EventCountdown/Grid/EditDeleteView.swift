import SwiftUI

struct EditDeleteView: View {
    
    @Bindable var item: Item
    @State private var isPresentingNewItemView = false
    @Namespace private var namespace
    
    var body: some View {
        ItemGridView(item: item)
            .contextMenu {
                    Button("Delete", role: .destructive, action: {})
            }
    }
}

#Preview {
    EditDeleteView(item: Item(name: "Sample Item", detail: "Detail", red: 0.5, green: 0.5, blue: 1.0, alpha: 0.8))
        .environmentObject(TimerLogic())
}
