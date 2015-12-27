//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 定义类
class SomeClass  {
   // class definition goes here
}

// Class And Structure Instances


class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// an instance
let Video = VideoMode()
Video.frameRate

// Memberwise Initializers for Sturcture Types

struct Resolution {
    var width = 0
    var height = 0
}


let oneVideo = Video;
oneVideo.name = "haso"

Video.name

print(oneVideo)

if oneVideo === Video {
    print("the same")
}
