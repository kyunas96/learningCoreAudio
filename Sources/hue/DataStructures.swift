import AudioToolbox
import Foundation
import CoreAudio
import CoreAudioTypes

//since pointers are the only way to pass data to Core Audio, structs are
//used as data collections passed as references

public struct AudioFileProperties{
    //optional properties
    var fileType: String?
    var bitDepth: UInt32?
    //required properties
    var numChannels: UInt8!
}

//structure that will store the names as strings, making it easier to enumerate
//as members of the struct ex. AudioFormats.AIFF
public struct AudioFormats{
    static let AIFF = "kAudioFileAIFFType"
    static let AC3 = "kAudioFormatAC3"
}