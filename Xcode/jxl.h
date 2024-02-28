//
//  jxl.h
//  jxl
//
//  Created by Bogdan Poplauschi on 28/08/2018.
//  Copyright © 2018 SDWebImage. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for jxl.
FOUNDATION_EXPORT double jxlVersionNumber;

//! Project version string for jxl.
FOUNDATION_EXPORT const unsigned char jxlVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <jxl/PublicHeader.h>

#import <jxl/decode.h>
#import <jxl/encode.h>
#import <jxl/stats.h>
#import <jxl/thread_parallel_runner.h>
#import <jxl/resizable_parallel_runner.h>
#import <jxl/codestream_header.h>
#import <jxl/cms_interface.h>
#import <jxl/memory_manager.h>
#import <jxl/parallel_runner.h>
#import <jxl/types.h>
#import <jxl/color_encoding.h>
#import <jxl/cms.h>
#import <jxl/version.h>
#import <jxl/jxl_cms_export.h>
#import <jxl/jxl_threads_export.h>
#import <jxl/jxl_export.h>
