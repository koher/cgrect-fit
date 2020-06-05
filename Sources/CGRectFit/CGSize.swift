import CoreGraphics

extension CGSize {
    public static func fitting(to size: CGSize, ofAspectRatio aspectRatio: CGFloat) -> CGSize {
        let outerAspectRatio = size.aspectRatio
        if aspectRatio < outerAspectRatio {
            let height = size.height
            let width = height * aspectRatio
            return CGSize(width: width, height: height)
        } else if aspectRatio > outerAspectRatio {
            let width = size.width
            let height = width / aspectRatio
            return CGSize(width: width, height: height)
        } else {
            return size
        }
    }
    
    public func fitting(to size: CGSize) -> CGSize {
        Self.fitting(to: size, ofAspectRatio: aspectRatio)
    }
    
    public mutating func fit(to size: CGSize) {
        self = fitting(to: size)
    }
}

extension CGSize {
    public static func filling(_ size: CGSize, ofAspectRatio aspectRatio: CGFloat) -> CGSize {
        let innerAspectRatio = size.aspectRatio
        if aspectRatio < innerAspectRatio {
            let width = size.width
            let height = width / aspectRatio
            return CGSize(width: width, height: height)
        } else if aspectRatio > innerAspectRatio {
            let height = size.height
            let width = height * aspectRatio
            return CGSize(width: width, height: height)
        } else {
            return size
        }
    }
    
    public func filling(_ size: CGSize) -> CGSize {
        Self.filling(size, ofAspectRatio: aspectRatio)
    }
    
    public mutating func fill(_ size: CGSize) {
        self = filling(size)
    }
}
