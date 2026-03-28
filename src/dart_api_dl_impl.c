/*
 * Dart API dynamic linking initialization.
 * Must be compiled as C (not C++).
 *
 * This walks the function table provided by the Dart VM via
 * NativeApi.initializeApiDLData and binds the _DL function pointers.
 */

#include "dart_api_dl.h"
#include <string.h>

/* Internal VM structure layout — must match the Dart SDK. */
typedef struct {
  const char *name;
  void *function;
} DartApiEntry;

typedef struct {
  int32_t major;
  int32_t minor;
  DartApiEntry *functions;
} DartApi;

/* The dynamically-bound function pointer. */
bool (*Dart_PostCObject_DL)(Dart_Port port_id, Dart_CObject *message) = NULL;

intptr_t Dart_InitializeApiDL(void *data) {
  DartApi *api = (DartApi *)data;

  if (api->major != DART_API_DL_MAJOR_VERSION) {
    return -1;
  }

  DartApiEntry *entry = api->functions;
  while (entry->name != NULL) {
    if (strcmp(entry->name, "Dart_PostCObject") == 0) {
      Dart_PostCObject_DL =
          (bool (*)(Dart_Port, Dart_CObject *))entry->function;
    }
    entry++;
  }

  if (Dart_PostCObject_DL == NULL) {
    return -1;
  }

  return 0;
}
