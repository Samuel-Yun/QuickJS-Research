两页可编辑PPTX，数据取自本机30轮确认。第一页Octane 17项；第二页SunSpider 26项。左侧为测试项标签，后面四个数据列为原版QuickJS(A)、IC优化(EVAL_COLD)、相对A耗时变化、V8_ON(--jitless)。负值绿色、正值红色，其余文本黑色。中文字体指定楷体，英文和数字指定Times New Roman；未嵌入字体，本机预览使用AR PL UKai CN及Liberation Serif替代。

生成：使用pptxgenjs 4.0.1执行create_pptx.cjs，再执行finalize_pptx.py设置中文字体并校验。render_preview.py从最终PPTX XML生成本地排版预览。两个预览均无溢出；逐项数值、百分比颜色、两页唯一原生表格、字体标记、ZIP关系检查见validation.json。
