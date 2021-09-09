func createSineWave(duration _: Float, frequency: Float) {
    assert(frequency > 0.0)

    let FILE_NAME_FORMAT = "%0.3f-sine.aif"
    let frequency = Double(frequency)!
    let fileName = String(format: FILE_NAME_FORMAT, frequency)
    let filePath = "./Files/\(fileName)"
    let fileURL = URL(fileURLWithPath: filePath)

    var asbd = AudioStreamBasicDescription()

    asbd.mSampleRate = SAMPLE_RATE
    asbd.mFormatID = kAudioFormatLinearPCM
    asbd.mFormatFlags = kAudioFileAIFFType | kAudioFormatFlagIsPacked
    // kAudioFormatFlagIsPacked | kAudioFormatFlagIsBigEndian | kAudioFormatFlagIsSignedInteger

    asbd.mBitsPerChannel = 16
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
}

func createSquareWave(duration _: Float, frequency: Float) {
    assert(frequency > 0.0)

    let FILE_NAME_FORMAT = "%0.3f-square.aif"
    let frequency = Double(frequency)!
    let fileName = String(format: FILE_NAME_FORMAT, frequency)
    let filePath = "./Files/\(fileName)"
    let fileURL = URL(fileURLWithPath: filePath)

    var asbd = AudioStreamBasicDescription()

    asbd.mSampleRate = SAMPLE_RATE
    asbd.mFormatID = kAudioFormatLinearPCM
    asbd.mFormatFlags = kAudioFileAIFFType | kAudioFormatFlagIsPacked
    // kAudioFormatFlagIsPacked | kAudioFormatFlagIsBigEndian | kAudioFormatFlagIsSignedInteger

    asbd.mBitsPerChannel = 16
    asbd.mChannelsPerFrame = 1
    asbd.mFramesPerPacket = 1
    asbd.mBytesPerFrame = 4
    asbd.mBytesPerPacket = 4
}

func createTriangleWave(duration _: Float, frequency: Float) {
    assert(frequency > 0.0)

    let FILE_NAME_FORMAT = "%0.3f-Triangle.aif"
    let frequency = Double(frequency)!
    let fileName = String(format: FILE_NAME_FORMAT, frequency)
    let filePath = "./Files/\(fileName)"
    let fileURL = URL(fileURLWithPath: filePath)

    var asbd = AudioStreamBasicDescription()

    asbd.mSampleRate = SAMPLE_RATE
    asbd.mFormatID = kAudioFormatLinearPCM
    asbd.mFormatFlags = kAudioFileAIFFType | kAudioFormatFlagIsPacked
    // kAudioFormatFlagIsPacked | kAudioFormatFlagIsBigEndian | kAudioFormatFlagIsSignedInteger

    asbd.mBitsPerChannel = 16
    asbd.mChannelsPerFrame = 1
    asbd.mFramesPerPacket = 1
    asbd.mBytesPerFrame = 4
    asbd.mBytesPerPacket = 4
}
