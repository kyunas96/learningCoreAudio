import AudioToolbox
import CoreAudio
import CoreAudioTypes
import Foundation

func MyGetDefaultInputDeviceSampleRate(
    _ outSampleRate: UnsafeMutablePointer<Float64>) -> OSStatus {
    var error: OSStatus
    var deviceID: AudioDeviceID = 0

    var propertyAddress = AudioObjectPropertyAddress(
        mSelector: kAudioHardwarePropertyDefaultInputDevice,
        mScope: kAudioObjectPropertyScopeGlobal,
        mElement: 0
    )
    var propertySize: UInt32
    propertySize = MemoryLayout<AudioDeviceID>.size.toUInt32()
    error = AudioObjectGetPropertyData(AudioObjectID(kAudioObjectSystemObject),
        &propertyAddress,
        0,
        nil,
        &propertySize,
        &deviceID)

    return error
}


let MyAQInputCallback: AudioQueueInputCallback = {
    (inUserData: UnsafeMutableRawPointer?,
     inAQ: AudioQueueRef,
     inBuffer: AudioQueueBufferRef,
     inStartTime: UnsafePointer<AudioTimeStamp>,
     inNumberPacketDescriptions: UInt32,
     inPacketDescs: UnsafePointer<AudioStreamPacketDescription>?) in

}


func MyComputeRecordBufferSize(ASBD: AudioStreamBasicDescription,
                               AudioQueue: AudioQueueRef,
                               bufferDuration: Double) -> Int64 {

                                   return 0
    }
