import SwiftUI

struct RecordView: View {
    let obj: City
    var body: some View {
        
        HStack() {
            obj.image
                .resizable()
                .frame(width: 110, height: 70)
                .cornerRadius(6.0)
                .padding()
            VStack(alignment: .leading, spacing: 3) {
                Text(obj.name).font(.headline)
                Text(String(obj.temperature) + "°C").font(.subheadline)
            }
        }.accessibilityScrollAction({ edge in
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        })
    }
}
