import SwiftUI
import PhotosUI

struct ItemDetailView: View {
    @Bindable var item: Item
    
    @State private var imageItem = [PhotosPickerItem]()
    @State private var selectedImage = [Image]()
    
    @State private var selectedBgColor: Color = .gray
    @State private var selectedNameColor: Color = .black
    @State private var selectedTextColor: Color = .black
    
    var body: some View {
        VStack() {
            Text(item.name)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                .foregroundStyle(selectedNameColor)
            
                .padding(.bottom, 10)
            
            PhotoPickerView()
            
                .padding(20)
            
            Text(item.detail)
                .padding()
                .foregroundStyle(selectedTextColor)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(item.color)
    }
}

#Preview {
    ItemDetailView(item: Item(name: "Sample Item", detail: "Detail", date: Date(), red: 0.5, green: 0.5, blue: 1.0, alpha: 0.8))
}
