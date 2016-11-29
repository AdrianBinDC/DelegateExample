//
//  CanSpeak.swift
//  DeleteMe
//
//  Created by Adrian B on 11/28/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import AVFoundation

protocol CanSpeakDelegate: class {
    func speechSynthesizerDone(sender: CanSpeak)
}

class CanSpeak: NSObject, AVSpeechSynthesizerDelegate {

    let voices = AVSpeechSynthesisVoice.speechVoices()
    let voiceSynth = AVSpeechSynthesizer()
    var voiceToUse: AVSpeechSynthesisVoice?
    weak var delegate: CanSpeakDelegate?

    override init(){
        super.init()
        voiceToUse = AVSpeechSynthesisVoice.speechVoices().filter({ $0.name == "Karen" }).first
        // CanSpeak's voiceSynth is a delegate of AVSpeechSynthesizer
        voiceSynth.delegate = self
    }

    func sayThis(_ phrase: String){
        let utterance = AVSpeechUtterance(string: phrase)
        utterance.voice = voiceToUse
        utterance.rate = 0.5
        voiceSynth.speak(utterance)
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("DONE SPEAKING")
        delegate?.speechSynthesizerDone(sender: self)
    }

}
