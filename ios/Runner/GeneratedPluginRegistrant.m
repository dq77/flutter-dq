//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <city_pickers/CityPickersPlugin.h>
#import <flustars/FlustarsPlugin.h>
#import <image_picker/ImagePickerPlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>
#import <tobias/TobiasPlugin.h>
#import <url_launcher/UrlLauncherPlugin.h>
#import <webview_flutter/WebViewFlutterPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CityPickersPlugin registerWithRegistrar:[registry registrarForPlugin:@"CityPickersPlugin"]];
  [FlustarsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlustarsPlugin"]];
  [FLTImagePickerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTImagePickerPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [TobiasPlugin registerWithRegistrar:[registry registrarForPlugin:@"TobiasPlugin"]];
  [FLTUrlLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTUrlLauncherPlugin"]];
  [FLTWebViewFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTWebViewFlutterPlugin"]];
}

@end
