import Foundation
import AudioToolbox
import CoreAudio
import CoreAudioTypes


// function that will create an audio file based on the ASBD passed in
func createAudioFile(_ input: AudioStreamBasicDescription) {

}

/*function that will create an AudioStreamBasicDescription based on the desired
file type, let Core Audio set most of the fields for you*/
func createAudioStreamBasicDescription(_ fileDescription: AudioFileProperties) -> AudioStreamBasicDescription{
    return AudioStreamBasicDescription()
}

func setDepth(_ input: AudioStreamBasicDescription,_ numChannels: Int, _ bitDepth: UInt32){

}

//function will take in the list of supported Core Audio formats enumerated
//in the AudioFormats struct and prints information pertaining to each of them
//using AudioFileGetGlobalInfo()
func enumerateFormats(_ formatIndex: AudioFormats){

}
