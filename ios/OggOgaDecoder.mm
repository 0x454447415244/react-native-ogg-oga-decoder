#import "OggOgaDecoder.h"

#import "OGGDecoder.h"

@implementation OggOgaDecoder
RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(decode,
                 withOggFile:(NSString *)oggFile
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
    
    OGGDecoder * decoder = [[OGGDecoder alloc] init];
    [decoder decode:[NSURL URLWithString:oggFile] completion:^(NSURL* _Nullable outputFile){
        NSLog(@"%@", [outputFile absoluteString]);
        resolve([outputFile absoluteString]);
    }];
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeOggOgaDecoderSpecJSI>(params);
}
#endif

@end
