import UIKit

enum AppFonts {
    static func title(_ size: CGFloat = 24) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .bold)
    }
    static func body(_ size: CGFloat = 16) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .regular)
    }
    static func caption(_ size: CGFloat = 14) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .medium)
    }
}
