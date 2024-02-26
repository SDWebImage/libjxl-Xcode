#ifndef JXL_THREADS_EXPORT_H
#define JXL_THREADS_EXPORT_H

#define JXL_THREADS_EXPORT
#define JXL_THREADS_NO_EXPORT

#ifndef JXL_THREADS_DEPRECATED
#  define JXL_THREADS_DEPRECATED __attribute__ ((__deprecated__))
#endif

#endif
