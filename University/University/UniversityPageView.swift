import SwiftUI

struct UniversityPageView: View {
    let obj: City

    var body: some View {         
        
        ScrollView() {
            VStack() {
                HStack(alignment: .center) {
                    obj.image
                        .resizable()
                        .frame(width: 320, height: 210, alignment: .center)
                        .cornerRadius(6.0)
                }.padding(.vertical)
                
                VStack() {
                    Text(obj.name).font(.title).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).multilineTextAlignment(.trailing)
                    Text(obj.city).font(.subheadline).multilineTextAlignment(.trailing)
                }
                VStack(){
                    Text(obj.description).multilineTextAlignment(.leading)
                }.padding(.vertical)
            }
            .padding(.all)
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(LinearGradient(gradient: Gradient(colors: [Color(hex: 0xebedee), Color(hex: 0xe2ebf0)]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
        .navigationBarTitle(Text(obj.name), displayMode: .inline)
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

