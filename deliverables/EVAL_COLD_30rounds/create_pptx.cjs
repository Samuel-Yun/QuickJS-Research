/* Native editable PowerPoint tables from the audited 30-process medians. */
const fs = require('fs');
const path = require('path');
const PptxGenJS = require(process.env.PPTXGENJS_PATH || '/tmp/quickjs-slide-deps/node_modules/pptxgenjs');
const data = JSON.parse(fs.readFileSync(path.join(__dirname, 'data.json'), 'utf8'));
const pptx = new PptxGenJS();
pptx.defineLayout({name:'TABLES_16_9', width:16, height:9});
pptx.layout = 'TABLES_16_9';
pptx.author = 'QuickJS Research';
pptx.subject = 'A / EVAL_COLD / V8_ON, audited native 30-round benchmark tables';
pptx.title = 'QuickJS IC优化：Octane与SunSpider';
pptx.company = 'QuickJS Research';
pptx.lang = 'zh-CN';
pptx.theme = {headFontFace:'Times New Roman', bodyFontFace:'Times New Roman', lang:'zh-CN'};
const BLACK='000000', GREEN='147D38', RED='BD252D';
const LEFT=.55, WIDTH=14.9, TABLE_Y=1.12;
const COLS=[4.6,2.5,2.5,2.2,3.1];
const border=(color,pt)=>({type:'solid', color, pt});
const none={type:'none', color:'FFFFFF', pt:0};

for (const [index, spec] of data.slides.entries()) {
  const slide = pptx.addSlide();
  slide.background = {color:'FFFFFF'};
  slide.addText(spec.title, {x:LEFT,y:.22,w:6,h:.50,margin:0,
    fontFace:'Times New Roman',fontSize:30,bold:true,color:BLACK,breakLine:false,
    objectName:`${spec.title} title`});
  slide.addText('方法：IC优化（EVAL_COLD）', {x:LEFT,y:.78,w:7.8,h:.23,margin:0,
    fontFace:'Times New Roman',fontSize:12,color:BLACK,lang:'zh-CN',
    objectName:'Method label'});
  slide.addText([
    {text:'整体（几何平均） ',options:{color:BLACK}},
    {text:`${spec.overall_pct.toFixed(2)}%`,options:{color:GREEN,bold:true}}
  ], {x:9.2,y:.38,w:6.25,h:.30,align:'right',margin:0,
    fontFace:'Times New Roman',fontSize:16,color:BLACK,lang:'zh-CN',
    objectName:'Overall time change'});

  const isSun=spec.kind==='sunspider';
  const size=isSun?13.2:16;
  const rowH=isSun?.257:.368;
  const headerH=.52;
  const headers=['测试项','原版 QuickJS\n(A)','IC优化\n(EVAL_COLD)','耗时变化\n(相对 A)','V8_ON\n(--jitless)'];
  const head=headers.map((text,column)=>({text,options:{
    fontFace:'Times New Roman',fontSize:14.5,bold:true,color:BLACK,
    fill:{color:'EAEAEA'},align:column===0?'left':'center',valign:'mid',
    margin:[1,12,1,12],
    border:[border(BLACK,1),none,border(BLACK,.8),none]
  }}));
  const body=spec.rows.map((row,i)=>row.display.map((text,column)=>({text,options:{
    fontFace:'Times New Roman',fontSize:size,
    bold:column===2||column===3,
    color:column===3?(row.pct<0?GREEN:RED):BLACK,
    fill:{color:i%2===0?'FFFFFF':'F7F7F7'},
    align:column===0?'left':'right',valign:'mid',
    margin:[1,12,1,12],
    border:[none,none,border(i===spec.rows.length-1?BLACK:'D9D9D9',i===spec.rows.length-1?1:.3),none]
  }})));
  const height=headerH+spec.rows.length*rowH;
  slide.addTable([head,...body],{x:LEFT,y:TABLE_Y,w:WIDTH,h:height,
    colW:COLS,rowH:[headerH,...spec.rows.map(()=>rowH)],
    autoPage:false,margin:0,align:'right',valign:'mid',
    fontFace:'Times New Roman',fontSize:size,color:BLACK,lang:'zh-CN',
    paraSpaceBefore:0,paraSpaceAfter:0,breakLine:false,
    objectName:`${spec.title} complete benchmark table`});
  slide.addText('单位：ms/Run；每项30次独立进程的中位数。负值为改善（绿色），正值为退化（红色）。',
    {x:LEFT,y:8.58,w:13.8,h:.22,margin:0,fontFace:'Times New Roman',fontSize:10,
    lang:'zh-CN',color:BLACK,objectName:'Units and color legend'});
  slide.addText(`${index+1} / 2`,{x:14.6,y:8.58,w:.85,h:.22,margin:0,align:'right',
    fontFace:'Times New Roman',fontSize:10,color:BLACK,objectName:'Page number'});
  slide.addNotes(`Source: ${data.source}/statistics.csv and aggregate.csv. `+
    `IC优化 = EVAL_COLD. Times are 30 fresh-process medians in ms/complete Run. `+
    `Change = (EVAL_COLD/A - 1)*100, computed before rounding. `+
    `V8_ON flags: --jitless --no-lazy --use-ic. `+
    `Requested fonts: Chinese KaiTi (楷体); Latin/digits Times New Roman. `+
    `Overall: Octane suite-weighted GM; SunSpider 26-case equal GM.`);
}
pptx.writeFile({fileName:process.env.PPTX_OUTPUT || path.join(__dirname,'IC优化_30轮性能对比.pptx')});
