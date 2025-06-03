import SwiftUI
import SwiftData

struct NewItemView: View {
    @Environment(\.modelContext) private var modelContext
    
    @AppStorage("isTimerRunning") var isTimerRunning: Bool = false
    @EnvironmentObject var logic: TimerLogic
    
    @State private var newItem = Item.emptyItem
    @State private var selectedColor: Color = .gray
    
    @Binding var isPresentingNewItemView: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Event Name", text: $newItem.name)
                HStack {
                    DatePickerView()
                    Spacer()
                    ColorPicker("", selection: $selectedColor)
                        .labelsHidden()
                }
                TextField("Description", text: $newItem.detail, axis: .vertical)
                    .lineLimit(20, reservesSpace: true)
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
            .navigationTitle("New Item")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NewItemView(isPresentingNewItemView: .constant(true))
        .environmentObject(TimerLogic())
}
