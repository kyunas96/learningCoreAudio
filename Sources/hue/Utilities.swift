import Foundation

/*four char codes are CoreAudio errors whereas integer valued errors are standard
paramErr's*/
func CheckError(_ error: OSStatus, _ operation: String) {
    if error == noErr { return }
    if error < 0 {
        print("OSStatus Error code smaller than zero")
        print("Error: \(error)")
        exit(1)
    }

    let count = 5
    let stride = MemoryLayout<OSStatus>.stride
    let byteCount = count * stride

    var newErr = UInt32(error)
    var charArray = [CChar](repeating: 0, count: byteCount)

    withUnsafeBytes(of: &newErr) { (buffer: UnsafeRawBufferPointer) in
        for (index, byte) in buffer.enumerated() {
            charArray[index + 1] = CChar(byte)
        }

        let v1 = charArray[1], v2 = charArray[2], v3 = charArray[3], v4 = charArray[4]
        //
        if isprint(Int32(v1)) > 0, isprint(Int32(v2)) > 0, isprint(Int32(v3)) > 0, isprint(Int32(v4)) > 0 {
            charArray[0] = "\'".utf8CString[0]
            charArray[5] = "\'".utf8CString[0]
            // let errStr = NSString(bytes: &charArray, length: charArray.count, encoding: String.Encoding.ascii.rawValue)
            let errStr = String(bytesNoCopy: &charArray,
                                length: charArray.count,
                                encoding: String.Encoding.ascii,
                                freeWhenDone: true)
            print("Error: \(operation) (\(errStr!))")
        } else {
            print("Error: \(error)")
        }

        exit(1)
    }
}
