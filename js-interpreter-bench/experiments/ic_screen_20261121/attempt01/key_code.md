# 最值得复测的版本：代码和实测结果

## M2

原来每个字段从原型链头走起；现在按层走，在当前层检查尚未确定的字段，最近的描述符决定该字段是否允许写入。

```c
    unsigned pending=(1U<<r->n)-1,depth=0;
    for(JSObject*p=proto;p && pending;p=p->shape->proto){
        SCREEN(chain_layers);
        if(++depth>32 || p->class_id!=JS_CLASS_OBJECT || p->is_exotic)return 0;
        for(unsigned i=0;i<r->n;i++)if(pending&(1U<<i)){
            SCREEN(descriptor_queries);
            JSProperty*pr;JSShapeProperty*d=find_own_property(&pr,p,r->atom[i]);
            if(d){
                if((d->flags&JS_PROP_TMASK) || !(d->flags&JS_PROP_WRITABLE))return 0;
                pending&=~(1U<<i);
            }
        }
    }
    return 1;
}
```

本批 Octane +0.23%，SunSpider +0.18%。未达到预设门槛；仅作为该套件中最靠前的候选继续核对，不称为整体赢家。
