import AudioToolbox
import CoreAudio
import CoreAudioTypes
import Foundation

// user data struct

class MyRecorder {
    var recordFile: AudioFileID!
    var recordPacket: Int64 = 0
    var running: Bool = false
}

// utility functions

// record callback function
// written as a lambda function that is stored in a variable
// this is just the function signature to pass compilation



func Lesson4() -> Int{
    let kNumberRecordBuffers = 3
    var recorder = MyRecorder()
    // Setup format
    var recordFormat = AudioStreamBasicDescription()
    recordFormat.mFormatID = kAudioFormatMPEG4AAC
    recordFormat.mChannelsPerFrame = 2
    var error = MyGetDefaultInputDeviceSampleRate(&recordFormat.mSampleRate)

    // var ASBDSize = MemoryLayout.size(ofValue: recordFormat).toUInt32()
    // CheckError(AudioFormatGetProperty(
    //     kAudioFormatProperty_FormatInfo,
    //     0,
    //     nil,
    //     &ASBDSize,
    //     &recordFormat
    // ), "AudioFormetGetProperty failed")

    // // Setup queue
    // var queue: AudioQueueRef?
    // CheckError(AudioQueueNewInput(
    //     &recordFormat,
    //     MyAQInputCallback,
    //     &recorder,
    //     nil,
    //     nil,
    //     0,
    //     &queue
    // ), "AudioQueueNewInput failed")

    // CheckError(AudioQueueGetProperty(
    //     queue!,
    //     kAudioConverterCurrentOutputStreamDescription,
    //     &recordFormat,
    //     &ASBDSize
    // ), "AudioQueueGetProperty failed")

    // // Set up file
    // let myFileURL: CFURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
    //                                                      "output.caf" as CFString,
    //                                                      .cfurlposixPathStyle,
    //                                                      false)

    // CheckError(AudioFileCreateWithURL(myFileURL,
    //                                   kAudioFileCAFType,
    //                                   &recordFormat,
    //                                   .eraseFile,
    //                                   &recorder.recordFile), "AudioFileCreateWithURL failed")

    // // Other setup as needed

    // // recorder.recordFile = MyCopyEncoderCookieToFile(queue)

    // bufferByteSize: Int64 = MyComputeRecordBufferSize(&recordFormat, queue, 0.5)
    // //initialize and enqueue the number of Buffers denoted by the const variable
    // // kNumberRecordBuffers
    // for _ in 0...kNumberRecordBuffers {
    //     let buffer: AudioQueueBufferRef
    //     CheckError(AudioQueueAllocateBuffer,
    //         bufferByteSize,
    //         &buffer
    //         ), "AudioQueueAllocateBuffer failed")

    //     CheckError(AudioQueueEnqueueBuffer(queue,
    //         buffer,
    //         0,
    //         nil,
    //     ), "AudioQueueEnqueueBuffer failed")
    // }
    // // Start Queue
    // recorder.running = true
    // CheckError(AudioQueueStart(queue,
    //     nil
    //     ),"AudioQueueStart failed")

    // print("Recording press <return> to stop: \n")
    // readLine()

    // // Stop Queue
    //  print("*recording done*\n")
    // recorder.running = false
    // CheckError(AudioQueueStop(queue,
    //     true), "AudioQueueStop failed")

    // //once AudioQueue is done with the stream, it may have updated information
    // //that must be extracted
    // MyCopyEncoderCookieToFile(queue, recorder.recordFile)
    // AudioQueueDispose(queue, true)

    // AudioFileClose(recorder.recordFile)
    return 0

}
