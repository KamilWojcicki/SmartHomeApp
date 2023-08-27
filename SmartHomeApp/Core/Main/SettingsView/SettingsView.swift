import SwiftUI

struct SettingsView: View {
    @StateObject var mqttManager = MQTTManager.shared
    @State private var messageToSend = ""
    
    var body: some View {
        VStack {
            if mqttManager.isConnected {
                Text("Connected to MQTT broker")
            } else {
                Text("Not connected")
            }
            
            ForEach(mqttManager.receivedMessages.sorted(by: { $0.key < $1.key }), id: \.key) { topic, message in
                Text("Topic: \(topic), Message: \(message)")
                
            }
            
            
            TextField("Type a message", text: $messageToSend)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Connect MQTT") {
                mqttManager.connect()
            }
            .padding()
            
            Button("Send MQTT Message") {
                mqttManager.sendMessage(topic: "diupa", message: messageToSend)
                messageToSend = "" // Clear the text field after sending
            }
            .padding()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
