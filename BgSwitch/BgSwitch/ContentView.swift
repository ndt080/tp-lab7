
import SwiftUI

struct ContentView: View {
    @State private var vibrateOnRing = true
    
    var body: some View {
        
        HStack(alignment: .center) {
            Spacer()
            VStack(alignment: .trailing) {
                Toggle("", isOn: $vibrateOnRing)
            }
            .toggleStyle(SwitchToggleStyle())
            .fixedSize()
            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(
            Image(vibrateOnRing ? "Image" : "Image-1").resizable()
        ).edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
