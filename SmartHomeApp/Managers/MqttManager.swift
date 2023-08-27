import Foundation
import CocoaMQTT



class MQTTManager: ObservableObject, CocoaMQTTDelegate {
    
    static let shared = MQTTManager()
    private var mqttClient: CocoaMQTT
    @Published var isConnected = false
    @Published var receivedMessages: [String: String] = [:]
    
    init() {
        let clientID = "test"
        let host = "83.6.167.99"
        let port = UInt16(1883)
        self.mqttClient = CocoaMQTT(clientID: clientID, host: host, port: port)
        self.mqttClient.delegate = self
    }
    
    func connect() {
       _ = self.mqttClient.connect()
    }
    
    func sendMessage(topic: String, message: String) {
        self.mqttClient.publish(topic, withString: message, qos: .qos1)
    }
    
    func subscribeToTopic(_ topic: String) {
        self.mqttClient.subscribe(topic)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) { }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        if let stringData = message.string {
            DispatchQueue.main.async {
                self.receivedMessages[message.topic] = stringData
            }
        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) { }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) { }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) { }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) { }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) { }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) { }
    
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        if ack == .accept {
            isConnected = true
            subscribeToTopic("seks")
            subscribeToTopic("diupa")
        } else {
            isConnected = false
        }
    }
}
