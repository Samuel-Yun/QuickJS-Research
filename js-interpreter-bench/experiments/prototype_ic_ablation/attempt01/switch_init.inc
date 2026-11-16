/* Single-threaded, experimental CLI only; not a production API or JS option. */
static int qjs_experiment_proto_ic_enabled = 1;
static int qjs_experiment_proto_ic_initialized;
int qjs_experiment_proto_ic_init(void)
{
    const char *option;
    if (qjs_experiment_proto_ic_initialized)
        return 0;
    option = getenv("QJS_EXPERIMENT_PROTO_IC");
    if (!option || (option[0] != '0' && option[0] != '1') || option[1] != '\0')
        return -1;
    qjs_experiment_proto_ic_enabled = option[0] == '1';
    qjs_experiment_proto_ic_initialized = 1;
    return 0;
}
