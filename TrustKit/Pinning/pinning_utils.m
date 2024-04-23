#import "pinning_utils.h"
#include <dlfcn.h>
#include "TargetConditionals.h"

void evaluateCertificateChainTrust(SecTrustRef serverTrust, SecTrustResultType *trustResult, NSError **error) {
    CFErrorRef errorRef;
    bool certificateEvaluationSucceeded = SecTrustEvaluateWithError(serverTrust, &errorRef);
    OSStatus status = SecTrustGetTrustResult(serverTrust, trustResult);
    if (error != NULL) {
        if (status != errSecSuccess)
        {
            NSString *errDescription = [NSString stringWithFormat:@"got status %d", (int)status];
            *error = [[NSError alloc] initWithDomain:@"com.datatheorem.trustkit" code:1 userInfo:@{NSLocalizedDescriptionKey:errDescription}];
        }
        else if (!certificateEvaluationSucceeded)
        {
            *error = (__bridge_transfer NSError *)errorRef;
        }
    }
}
