from common import *
import math
EXT=HERE/'external'
def make_scripts():
 manifest=json.loads((EXT/'manifest.json').read_text());out=EXT/'scripts';out.mkdir(exist_ok=True)
 common='''var now=performance.now.bind(performance);var N=Number(scriptArgs[1]||1);\n'''
 loads="std.loadScript("+json.dumps(str(EXT/'acorn-8.14.1/dist/acorn.js'))+");\nvar input=std.loadFile("+json.dumps(str(EXT/'lodash-4.17.21/lodash.js'))+");\n"
 # Count all typed AST nodes after timing. AST fingerprint covers the complete
 # JSON output, not only root/type/number of nodes.
 check='''var nodes=0,stack=[result];while(stack.length){var o=stack.pop();if(!o||typeof o!=='object')continue;if(typeof o.type==='string')nodes++;for(var k in o)if(o[k]&&typeof o[k]==='object')stack.push(o[k]);}if(result.type!=='Program'||result.end!==544096||nodes!==29507)throw Error('AST validation');var payload=JSON.stringify(result);var hash=2166136261;for(var i=0;i<payload.length;i++)hash=Math.imul(hash^payload.charCodeAt(i),16777619)>>>0;var validation={root:result.type,end:result.end,nodes:nodes,jsonLength:payload.length,hash:hash};'''
 a=common+loads+'''var result;if(typeof __ep_begin==='function')__ep_begin();var t=now();for(var n=0;n<N;n++)result=acorn.parse(input,{ecmaVersion:2022,sourceType:'script'});var stop=now();if(typeof __ep_end==='function')__ep_end();\n'''+check+'''print('EXTERNAL_RESULT:'+JSON.stringify({case:'Acorn',N:N,elapsed_ms:stop-t,ms:(stop-t)/N,validation:validation}));\n'''
 loads="std.loadScript("+json.dumps(str(EXT/'markdown-it-14.1.0/dist/markdown-it.js'))+");\nvar input=std.loadFile("+json.dumps(str(EXT/'markdown-it-14.1.0/README.md'))+");var md=markdownit();\n"
 b=common+loads+'''var result;if(typeof __ep_begin==='function')__ep_begin();var t=now();for(var n=0;n<N;n++)result=md.render(input);var stop=now();if(typeof __ep_end==='function')__ep_end();var hash=2166136261;for(var i=0;i<result.length;i++)hash=Math.imul(hash^result.charCodeAt(i),16777619)>>>0;if(result.length!==12329||hash!==3322973581)throw Error('HTML validation');print('EXTERNAL_RESULT:'+JSON.stringify({case:'MarkdownIt',N:N,elapsed_ms:stop-t,ms:(stop-t)/N,validation:{length:result.length,hash:hash}}));\n'''
 for n,t in [('Acorn',a),('MarkdownIt',b)]:p=out/(n+'.js');p.write_text(t)
 save(EXT/'scripts.json',{n:dict(path=str(out/(n+'.js')),sha256=sha(out/(n+'.js')))for n in ['Acorn','MarkdownIt']})
if __name__=='__main__':make_scripts()
