//MARK: connection with mqtt
//import SwiftUI
//
//struct SettingsView: View {
//    @StateObject var mqttManager = MQTTManager.shared
//    @State private var messageToSend = ""
//
//    var body: some View {
//        VStack {
//            if mqttManager.isConnected {
//                Text("Connected to MQTT broker")
//            } else {
//                Text("Not connected")
//            }
//
//            ForEach(mqttManager.receivedMessages.sorted(by: { $0.key < $1.key }), id: \.key) { topic, message in
//                Text("Topic: \(topic), Message: \(message)")
//
//            }
//
//
//            TextField("Type a message", text: $messageToSend)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//
//            Button("Connect MQTT") {
//                mqttManager.connect()
//            }
//            .padding()
//
//            Button("Send MQTT Message") {
//                mqttManager.sendMessage(topic: "diupa", message: messageToSend)
//                messageToSend = "" // Clear the text field after sending
//            }
//            .padding()
//        }
//    }
//}
//
//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}

import SwiftUI

struct SettingsView: View {
    
    @Binding var toogle: Bool
    private let languageOptions: [String] = [
        "Polish", "English"
    ]
    @Binding var selectedOption: String
    
    var body: some View {
        ScrollView {
            VStack {
                Image("logoKEM")
                    .resizable()
                    .scaledToFit()
                
                CustomRowComponent(symbol: "moon.stars.fill", variant: .toggle(text: "Dark mode", binding: $toogle))
                
                CustomRowComponent(symbol: "character.bubble.fill", variant: .language(text: "Language", options: languageOptions, selectedOption: $selectedOption))
                
                CustomRowComponent(symbol: "doc.text.fill", variant: .plainText(text: "Privacy Policy", action: { } ))
                
                CustomRowComponent(symbol: "list.star", variant: .plainText(text: "Terms & Conditions", action: { } ))
                
                CustomRowComponent(symbol: "envelope.fill", variant: .plainText(text: "Contact Us", action: { } ))
                
                CustomRowComponent(symbol: "person.2.fill", variant: .plainText(text: "Our Team", action: { } ))
                Spacer()
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(toogle: .constant(false), selectedOption: .constant("Polish"))
    }
}
