#if __has_feature(modules)
@import Foundation;
#else
#import <Foundation/Foundation.h>
#endif

#if __has_feature(modules)
@import Security;
#else
#import <Security/Security.h>
#endif

#ifndef TrustKit_pinning_utils_h
#define TrustKit_pinning_utils_h

/**
 Evaluate trust for the specified certificate and policies
 
 This function invokes SecTrustEvaluateWithError() on iOS12+, macOS14+ and SecTrustEvaluate() otherwise.
 
 @param serverTrust The trust management object to evaluate
 @param trustResult On return, points to a result type reflecting the result of this evaluation.
 @param error An error pointer the method uses to return an error when trust evaluation fails. Set to nil to ignore the error (this is not recommended!)

 */
void evaluateCertificateChainTrust(SecTrustRef serverTrust, SecTrustResultType *trustResult, NSError **error);

#endif
