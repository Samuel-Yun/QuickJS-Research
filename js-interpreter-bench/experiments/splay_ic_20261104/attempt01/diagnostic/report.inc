void audit_report(void) {
    const char *path=getenv("IC_MECHANISM_REPORT");if(!path)return;
    FILE *out=fopen(path,"wx");if(!out)abort();
    fprintf(out,"{\"variant\":%u,\"scope\":\"stage-separated diagnostic only\",\"global_by_phase\":[",AUDIT_VARIANT);
    for(unsigned k=0;k<6;k++)fprintf(out,"%s{\"all_find\":%llu,\"outside_find\":%llu,\"cache_retains\":%llu,\"cache_releases\":%llu}",k?",":"",sp_all_find[k],sp_outside_find[k],sp_all_retains[k],sp_all_releases[k]);
    fprintf(out,"],\"functions\":[");
    for(AuditFunction *f=audit_functions;f;f=f->next){
        if(!f->freed)memcpy(f->after,f->b->byte_code_buf,f->length);
        fprintf(out,"{\"instance_id\":%u,\"freed\":%u,\"function_hex\":\"",f->id,f->freed);audit_hex(out,f->name,strlen(f->name));
        fprintf(out,"\",\"source_hex\":\"");audit_hex(out,f->source,f->source_len);
        fprintf(out,"\",\"code_before_hex\":\"");audit_hex(out,f->before,f->length);
        fprintf(out,"\",\"code_after_hex\":\"");audit_hex(out,f->after,f->length);
        fprintf(out,"\",\"opcodes\":[");unsigned first=1;
        for(unsigned pc=0;pc<f->length;){
            unsigned op=f->before[pc],size=short_opcode_info(op).size;
            if(!first)fprintf(out,",");first=0;
            fprintf(out,"{\"pc\":%u,\"size\":%u,\"before_op\":\"%s\",\"atom_hex\":\"",pc,size,short_opcode_info(op).name);
            if(f->sites[pc].atom)audit_hex(out,f->sites[pc].atom,strlen(f->sites[pc].atom));
            fprintf(out,"\",\"phases\":[");unsigned first_phase=1;
            for(unsigned phase=0;phase<6;phase++){
                if(!f->phases[phase])continue;AuditSite *s=&f->phases[phase][pc];if(!s->operations)continue;
                if(!first_phase)fprintf(out,",");first_phase=0;
                fprintf(out,"{\"phase\":%u,\"operations\":%llu,\"ic_queries\":%llu,\"hits\":%llu,\"misses\":%llu,\"cache_probes\":%llu,\"updates\":%llu,\"insertions\":%llu,\"replacements\":%llu,\"same_shape_updates\":%llu,\"find_normal\":%llu,\"bucket_loads\":%llu,\"chain_probes\":%llu,\"generic_get\":%llu,\"value_int\":%llu,\"value_object\":%llu,\"value_other\":%llu,\"retains\":%llu,\"releases\":%llu",
                  phase,s->operations,s->ic_queries,s->hits,s->misses,s->cache_probes,s->updates,s->insertions,s->replacements,s->same_shape_updates,s->find_normal,s->buckets,s->chain_probes,s->generic_get,s->value_int,s->value_object,s->value_other,s->retains,s->releases);
                const char *reasons[]={"own_miss","descriptor","special","unhashed","inherited","missing","primitive","other"};
                for(unsigned k=0;k<8;k++)fprintf(out,",\"%s\":%llu",reasons[k],s->reasons[k]);
                fprintf(out,"}");
            }
            fprintf(out,"]}");pc+=size;
        }
        fprintf(out,"]}%s",f->next?",":"");
    }
    fprintf(out,"]}\n");fclose(out);
}
