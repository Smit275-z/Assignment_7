import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var numberOfPeople = 1
    @State private var selectedMeal = "Breakfast"
    @State private var showAlert = false
    @State private var alertMessage = ""

    let customBackground = Color(red: 0.95, green: 0.9, blue: 0.85) // Custom color

    var body: some View {
        NavigationView {
            ScrollView { //  Layout for both orientations
              
            }
            .background(customBackground.ignoresSafeArea())
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Reservation"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    ContentView()
}
