import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    var body: some View {
        Home()
    }
}

struct PhotoPickerView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoPickerView()
    }
}

struct Home: View {
    
    @State var images : [UIImage] = []
    @State var picker = false
    
    var body: some View {
        
        VStack{
            
            if !images.isEmpty{
                
                HStack(spacing: 15){
                    
                    ForEach(images, id: \.self){ img in
                        
                        Image(uiImage: img)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 30, height: 250)
                            .cornerRadius(15)
                    }
                }
            }
            else{
                
                Button(action: {
                    
                    picker.toggle()
                    
                }, label: {
                    Text("Pick Image")
                })
            }
        }
        .sheet(isPresented: $picker) {
            
            ImagePicker(images: $images, picker: $picker)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent1: self)
    }
    
    
    @Binding var images : [UIImage]
    @Binding var picker : Bool
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        
        var config = PHPickerConfiguration()
        
        config.filter = .images
        
        config.selectionLimit = 1
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        var parent : ImagePicker
        
        init(parent1: ImagePicker) {
            
            parent = parent1
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            parent.picker.toggle()
            
            for img in results{
                
                if img.itemProvider.canLoadObject(ofClass: UIImage.self){
                    
                    img.itemProvider.loadObject(ofClass: UIImage.self) { (image, err) in
                    
                        guard let image1 = image else {
                            print(err)
                            return
                        }
                        
                        self.parent.images.append(image as! UIImage)
                    }
                }
                else{
                    print("cannot be loaded")
                }
            }
        }
    }
}
