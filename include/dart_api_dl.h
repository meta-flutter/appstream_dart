/*
 * Minimal reproduction of dart_api_dl.h from the Dart SDK.
 * Declares Dart_InitializeApiDL and the dynamically linked function pointers.
 */

#ifndef DART_API_DL_H_
#define DART_API_DL_H_

#include "dart_api_types.h"

#ifdef __cplusplus
extern "C" {
#endif

#define DART_API_DL_MAJOR_VERSION 2

/** Initialize the Dart API dynamic linking.
 *  Must be called with NativeApi.initializeApiDLData from Dart before
 *  any _DL function is used.  Returns 0 on success, -1 on version mismatch.
 */
intptr_t Dart_InitializeApiDL(void *data);

/** Post a CObject message to the given Dart_Port.
 *  Thread-safe — may be called from any OS thread after initialization.
 */
extern bool (*Dart_PostCObject_DL)(Dart_Port port_id, Dart_CObject *message);

#ifdef __cplusplus
}
#endif

#endif /* DART_API_DL_H_ */
