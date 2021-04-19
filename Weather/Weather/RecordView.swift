import SwiftUI

func TempetratureToColor(t : Int) -> Color {
    switch t {
    case 27..<60:
        return .red
    case 22..<27:
        return .orange
    case 14..<27:
        return .yellow
    case (1)..<13:
        return .blue
    case (-100)..<0:
        return .primary
    default:
        return .black
    }
}

struct RecordView: View {
    let obj: City

    var body: some View {
        let color : Color = TempetratureToColor(t: obj.temperature)
        
        HStack() {
            obj.image
                .resizable()
                .frame(width: 110, height: 70)
                .cornerRadius(6.0)
                .padding()
            VStack(alignment: .leading, spacing: 3) {
                Text(obj.name).font(.headline)
                
                Text(String(obj.temperature) + "°C").font(.subheadline).foregroundColor(color)
            }
        }.accessibilityScrollAction({ edge in
            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
        })
    }
}
