import SwiftUI
import SwiftData
import PhotosUI

struct NewItemView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var pickedDate = Date()
    
    @State private var imageItem = [PhotosPickerItem]()
    @State private var selectedImage = [Image]()
    
    @State private var newItem = Item.emptyItem
    @State var selectedColor: Color
    @State private var selectedBgColor: Color = .gray
    @State private var selectedNameColor: Color = .black
    @State private var selectedTextColor: Color = .black
    
    @Binding var isPresentingNewItemView: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                HStack {
                    //Name Field
                    TextField("Event Name", text: $newItem.name)
                        .foregroundStyle(selectedNameColor)
                    ColorPicker("", selection: $selectedNameColor)
                        .labelsHidden()
                }
                
                .padding(.vertical, 8)
                //Date Field
                DatePicker("Choose a Date", selection: $pickedDate, in: ...Date(), displayedComponents: .date)
                
                    .padding(.vertical, 8)
                //Backgrund Color Field
                HStack {
                    ColorPicker("Background Color", selection: $selectedBgColor)
                }
                .padding(.vertical, 8)
                    //Description Field
                    TextField("Description", text: $newItem.detail, axis: .vertical)
                        .lineLimit(10, reservesSpace: true)
                        .foregroundStyle(selectedTextColor)
                        .padding(.vertical, 8)
                    ColorPicker("Description Text Color", selection: $selectedTextColor)
                    .padding(.vertical, 8)
            }
            .toolbar {
                    Button("Done") {
                    let comp = selectedColor.components
                    newItem.red = comp.red
                    newItem.green = comp.green
                    newItem.blue = comp.blue
                    newItem.alpha = comp.opacity
                    
                    modelContext.insert(newItem)
                    isPresentingNewItemView = false
                }
                .disabled(newItem.name.isEmpty)
            }
            .navigationTitle("New Journal")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NewItemView(selectedColor: .white, isPresentingNewItemView: .constant(true))
}
