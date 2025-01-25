#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "cold" asset catalog image resource.
static NSString * const ACImageNameCold AC_SWIFT_PRIVATE = @"cold";

/// The "hot" asset catalog image resource.
static NSString * const ACImageNameHot AC_SWIFT_PRIVATE = @"hot";

#undef AC_SWIFT_PRIVATE
