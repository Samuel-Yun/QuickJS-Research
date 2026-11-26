// Same shell API for all five conditions; does not preload files or move Run I/O.
globalThis.read=function(path,mode){
 if(mode!==undefined&&mode!=="binary")throw Error("unsupported read mode");
 var file=std.open(path,"rb");if(file===null)throw Error("read failed: "+path);
 try{if(mode!=="binary")return file.readAsString();
 var size=file.seek(0,std.SEEK_END);if(size<0)throw Error("seek failed");size=file.tell();file.seek(0,std.SEEK_SET);
 var bytes=new Uint8Array(size),got=file.read(bytes.buffer,0,size);if(got!==size)throw Error("short read");return bytes;
 }finally{file.close();}
};
