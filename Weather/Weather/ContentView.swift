import SwiftUI

class City : Identifiable{
    var name : String
    var temperature : Int
    var image : Image
    init (name : String, temperature : Int, image : Image){
        self.name = name
        self.temperature = temperature
        self.image = image
    }
}

struct ContentView: View {
    let array : [City] = [
        City(name: "Tokyo, Tokyo prefecture, Japan", temperature: 14, image: Image("Tokyo")),
        City(name: "Cairo, Cairo Governorate, Egypt", temperature: 35, image: Image("Cairo")),
        City(name: "Minsk, Minsk region, Belarus", temperature: 11, image: Image("Minsk")),
        City(name: "Shanghai, China", temperature: 7, image: Image("Shanghai")),
        City(name: "Rostov-on-Don, Rostov region, Russia", temperature: 16, image: Image("Rostov-on-Don")),
        City(name: "Stockholm, Len Stockholm, Sweden", temperature: 5, image: Image("Stockholm"))
    ]
    
    @State private var searchText = ""
    
    var body: some View {
        
        ZStack(alignment: .center) {
            Spacer()
            VStack(alignment: .trailing) {
                NavigationView{
                    List{
                        TextField("Type your city",text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        ForEach(array.filter{$0.name.hasPrefix(searchText) || searchText == ""}, id: \.name){
                            obj in RecordView(obj: obj)
                        }
                    }
                    .navigationBarTitle(Text("Weather info"))
                }
            }
            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
