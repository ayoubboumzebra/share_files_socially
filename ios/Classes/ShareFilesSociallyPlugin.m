#import "ShareFilesSociallyPlugin.h"
#import <share_files_socially/share_files_socially-Swift.h>

@implementation ShareFilesSociallyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftShareFilesSociallyPlugin registerWithRegistrar:registrar];
}
@end
