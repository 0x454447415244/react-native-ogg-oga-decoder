#ifdef RCT_NEW_ARCH_ENABLED
#import "RNOggOgaDecoderSpec.h"

@interface OggOgaDecoder : NSObject <NativeOggOgaDecoderSpec>
#else
#import <React/RCTBridgeModule.h>

@interface OggOgaDecoder : NSObject <RCTBridgeModule>
#endif

@end
