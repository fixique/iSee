// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias AssetImageTypeAlias = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let rectangle33 = ImageAsset(name: "Rectangle 33")
  internal static let img1 = ImageAsset(name: "img1")
  internal static let img2 = ImageAsset(name: "img2")
  internal static let img3 = ImageAsset(name: "img3")
  internal static let img5 = ImageAsset(name: "img5")
  internal static let img6 = ImageAsset(name: "img6")
  internal static let shape = ImageAsset(name: "Shape")
  internal static let addButton = ImageAsset(name: "addButton")
  internal static let alarmBellRing1 = ImageAsset(name: "alarm-bell-ring-1")
  internal static let alarmBell = ImageAsset(name: "alarm-bell")
  internal static let background = ImageAsset(name: "background")
  internal static let favoriteSelected = ImageAsset(name: "favoriteSelected")
  internal static let favoriteUnselected = ImageAsset(name: "favoriteUnselected")
  internal static let image1 = ImageAsset(name: "image1")
  internal static let image2 = ImageAsset(name: "image2")
  internal static let image3 = ImageAsset(name: "image3")
  internal static let image4 = ImageAsset(name: "image4")
  internal static let image5 = ImageAsset(name: "image5")
  internal static let image6 = ImageAsset(name: "image6")
  internal static let lensShutter = ImageAsset(name: "lens-shutter")
  internal static let pointView = ImageAsset(name: "pointView")
  internal static let profileImage = ImageAsset(name: "profileImage")
  internal static let removeCircle = ImageAsset(name: "remove-circle")
  internal static let shkaf = ImageAsset(name: "shkaf")
  internal static let tab1 = ImageAsset(name: "tab1")
  internal static let tab2 = ImageAsset(name: "tab2")
  internal static let tab3 = ImageAsset(name: "tab3")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct DataAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(OSX)
  @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
  internal var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
internal extension NSDataAsset {
  convenience init!(asset: DataAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(OSX)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: AssetImageTypeAlias {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = AssetImageTypeAlias(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal extension AssetImageTypeAlias {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
