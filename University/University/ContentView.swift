import SwiftUI

class City : Identifiable{
    var name : String
    var city : String
    var description : String
    var image : Image
    init (name : String, city : String, description : String, image : Image){
        self.name = name
        self.city = city
        self.description = description
        self.image = image
    }
}

struct ContentView: View {
    let array : [City] = [
        City(name: "Tokyo University",
             city: "Tokyo, Tokyo prefecture, Japan",
             description: "One of the most famous universities in Japan, also famous for its research laboratories. The University of Tokyo has five campuses - in Hongo, Komaba, Kashiwa, Shirokane and Nakano-and 10 faculties with 30,000 students combined, including about 2,100 foreigners.",
             image: Image("Tokyo")),
        City(name: "Cairo University",
             city: "Cairo, Cairo Governorate, Egypt",
             description: "Cairo University is the oldest European-type university in Egypt, Giza. One of the oldest secular universities in the Arab world; the second highest institution in the country after Al-Azhar University, located in the same Cairo. It includes 26 faculties. About 200 thousand students, more than 12 thousand teachers. The teaching is conducted in Arabic, and in English and French at the Faculties of Science and Technology.",
             image: Image("Cairo")),
        City(name: "Belarusian State University (BSU)",
             city: "Minsk, Minsk region, Belarus",
             description: "Belarusian State University is a leading higher education institution in Belarus, located in Minsk. It was opened on October 30, 1921. In Soviet times, it was called the 'Belarusian University named after V. I. Lenin'. The BSU complex includes: 20 faculties and educational institutes; 5 institutions of retraining and advanced training. About 30 thousand students, more than 3 thousand teachers.",
             image: Image("Minsk")),
        City(name: "Shanghai University",
             city: "Shanghai, China",
             description: "State University of China, located in Shanghai, also known as 'Shanda'. Founded in 1922, the university is known as one of the oldest and most prestigious educational institutions in China. Shanghai University is one of the leading research universities in the country. Currently, Shanghai University is the largest educational institution in Shanghai and is under the administration of the People's Government of the City of Shanghai. The University has 11 research institutes that study sociology, linguistics and literature, mathematics, physics, mechanical engineering, materials science, metallurgy, electrical engineering, and high technology. Training is conducted in 37 doctoral, 131 master's and 67 bachelor's specialties. The university also conducts 4 state programs and 8 programs at the municipal level.",
             image: Image("Shanghai")),
        City(name: "Rostov State University of Railway Transport (RSUPS)",
             city: "Rostov-on-Don, Rostov region, Russia",
             description: "Rostov State University of Railway Transport (RSUPS) is a Russian university in the city of Rostov — on-Don. It is subordinated to the Ministry of Transport of the Russian Federation in the person of the Federal Agency for Railway Transport and its Southern Department.",
             image: Image("Rostov-on-Don")),
        City(name: "Stockholm University",
             city: "Stockholm, Len Stockholm, Sweden",
             description: "Stockholm University is a public university in Stockholm, Sweden. The university has more than 50 thousand students, 5 thousand employees and about 2 thousand graduate students. It has existed since 1878 as a university college (Stockholm högskola). It is famous for the fact that in 1889 the Department of Mathematics was awarded to Sofia Kovalevskaya, the third female professor in Europe. Since 1904, the college has officially conferred degrees, and since 1960 it has received the status of a university. There are four faculties. Most of the university's institutions since 1970 are located in the Frescati district, north of the city center (Universitetet metro station).",
             image: Image("Stockholm"))
    ]
    
    @State private var searchText = ""
    @State private var showConnectionAlert = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .trailing) {
                NavigationView{
                    List{
                        TextField("Type university",text: $searchText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        ForEach(array.filter{$0.name.contains(searchText) || searchText == ""}, id: \.name){
                            obj in
                            NavigationLink(
                                destination: UniversityPageView(obj: obj)) {
                                RecordView(obj: obj)
                            }
                        }
                    }
                    .navigationBarTitle(Text("University info"))
                    .navigationTitle(/*@START_MENU_TOKEN@*/"Title"/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
