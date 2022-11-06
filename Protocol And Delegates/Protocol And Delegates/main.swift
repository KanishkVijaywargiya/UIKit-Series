// Protocol & Delegate

protocol AdvanceLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvanceLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanceLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The paramedic does chest compression, 30 per second.")
    }
}

class Doctor: AdvanceLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    func performCPR() {
        print("The doctor does chest compression, 30 per second.")
    }
    func useStethoscope() {
        print("Listening for heart sounds.")
    }
}

class Surgeons: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Surgeons, Sings All Is Well !!!")
    }
    func useElectricDrill() {
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio)//peramedic
let kanishk = Surgeons(handler: emilio)//surgeon

emilio.assessSituation()
emilio.medicalEmergency()
