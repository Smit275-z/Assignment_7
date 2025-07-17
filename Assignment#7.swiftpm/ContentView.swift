import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var numberOfPeople = 1
    @State private var selectedMeal = "Breakfast"
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    
    let meals = ["Breakfast", "Lunch", "Dinner"]
    let customBackground = Color(red: 0.95, green: 0.9, blue: 0.85) // Example custom color
    
    var body: some View {
        NavigationView {
            ScrollView { // Makes layout work well in both orientations
                VStack(spacing: 20) {
                    
                    // Restaurant name with custom font
                    Text("MyRestaurant")
                        .font(.custom("AvenirNext-Bold", size: 32)) // Example custom font
                        .padding(.top, 10)
                    
                    // Reservation image
                    Image(systemName: "fork.knife") // Replace with your own asset image if you want
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .padding(.bottom, 10)
                    
                    // Form fields
                    VStack(alignment: .leading, spacing: 15) {
                        TextField("Name", text: $name)
                            .autocapitalization(.words)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        TextField("Phone", text: $phone)
                            .keyboardType(.phonePad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Picker("Number of People", selection: $numberOfPeople) {
                            ForEach(1...10, id: \.self) { num in
                                Text("\(num)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        // Segmented picker for meal type
                        Picker("Meal", selection: $selectedMeal) {
                            ForEach(meals, id: \.self) { meal in
                                Text(meal)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    .padding(.horizontal)
                    
                    // Send button
                    Button("Send Reservation") {
                    
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
            }
            .background(customBackground.ignoresSafeArea())
            .navigationTitle("Reservation Form")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Reservation"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    ContentView()
}
