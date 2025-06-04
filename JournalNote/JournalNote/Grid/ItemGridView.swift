import SwiftUI

struct ItemGridView: View {
    @Bindable var item: Item
    
    @State private var pickedDate = Date()
    
    @State private var selectedBgColor: Color = .gray
    @State private var selectedNameColor: Color = .white
    @State private var selectedTextColor: Color = .black

    var body: some View {
        VStack {
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(selectedNameColor)
            
            Spacer()
            
            Text(pickedDate.formatted(date: .abbreviated, time: .omitted))
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding(25)
        .frame(width: 180, height: 180)
        .background(RoundedRectangle(cornerRadius: 24)
                .fill(item.color))
    
        .padding(6)
        
        .contextMenu {
                Button("Delete", role: .destructive, action: {})
        }
    }
}

#Preview {
    ItemGridView(item: Item(name: "Sample Item", detail: "Detail", date: Date(), red: 0.5, green: 0.5, blue: 1.0, alpha: 0.8))
}
