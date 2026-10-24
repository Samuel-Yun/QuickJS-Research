<!-- ppt-master-schema: spec-lock/v1 -->
# Execution Lock

## canvas
- viewBox: 0 0 1280 720
- format: PPT 16:9

## communication
- primary_language: zh-CN
- audience: 导师与编译器/虚拟机课题组
- objective: 用真实代码和记录讲清本周发现，让听众区分值流观察与未验证性能解释。
- core_message: 操作不同快慢可变，普通own字段值得继续看，尚未解释总体差距。
- consumption_mode: balanced

## mode
- mode: custom
- mode_behavior: 保持六页正文顺序，从循环值流到调用对照，再到原程序state位置，先证据后有边界判断。

## visual_style
- visual_style: custom
- visual_style_behavior: 白底黑字，等宽代码、稀疏细线和轻灰表头；给长指令宽列，数值按列排齐，来源有独立底带。

## colors
- background: #FFFFFF
- secondary_bg: #F4F5F6
- primary: #111111
- accent: #111111
- secondary_accent: #555555
- body_text: #111111
- secondary_text: #555555
- divider: #B9BDC3

## typography
- font_family: Arial, Microsoft YaHei, sans-serif
- title_family: Arial, Microsoft YaHei, sans-serif
- body_family: Arial, Microsoft YaHei, sans-serif
- code_family: Consolas, Microsoft YaHei, monospace
- body: 24
- title: 36
- subtitle: 26
- code: 20
- annotation: 20
- footnote: 14

## icons
- library: none
- inventory: none

## page_rhythm
- P01: dense
- P02: dense
- P03: dense
- P04: dense
- P05: dense
- P06: dense
- P07: dense
- P08: dense

## pptx_structure
- mode: flat

## forbidden
- `mask`, `<style>`, `class`, external CSS, `<foreignObject>`, `textPath`, `@font-face`, `<animate*>`, `<set>`, `<script>` / event attributes, `<iframe>`
- HTML named entities in text; write typography as raw Unicode and escape XML reserved characters
- 不重跑实验、不修改VM、不自动提交或推送。 (user)
