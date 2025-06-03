import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Item.name) private var items: [Item]
    @State private var isPresentingNewItemView = false
    
    @Namespace private var namespace
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 2)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(items, id: \.self) { item in
                        NavigationLink {
                            ItemDetailView(item: item)
                                .navigationTransition(.zoom(sourceID: item.id, in: namespace))
                        } label: {
                            ItemGridView(item: item)
                                .matchedTransitionSource(id: item.id, in: namespace)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .toolbar {
                Button {
                    isPresentingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isPresentingNewItemView) {
                NewItemView(selectedColor: .white, isPresentingNewItemView: $isPresentingNewItemView)
            }
            .navigationTitle("Journals")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
