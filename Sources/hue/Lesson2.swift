import AudioToolbox
import CoreAudio
import CoreAudioTypes
import Foundation

func Lesson2() {
    let SAMPLE_RATE = 44100.00
    let DURATION = 5.0
    let FILE_NAME_FORMAT = "%0.3f-square.aif"

    //check is enough args
    if CommandLine.arguments.count < 2 {
        fatalError("Not enough arguments")
    }

    //initialize frequency
    guard let frequency = Double(CommandLine.arguments[1]) else{
        exit(1);
    }

    print("\(String(describing: frequency))")
    assert(frequency > 0.0)
    print("Generating tone\n")

    //create URL for Audio File
    let filePath = "./Files/" + String(format: FILE_NAME_FORMAT, frequency)
    let fileURL = URL(fileURLWithPath: filePath)
    print(fileURL)

    //Create and setup AudioStreamBasicDescription
    var asbd = AudioStreamBasicDescription()
    asbd.mSampleRate = SAMPLE_RATE
    asbd.mFormatID = kAudioFormatLinearPCM
    //have Core Audio figure the rest out based on AIFFType
    asbd.mFormatFlags = kAudioFileAIFFType 
                // | kAudioFormatFlagIsPacked 
                // | kAudioFormatFlagIsPacked 
                // | kAudioFormatFlagIsBigEndian 
                // | kAudioFormatFlagIsSignedInteger

    //Set format independent properties
    //?is setting packet info a fallback in case the format needs it?
    asbd.mBitsPerChannel = 32
    asbd.mChannelsPerFrame = 1
    asbd.mFramesPerPacket = 1
    asbd.mBytesPerFrame = 4
    asbd.mBytesPerPacket = 4

    var audioFile: AudioFileID!

    var audioErr = AudioFileCreateWithURL(fileURL as CFURL,
                                          kAudioFileAIFFType,
                                          &asbd,
                                          .eraseFile,
                                          &audioFile)

    print(audioErr)
    assert(audioErr == noErr)

    let maxSampleCount = UInt64(SAMPLE_RATE * DURATION) //220,500 samples/frames
    var sampleCount: Int64 = 0
    var bytesToWrite: UInt32 = 4
    //tells how many wavelengths/cycles are in a second of data
    let wavelengthInSample = UInt64(SAMPLE_RATE / frequency) // 100

    while sampleCount < maxSampleCount {
        for i in 0 ..< wavelengthInSample {
            var sample: Int32

            if(i < wavelengthInSample/2){
                sample = Int32.max.bigEndian
            }else{
                sample = Int32.min.bigEndian
            }

            audioErr = AudioFileWriteBytes(
                        audioFile,
                        false,
                        sampleCount * 4,
                        &bytesToWrite,
                        &sample
                        )
            
            assert(audioErr == noErr)
            sampleCount += 1
        }
    }

    audioErr = AudioFileClose(audioFile)
    assert(audioErr == noErr)
}
