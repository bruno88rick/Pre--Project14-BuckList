//
//  DataOnAppDocumentDirectory.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 24/09/24.
//

/*Previously we looked at how to read and write data to UserDefaults, which works great for user settings or small amounts of JSON, and we also looked at SwiftData, which is a great choice for times when you want relationships between objects, or more advanced sorting and filtering.
 
 In this app we’re going to look at a middle ground: we'll just write our data to a file directly. This isn't because I hate SwiftData, and in fact I think SwiftData would make a good choice here. Instead, it's so that I can show you the full spread of what's possible in iOS development, because there are lots of apps you'll work on that use exactly this approach to saving their data – it's good that you can at least see how it works.

 That being said, using UserDefaults is definitely a bad idea here, because there's no limit to how much data users can create in the app. UserDefaults is better used for simple settings and similar.
 
 Fortunately, iOS makes it very easy to read and write data from device storage, and in fact all apps get a directory for storing any kind of documents we want. Files here are automatically synchronized with iCloud backups, so if the user gets a new device then our data will be restored along with all the other system data – we don’t even need to think about it.
 
 There is a small catch – isn’t there always? – and it’s that all iOS apps are sandboxed, which means they run in their own container with a hard to guess directory name. As a result, we can’t – and shouldn’t try to – guess the directory where our app is installed, and instead need to rely on a special URL that points to our app’s documents directory: URL.DocumentsDirectory
 
 That documents directory is ours to do with as we please, and because it belongs to the app it will automatically get deleted if the app itself gets deleted. Other than physical device limitations there is no limit to how much we can store, although remember that users can use the Settings app to see how much storage your app takes up – be respectful!
 
 Now that we have a directory to work with, we can read and write files there freely. You already met String(contentsOf:) and Data(contentsOf:) for reading data, but for writing data we need to use the write(to:) method. This takes two parameters:

 A URL to write to.
 Any additional options to use when saving.
 The first of those can be created by combining the documents directory URL with a filename, such as myfile.txt.

 As for the second, I prefer to give it two values as an array: .atomic and .completeFileProtection. They do very different things, but both are important:

 Asking for atomic saving means the whole file should be written in one lump. If this isn't included and we try to write a big file, it’s possible that another part of our app might try and read the file while it’s still being written. This shouldn’t cause a crash or anything, but it does mean that it’s going to read only part of the data, because the other part hasn’t been written yet. Atomic writing causes the system to write our full file to a temporary filename (not the one we asked for), and when that’s finished it does a simple rename to our target filename. This means either the whole file is there or nothing is.
 Asking for complete file protection means iOS automatically (and transparently) encrypts the file, and only allows our app to read it while the device is unlocked. iOS does a great job of keeping user data secure, but there's no harm being extra safe!
 To put all this code into action, we’re going to modify the default code from our template so that it writes a test string to a file in the documents directory, reads it back into a new string, then prints it out – the complete cycle of reading and writing data.
 
 */

import SwiftUI

struct DataOnAppDocumentDirectory: View {
    var body: some View {
        Button ("Read and Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    DataOnAppDocumentDirectory()
}
