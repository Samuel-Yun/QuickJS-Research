/* Experiment only: one native configuration read per process, no JS setter. */
#include <pthread.h>
static pthread_once_t rdi_mode_once = PTHREAD_ONCE_INIT;
static int rdi_process_mode = -1;
#ifdef READ_IC_DIAGNOSTIC
static unsigned long long rdi_mode_runtime_inits;
#endif
static void rdi_mode_init(void)
{
    const char *s = getenv("QJS_READ_IC_MODE");
    if (s && (s[0] == '0' || s[0] == '1') && s[1] == '\0') {
        rdi_process_mode = s[0] - '0';
    } else {
        fprintf(stderr, "QJS_READ_IC_MODE must be exactly 0 or 1\n");
    }
}
