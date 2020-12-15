#import "FlutterProfileManagerPlugin.h"
#if __has_include(<flutter_profile_manager/flutter_profile_manager-Swift.h>)
#import <flutter_profile_manager/flutter_profile_manager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_profile_manager-Swift.h"
#endif

@implementation FlutterProfileManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterProfileManagerPlugin registerWithRegistrar:registrar];
}
@end
