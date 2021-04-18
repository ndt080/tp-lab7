import SwiftUI

struct ContentView: View {
    @State var age: String = "21"
    @State var height: String = "176"
    @State var weight: String = "73"
    @State var gender: String = "male"
    @State var training: String = "0"
    @State private var genders = ["male","female"]
    @State private var trainings = ["0","1-3","3-5","6-7"]
    
    func CalcInd(height: Double, weight: Double) -> String {
        return String(Int(weight / height * 10000 / height))
    }
    
    func CalcCalories(gender: String, age: Double, height: Double, weight: Double) -> String {
        if gender == "female"
        {
            let tmp : Double = 2 * height - 5 * age
            return  String(Int(655  + 10 * weight + tmp))
        }
        let tmp : Double = 5 * height - 7 * age
        return String(Int(66  + 14 * weight + tmp))
    }
    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center){
                VStack(){
                    Text ("What is your gender?")
                    Picker("Genders", selection: $gender) {
                        ForEach(genders, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }.padding()
                
                HStack(alignment: .center){
                    Text("Age: ")
                    TextField("Enter your age", text: $age)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack(alignment: .center){
                    Text("Height: ")
                    TextField("Enter your height", text: $height)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack(alignment: .center){
                    Text("Weight: ")
                    TextField("Enter your weight", text: $weight)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack(){
                    Text("How much you training each week?")
                    Picker("Trainings", selection: $training) {
                        ForEach(trainings, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }.padding()

                Spacer()
                
                VStack(){
                    Text("You need calories every day: \n" + CalcCalories( gender : gender, age: Double(age) ?? 18, height : Double(height) ?? 180, weight : Double(weight) ?? 70))
                        .multilineTextAlignment(.center)
                    Text("Your index of body weight: \n" + CalcInd(height: Double(height) ?? 180, weight: Double(weight) ?? 70))
                        .multilineTextAlignment(.center)
                }.padding()
                .background(Color(.systemGray5))
                .cornerRadius(15.0)
            }
            .navigationBarTitle(Text("Calories calculator"))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.all, 25)
            
        }

    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
