import CoreGraphics

extension CGRect {
    public static func rectFitting(to rect: CGRect, ofAspectRatio aspectRatio: CGFloat) -> CGRect {
        let size = CGSize.sizeFitting(to: rect.size, ofAspectRatio: aspectRatio)
        let x = (rect.size.width - size.width) / 2 + rect.origin.x
        let y = (rect.size.height - size.height) / 2 + rect.origin.y
        let origin = CGPoint(x: x, y: y)
        return CGRect(origin: origin, size: size)
    }
    
    public func fitting(to rect: CGRect) -> CGRect {
        Self.rectFitting(to: rect, ofAspectRatio: size.aspectRatio)
    }
    
    public mutating func fit(to rect: CGRect) {
        self = fitting(to: rect)
    }
}

extension CGRect {
    public static func rectFilling(_ rect: CGRect, ofAspectRatio aspectRatio: CGFloat) -> CGRect {
        let size = CGSize.sizeFilling(rect.size, ofAspectRatio: aspectRatio)
        let x = (rect.size.width - size.width) / 2 + rect.origin.x
        let y = (rect.size.height - size.height) / 2 + rect.origin.y
        let origin = CGPoint(x: x, y: y)
        return CGRect(origin: origin, size: size)
    }
    
    public func filling(_ rect: CGRect) -> CGRect {
        Self.rectFilling(rect, ofAspectRatio: size.aspectRatio)
    }
    
    public mutating func fill(_ rect: CGRect) {
        self = filling(rect)
    }
}
