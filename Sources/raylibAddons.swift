import Raylib

enum RenderInfo {
    case text(data: String, posX: Int32, posY: Int32, size: Int32, color: Color)

    enum TextBoundsError: Error {
        case nonIncreasing(String)
    }
    static func horzCenteredText(data: String, horzBounds: (Int32, Int32) = (0, screenWidth), posY: Int32, size: Int32, color: Color) throws -> RenderInfo {
        if horzBounds.1 < horzBounds.0 {
            throw TextBoundsError.nonIncreasing("HorzBounds.0 must be less than .1. Received \(horzBounds)")
        }
        let textWidth = Raylib.measureText(data, size)
        return .text(
            data: data,
            posX: horzBounds.0 + (horzBounds.1 - horzBounds.0 - textWidth) / 2,
            posY: posY,
            size: size,
            color: color)
    }
}
