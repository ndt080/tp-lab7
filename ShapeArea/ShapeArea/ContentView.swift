import SwiftUI

struct ContentView: View {
    @State var a: String = "20"
    @State var b: String = "20"
    @State var c: String = "20"
    @State var calc: String = ""
    @State var shape: String = ""
    @State var shapes = ["triangle","rectangle","trapezoid"]
    
    func CalcArea(shape : String, a : Double, b : Double, c : Double) -> String {
        switch shape {
        case "triangle":
            let p : Double = (a + b + c) / 2
            return String(Int(sqrt(p * (p - a) * (p - b) * (p - c))))
        case "rectangle":
            return String(Int(a * b))
        case "trapezoid":
            return String(Int(0.5 * (a + b) * c))
        default:
            return "Error"
        }
    }
    
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView{
                VStack(){
                    VStack(){
                        Text("What shape area do you want to calculate?")
                        Picker("Trainings", selection: $shape) {
                            ForEach(shapes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }.padding()
                    
                    HStack(alignment: .center){
                        Text("Side a: ")
                        TextField("Enter side a", text: $a)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(.horizontal)
                    
                    HStack(alignment: .center){
                        Text("Side b: ")
                        TextField("Enter side b", text: $b)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }.padding(.horizontal)
                    
                    if(shape == "triangle"){
                        HStack(alignment: .center){
                            Text("Side c: ")
                            TextField("Enter side c", text: $c)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding(.horizontal)
                    }
                    if(shape == "trapezoid"){
                        HStack(alignment: .center){
                            Text("Heigth: ")
                            TextField("Enter heigth", text: $c)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding(.horizontal)
                    }
                    
                    Button(
                        action: {
                            calc = CalcArea(shape : shape, a : Double(a) ?? 20, b : Double(b) ?? 20, c : Double(c) ?? 20)
                            
                        }, label: {
                            Text("Calculate")
                        }
                    )
                    .buttonStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Button Style@*/DefaultButtonStyle()/*@END_MENU_TOKEN@*/)
                    
                    
                    VStack(){
                        Text(shape + " area: " + calc)
                            .multilineTextAlignment(.center)
                    }.frame(minWidth: 280, minHeight: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color(.systemGray5))
                    .cornerRadius(15.0)
                    .padding(.all, 30)
                    
                    Spacer()
                }
                
                .navigationBarTitle(Text("Shape area calc"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
