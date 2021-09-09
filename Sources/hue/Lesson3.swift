import AudioToolbox
import CoreAudio
import CoreAudioTypes
import Foundation

func Lesson3() {
    //describe the file type and format that we want information about
    var fileTypeAndFormat = AudioFileTypeAndFormatID()
    fileTypeAndFormat.mFileType = kAudioFileAIFFType
    fileTypeAndFormat.mFormatID = kAudioFormatLinearPCM

    //delcare status var to store the result of Core Audio calls
    var audioErr = OSStatus()

    // stores the number of bytes that are allocated for the message
    var infoSize = UInt32(0)

    //get size of data to be returned
    audioErr = AudioFileGetGlobalInfoSize(
        kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat,
        UInt32(MemoryLayout<AudioFileTypeAndFormatID>.size),
        &fileTypeAndFormat,
        &infoSize
    )

    assert(audioErr == noErr)

    //determine the number of ASBDs that will be returned
    let asbdCount = Int(infoSize) / MemoryLayout<AudioStreamBasicDescription>.size
    //declare an array of ASBDs of length asbdCount
    var asbds = [AudioStreamBasicDescription](
        repeating: AudioStreamBasicDescription(), 
        count: asbdCount
        )

    audioErr = AudioFileGetGlobalInfo(
        kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat,
        UInt32(MemoryLayout<AudioFileTypeAndFormatID>.size),
        &fileTypeAndFormat,
        &infoSize,
        &asbds
    )

    assert(audioErr == noErr)

    print(asbdCount)

    for index in 0 ... asbdCount - 1 {
        let format: UInt32 = asbds[index].mFormatID.bigEndian
        let array = withUnsafeBytes(of: format, Array.init)
        print(
            "\(index): " +
                "mformatID: \(String(cString: array)), " +
                "mFormatFlags: \(asbds[index].mFormatFlags), " +
                "mBitsPerChannel: \(asbds[index].mBitsPerChannel)"
        )
    }
}