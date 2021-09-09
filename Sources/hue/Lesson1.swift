import AudioToolbox
import CoreAudio
import Foundation

func Lesson1() {
    // declare file name as a URL
    let audioURL: URL! = URL(string: "./Files/What.mp3")

    // declare reference variables necessary for Core Audio API
    var audioFile: AudioFileID!

    //pass the url to Core Audio so it can grab the file at the specified
    //location
    var theErr: OSStatus = noErr

    theErr = AudioFileOpenURL(audioURL as CFURL,
                               AudioFilePermissions.readPermission,
                               0,
                               &audioFile)

    assert(theErr == noErr)
    var dictionarySize: UInt32 = 0

    theErr = AudioFileGetPropertyInfo(audioFile,
                                   kAudioFilePropertyInfoDictionary,
                                   &dictionarySize,
                                   nil)

    assert(theErr == noErr)

    var dictionary: CFDictionary!

    theErr = AudioFileGetProperty(audioFile,
                               kAudioFilePropertyInfoDictionary,
                               &dictionarySize,
                               &dictionary)

    assert(theErr == noErr)
    // make this into a proper function that will iterate over the dictionary keys and pairs
    print("%@", dictionary!)
    theErr = AudioFileClose(audioFile)
    assert(theErr == noErr)

    print("End of File\n")
}