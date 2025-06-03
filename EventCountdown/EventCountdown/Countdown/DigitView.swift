import SwiftUI

struct DigitView: View {
    // PROPERTIES
    var time: Int
    var place: String
    
    //BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            Text("\(time)")
                .font(.system(.title, design: .rounded))
                .fontWeight(.semibold)
            
            Text(place)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
        }
    }
}

//PREVIEW
struct DigitView_Previews: PreviewProvider {
    static var previews: some View {
        DigitView(time: 20, place: "MIN")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
