import Foundation

var width: Float = 3.5
var height: Float = 2.4

var bucketOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBuckets = ceil(numberOfBuckets)// round up the float or duble type
        return Int(roundedBuckets)
    }// number of buckets of paints calculated
    set {
        print(newValue)
        let areaCanCover = Double(newValue) * 1.5
        print("area can be covered with the given buckets \(newValue): \(areaCanCover)")
    }// number of area covered by given buckets of paint
}

bucketOfPaint = 4
print(bucketOfPaint)

//what if we had a couple of buckets lying around in the house & I want to know wat is the total area that this paint bucket can cover.
// this amount of paint can cover an x sq. meters where x is worked out depending on how many buckets of paint we have got.
