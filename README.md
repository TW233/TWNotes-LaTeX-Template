<div align="center">

# TWNotes: Research Monograph LaTeX Template

<img src="./sample-images/cover.png" width="400" alt="TWNotes Logo" style="border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">

<br/><br/>

[![Version](https://img.shields.io/github/v/release/TW233/TWNotes-LaTeX-Template?color=0C2344&label=Version&style=for-the-badge&logo=github)](https://github.com/TW233/TWNotes-LaTeX-Template/releases)
[![CJK Support](https://img.shields.io/badge/CJK-Supported-C8553D?style=for-the-badge&logo=google-translate&logoColor=white)](#documentation-chinese)
[![Engine](https://img.shields.io/badge/engine-XeLaTeX%20%7C%20LuaLaTeX-2B4162?style=for-the-badge&logo=latex&logoColor=white)](https://tug.org/xetex/)
[![License](https://img.shields.io/badge/License-MIT-005F73?style=for-the-badge)](LICENSE)


**A strictly typed, algorithmically generated LaTeX template for researchers.**

[Documentation (English)](#documentation-english) | [中文说明文档 (v1.1.0 Updated)](#documentation-chinese)

</div>

<br/>

## <a name="documentation-english"></a> 1. Design Philosophy

**TWNotes** is an engineering-focused refactor of the [amznotes](https://github.com/alexmingzhang/amznotes) system, specifically tuned for long-form technical writing such as research monographs, lecture notes, and PhD theses. It bridges the gap between the chaotic visual noise of standard LaTeX classes and the rigid publication standards of top-tier vision conferences.

### Core Pillars
* **Algorithmic Aesthetics**: The cover art is not a static asset but a procedurally generated vector graphic, ensuring crisp rendering at any resolution.
* **Cognitive Ergonomics**: The color palette is calibrated using the "Dark Academia" spectrum (Oxford Blue / Slate Blue) to minimize eye strain during extended reading sessions on backlit screens.
* **Code-First Architecture**: Syntax highlighting is powered by Python's `Pygments` (via `minted`), featuring a custom `inline-code` renderer that mimics the rounded visual language of modern IDEs.

---

## 2. "The Tensor Manifold" Cover Art

Unlike traditional templates that use static JPG/PNG images, TWNotes features a **Generative Cover System** built entirely in TikZ.

<table border="0">
  <tr>
    <td width="50%">
      <img src="./sample-images/sample_1.png" alt="Generative Cover" style="border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
    </td>
    <td width="50%" valign="top">
      <h3>The Algorithm</h3>
      The cover design, dubbed <i>"The Tensor Manifold"</i>, visualizes the high-dimensional latent space of neural networks.
      <br/><br/>
      <ul>
        <li><strong>Stochastic Topology:</strong> The network of lines and nodes (<code>\foreach \i in {1,...,25}</code>) uses randomization (<code>rnd</code>) to generate a unique geometric constellation every time you compile. No two covers are mathematically identical.</li>
        <li><strong>Full-Bleed Rendering:</strong> Utilizes <code>current page.north west</code> anchors to bypass page margins, creating an immersive, edge-to-edge visual field.</li>
        <li><strong>Layered Opacity:</strong> Multiple render passes with varying alpha channels (<code>opacity=0.08</code> to <code>0.15</code>) create depth and texture without requiring external graphics software.</li>
      </ul>
    </td>
  </tr>
</table>

---

## 3. Visual & Technical Specifications

<table border="0">
  <tr>
    <td width="50%">
      <img src="./sample-images/sample_3.png" alt="Internal Layout" style="border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
    </td>
    <td width="50%" valign="top">
      <h3>Precision Typesetting Architecture</h3>
      The internal layout engine is engineered to maximize <strong>information hierarchy</strong> and <strong>readability</strong> for technical content.
      <br/><br/>
      <ul>
        <li><strong>Modular Containers:</strong> Content is strictly typed. Theorems, Propositions (Slate Blue), Assumptions, and Definitions (Deep Teal) are encapsulated in distinct <code>tcolorbox</code> environments, visually separating "derived truths" from "foundational axioms".</li>
        <li><strong>Modern Math Engine:</strong> Upgraded to <code>unicode-math</code> and <code>amssymb</code>, ensuring robust support for complex mathematical operators ($\int, \sum$) and seamless compatibility with XeTeX systems. Supports compact fractions via <code>nicefrac</code>.</li>
        <li><strong>Advanced Float Handling:</strong> Deep integration with <code>adjustbox</code>, <code>float</code>, and <code>caption</code> packages allows for absolute positioning of figures (<code>[H]</code>), subfigures, and perfectly centered ultra-wide tables.</li>
        <li><strong>Semantic Spacing:</strong> Vertical rhythm is managed via <code>parskip</code> and strictly defined header margins, eliminating the dense "wall of text" effect common in default academic templates.</li>
      </ul>
    </td>
  </tr>
</table>

### The Color System
We employ a semantic coloring strategy where every color serves a logical function.

| Semantic Role | Palette Badge (Hex) | Usage Context |
| :--- | :--- | :--- |
| **Primary Theme** | ![Oxford Blue](https://img.shields.io/badge/Oxford_Blue-0C2344?style=flat-square) | Chapter Headers, Title Bars, Cover Background |
| **Definitions** | ![Deep Teal](https://img.shields.io/badge/Deep_Teal-005F73?style=flat-square) | Axioms, Definitions, Assumptions, URL Links |
| **Theorems** | ![Slate Blue](https://img.shields.io/badge/Slate_Blue-2B4162?style=flat-square) | Theorems, Lemmas, Propositions, Proofs |
| **Examples** | ![Antique Bronze](https://img.shields.io/badge/Antique_Bronze-A67C00?style=flat-square) | Case Studies, Examples |
| **Code Blocks** | ![Charcoal](https://img.shields.io/badge/Charcoal-2D3436?style=flat-square) | Code Snippets, Terminal Outputs |
| **Techniques** | ![Burnt Sienna](https://img.shields.io/badge/Burnt_Sienna-C8553D?style=flat-square) | Tips, Warnings, "Tricks of the Trade" |

### Typography Stack
* **Body Text**: `newpxtext` (Palatino clone). Chosen for its humanist stroke variation which offers superior readability over Computer Modern.
* **Mathematics**: `unicode-math` combined with `amssymb`.
* **Monospace**: `Inconsolata` (or system CJK Sans). Optimized for code legibility.

---

## 4. Typography Architecture & CJK Support (v1.1.0)

Version 1.1.0 introduces the **"Golden Triangle"** typesetting strategy. Designed to transcend the visual monotony of standard system fonts (like *SimSun*), this architecture establishes a publication-grade CJK reading experience aligned with modern typographic standards.

### The Golden Triangle Strategy

| Zone | Typeface | Design Intent |
| :--- | :--- | :--- |
| **Body Text** | **Source Han Serif** (思源宋体) | Compared to legacy fonts, its stroke tension and visual weight (gray level) are perfectly balanced with the English Palatino font. |
| **Headers** | **XiaoBiaoSong** (方正小标宋) | Reserved for `Chapter` and `Section`. Its solemn, rigid structure anchors the page layout, delivering an authoritative "official document" aesthetic. |
| **UI Elements** | **Source Han Sans** (思源黑体) | Used for Definitions, Theorems, and Code. The modern sans-serif style creates a crisp visual separation from the serif body text, maximizing information retrieval efficiency. |

### Configuration Modes

TWNotes v1.1.0 offers two distinct configuration modes for CJK environments:

#### Mode A: Strict Aesthetics (Recommended, Local Fonts)
This mode ensures **pixel-perfect, print-ready consistency** across all compilation environments (Windows/macOS/Linux).

1.  Enable flags: `\documentclass[cn, localfonts]{twnotes}`
2.  Create a `fonts/` directory at the project root and populate it with the following 6 files (**Filenames must match exactly**):

```text
root/
└── fonts/
    ├── SourceHanSerifSC-Regular.otf   # Body Text (Regular)
    ├── SourceHanSerifSC-Bold.otf      # Body Text (Bold)
    ├── SourceHanSansSC-Regular.otf    # Code / Sans (Regular)
    ├── SourceHanSansSC-Bold.otf       # Sans (Bold)
    ├── SourceHanSansSC-Medium.otf     # Box Headers (Medium Weight)
    └── xbs.ttf                        # XiaoBiaoSong (Rename FZXBS.TTF to this)
```

#### Mode B: System Fallback (Portable)
Ideal for quick prototyping in environments where you cannot install or carry specific font files.

1.  Enable flags: `\documentclass[cn]{twnotes}` (**Do NOT** include `localfonts`)
2.  The template automatically falls back to OS-default fonts (e.g., Fandol series or System Defaults). While aesthetic precision is slightly reduced, portability is maximized.

---

## 5. Usage Guide (v1.1.0 Updated)

### Prerequisites
1.  **TeX Distribution**: TeX Live 2023+ (Recommended) or MacTeX.
2.  **Python Environment**: Required for the `minted` package.
    ```bash
    pip install pygments
    
```

### Compilation
⚠️ **CRITICAL**: You must execute the compiler with `-shell-escape` to allow LaTeX to call the Python syntax highlighter.

```bash
# Recommended Engine
xelatex -shell-escape main.tex
```

### Boilerplate Code
```latex
% v1.1.0+ supports Multilingual Options
% [cn]: Enable Chinese Support
% [localfonts]: Use local font files instead of system fonts
\documentclass[math, code, cn, localfonts]{twnotes}

% Meta-data for the Cover Generator
\title{Equivariant Neural Networks}
\subtitle{Research on Rotation-Equivariant Operators}
\institution{Institute for Advanced Study}
\author{Your Name}
\date{\today}

\begin{document}
    \maketitle
    
    \chapter{Introduction}
    
    \begin{assumpbox}{Group Symmetry}{ass:group}
        Let $G$ be a compact group acting on a feature space...
    \end{assumpbox}

    \begin{dfnbox}{Equivariant Operator}{def:equiv}
        A characteristic field $e$ on a manifold satisfies equivariance if for any transformation $g \in G$, $f(g \cdot e) = g \cdot f(e)$.
    \end{dfnbox}

    \begin{codebox}{PyTorch Implementation}{code:torch}
    \begin{twcode}{python}
    import torch.nn as nn
    from e2cnn import gspaces, nn as e2nn
    
    r2_act = gspaces.Rot2dOnR2(N=8)
    feat_type = e2nn.FieldType(r2_act, [r2_act.regular_repr] * 16)
    \end{twcode}
    \end{codebox}
\end{document}
```

---

## 6. Advanced Configuration

### Package Options
Load the class with specific flags to toggle functionality:

| Option | Description | Performance Impact |
| :--- | :--- | :--- |
| `math` | Enables `thmbox`, `lembox`, `propbox`, and `\laplace` macros. | Low |
| `code` | Enables `minted` integration. Requires Python. | Medium |
| `cn` | **(New)** Enables `ctex` and Chinese font configuration. | Low |
| `localfonts`| **(New)** Forces font loading from `./fonts/` instead of system. | Low |
| `fastcompile` | **Debug Mode**. Disables the TikZ cover, fancy headers, and chapter decorations. Use this when writing content to speed up compilation 10x. | **High Speed** |

### Directory Structure
For larger monographs, we recommend the following modular structure:

```text
root/
├── twnotes.cls          # Core Logic (Do not edit)
├── main.tex             # Entry Point
├── fonts/               # (New) Local font files for 'localfonts' mode
├── images/              # Static Assets (PNG/PDF)
├── code/                # External scripts for \twinputcode
└── sections/            # Content Modules
    ├── 01_intro.tex
    └── 02_equivariance.tex
```

<details>
<summary><strong>🛠 Troubleshooting (Click to Expand)</strong></summary>

<br>

**1. Error: `Package minted Error: You must invoke LaTeX with -shell-escape`**
* **Cause**: The compiler is blocked from running Python scripts.
* **Fix**: Update your build command. In VS Code (LaTeX Workshop), go to `Settings > Tools > latex-workshop.latex.tools` and add `"-shell-escape"` to the arguments list.

**2. Error: `Font not found`**
* **Cause**: Your TeX distribution is missing the Palatino fonts.
* **Fix**: Run `tlmgr install newpx` (TeX Live) or use the MikTeX Console to install `newpxtext`.

**3. Cover Art is missing?**
* **Cause**: You might have enabled the `fastcompile` option.
* **Fix**: Remove `fastcompile` from `\documentclass[...]` for the final build.

</details>

<br/><br/>

---

## <a name="documentation-chinese"></a> 1. 设计哲学 (Design Philosophy)

**TWNotes** 是针对 `amznotes` 系统的一次工程化重构，专为长篇学术写作（如研究专著、讲义、博士论文）量身定制。它弥合了标准 LaTeX 模板的视觉混乱与美观严谨出版标准之间的差距。

### 核心理念
* **算法美学 (Algorithmic Aesthetics)**：封面并非静态图片，而是完全由代码生成的矢量图形。无论放大多少倍，边缘依然锐利。
* **认知工学 (Cognitive Ergonomics)**：基于“暗学术 (Dark Academia)”风格校准的色板（牛津蓝/板岩蓝），能有效减少在背光屏幕上长时间阅读产生的视觉疲劳。
* **代码优先 (Code-First)**：语法高亮引擎由 Python 的 `Pygments` (通过 `minted`) 驱动，并配备了模仿现代 IDE 风格的圆角行内代码渲染器。

---

## 2. "The Tensor Manifold" 生成式封面

与使用静态图片的传统模板不同，TWNotes 内置了一个基于 **TikZ** 的生成式封面系统。

<table border="0">
  <tr>
    <td width="50%">
      <img src="./sample-images/sample_1.png" alt="Generative Cover" style="border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
    </td>
    <td width="50%" valign="top">
      <h3>生成算法解析</h3>
      这个被称为 <i>"The Tensor Manifold" (张量流形)</i> 的设计，旨在可视化神经网络的高维潜在空间。
      <br/><br/>
      <ul>
        <li><strong>随机拓扑 (Stochastic Topology)：</strong> 线条与节点网络 (<code>\foreach</code>) 利用随机函数 (<code>rnd</code>) 生成。这意味着你每次编译文档，都会诞生一个数学上独一无二的几何星系。</li>
        <li><strong>封面主轴微调：</strong> 标题文字的基准 Y 轴进行过视觉重心的微调校准，从而平衡下方的大面积留白。</li>
        <li><strong>Full-Bleed 渲染 (Full-Bleed Rendering)：</strong> 利用 <code>current page</code> 锚点突破页边距限制，创造出沉浸式的无边框视觉体验。</li>
        <li><strong>层叠透明度 (Layered Opacity)：</strong> 通过多重渲染通道叠加不同的 Alpha 通道 (0.08 - 0.15)，在不依赖外部绘图软件的情况下构建出深邃的空间感。</li>
      </ul>
    </td>
  </tr>
</table>

---

## 3. 视觉与技术规格

<table border="0">
  <tr>
    <td width="50%">
      <img src="./sample-images/sample_3.png" alt="Internal Layout" style="border-radius: 5px; box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
    </td>
    <td width="50%" valign="top">
      <h3>精密排版架构 (Typesetting Architecture)</h3>
      内页布局引擎专为技术内容设计，旨在最大化<strong>信息层级</strong>的清晰度与<strong>阅读体验</strong>。
      <br/><br/>
      <ul>
        <li><strong>模块化容器 (Modular Containers)：</strong> 内容被严格分类。定理、命题（板岩蓝）和定义、假设（深青色）被封装在不同的 <code>tcolorbox</code> 环境中，从视觉上将“推导出的真理”与“基础公理”彻底区分开来。</li>
        <li><strong>现代化数学引擎：</strong> 弃用了老旧的 <code>newpxmath</code>，全面升级至 <code>unicode-math</code> 体系，配合 <code>amssymb</code> 提供更完善的符号库支持，并新增了 <code>nicefrac</code> 用于排版精致的内联分数。</li>
        <li><strong>超强图表控制：</strong> 新增 <code>adjustbox</code> 与 <code>float</code> 等核心宏包，完美解决超宽表格居中、子图并排以及强制图形定位 (<code>[H]</code>) 的刚性需求。</li>
        <li><strong>语义化间距 (Semantic Spacing)：</strong> 通过 <code>parskip</code> 和严格定义的标题边距管理垂直节奏，消除了默认学术模板中常见的“文字墙”效应。</li>
      </ul>
    </td>
  </tr>
</table>

### 语义化配色系统

| 语义功能 | 色板标识 (Hex) | 使用场景 |
| :--- | :--- | :--- |
| **主视觉** | ![Oxford Blue](https://img.shields.io/badge/Oxford_Blue-0C2344?style=flat-square) | 章节页眉、标题栏、封面背景 |
| **定义与假设** | ![Deep Teal](https://img.shields.io/badge/Deep_Teal-005F73?style=flat-square) | 公理、定义 (Definition)、假设 (Assumption)、URL 超链接 |
| **定理与命题** | ![Slate Blue](https://img.shields.io/badge/Slate_Blue-2B4162?style=flat-square) | 定理 (Theorem)、引理 (Lemma)、命题 (Proposition)、证明 |
| **示例** | ![Antique Bronze](https://img.shields.io/badge/Antique_Bronze-A67C00?style=flat-square) | 案例分析、具体示例 |
| **代码** | ![Charcoal](https://img.shields.io/badge/Charcoal-2D3436?style=flat-square) | 代码片段、终端输出 |
| **技巧** | ![Burnt Sienna](https://img.shields.io/badge/Burnt_Sienna-C8553D?style=flat-square) | 提示、警告、避坑指南 |

---

## 4. v1.1.0 中文支持与字体架构

在 v1.1.0 版本中，我们引入了**"黄金三角"**字体排版策略，旨在打破“宋体走天下”的单调感，构建符合现代出版标准的中文阅读体验。

### 字体混排逻辑 (The Golden Triangle)

| 区域 (Zone) | 字体选型 (Typeface) | 设计意图 (Design Intent) |
| :--- | :--- | :--- |
| **正文** | **思源宋体 (Source Han Serif)** | 相比传统中易宋体，思源宋体的笔画更具张力，灰度与英文字体 Palatino 完美平衡。 |
| **大标题** | **方正小标宋 (XiaoBiaoSong)** | 用于 Chapter/Section。字形庄重、骨架硬朗，能有效撑起版面层级，呈现“公文级”的严肃感。 |
| **功能框** | **思源黑体 (Source Han Sans)** | 用于定义、定理、代码块。无衬线体的现代感能与正文形成视觉区隔，提升信息检索效率。 |

### 配置说明

TWNotes v1.1.0 提供了两种中文配置模式：

#### 模式 A：极致美观版 (推荐，需配置本地字体)
此模式能保证在任何电脑上编译出一致的、印刷级的视觉效果。

1.  开启选项：`\documentclass[cn, localfonts]{twnotes}`
2.  建立 `fonts/` 文件夹，并放入以下 6 个文件（**文件名必须严格一致**）：

```text
root/
└── fonts/
    ├── SourceHanSerifSC-Regular.otf   # 正文常规
    ├── SourceHanSerifSC-Bold.otf      # 正文粗体
    ├── SourceHanSansSC-Regular.otf    # 代码/黑体常规
    ├── SourceHanSansSC-Bold.otf       # 黑体粗体
    ├── SourceHanSansSC-Medium.otf     # 框体标题 (中等字重)
    └── xbs.ttf                        # 方正小标宋 (请将 FZXBS.TTF 重命名为此)
```

#### 模式 B：快速通用版 (无需字体文件)
适合在未安装特定字体的环境下临时编译。

1.  开启选项：`\documentclass[cn]{twnotes}` (**不要**加 `localfonts`)
2.  模板将自动回退到操作系统默认字体（如系统自带的思源系列或中易系列），虽然美观度略有下降，但胜在便携。

---

## 5. 使用指南 (v1.1.0 Updated)

### 环境要求 (Prerequisites)
1.  **TeX 发行版**: 推荐 TeX Live 2023+ 或 MacTeX。
2.  **Python 环境**: `minted` 宏包依赖此环境。
    ```bash
    pip install pygments
    
```

### 编译指令 (Compilation)
⚠️ **关键提示 (CRITICAL)**: 必须使用 `-shell-escape` 参数启动编译器，以允许 LaTeX 调用 Python 进行语法高亮。

```bash
# 推荐引擎
xelatex -shell-escape main.tex
```

### 基础模板代码 (Boilerplate Code)
```latex
% v1.1.0+ 支持多语言选项
% [cn]: 开启中文支持
% [localfonts]: 使用本地字体文件 (而非系统字体)
\documentclass[math, code, cn, localfonts]{twnotes}

% 封面生成器元数据
\title{旋转等变网络}
\subtitle{等变上下采样算子的研究与实现}
\institution{高等研究院}
\author{你的名字}
\date{\today}

\begin{document}
    \maketitle
    
    \chapter{绪论}
    
    \begin{assumpbox}{群对称性 (Group Symmetry)}{ass:group}
        设 $G$ 为作用于特征空间上的紧群...
    \end{assumpbox}

    \begin{dfnbox}{等变算子 (Equivariant Operator)}{def:equiv}
        若流形上的特征场 $e$ 满足等变性，则对于任意变换 $g \in G$，有 $f(g \cdot e) = g \cdot f(e)$。
    \end{dfnbox}

    \begin{codebox}{基于 e2cnn 的实现示例}{code:e2cnn}
    \begin{twcode}{python}
    import torch.nn as nn
    from e2cnn import gspaces, nn as e2nn
    
    r2_act = gspaces.Rot2dOnR2(N=8)
    feat_type = e2nn.FieldType(r2_act, [r2_act.regular_repr] * 16)
    \end{twcode}
    \end{codebox}
\end{document}
```

---

## 6. 高级配置 (Advanced Configuration)

### 宏包选项 (Package Options)
通过加载文档类时的参数来控制功能模块：

| 选项 | 描述 | 性能影响 |
| :--- | :--- | :--- |
| `math` | 启用 `thmbox`, `lembox`, `propbox`, `assumpbox` 及 `\laplace` 等数学宏。 | 低 |
| `code` | 启用 `minted` 代码高亮集成。需要 Python 环境。 | 中 |
| `cn` | **(新)** 启用 `ctex` 及中文字体配置。 | 低 |
| `localfonts`| **(新)** 强制从 `./fonts/` 目录加载字体，而非使用系统字体。 | 低 |
| `fastcompile` | **调试模式**。禁用 TikZ 封面、花式页眉及章节装饰。建议在纯写作阶段开启，可提升 10 倍编译速度。 | **极速** |

### 目录结构 (Directory Structure)
对于大型专著，我们推荐以下模块化结构：

```text
root/
├── twnotes.cls          # 核心类文件 (核心逻辑，请勿修改)
├── main.tex             # 入口文件
├── fonts/               # (新) 'localfonts' 模式所需的本地字体文件
├── images/              # 静态资源 (PNG/PDF)
├── code/                # 用于 \twinputcode 引入的外部脚本
└── sections/            # 内容模块
    ├── 01_intro.tex
    └── 02_equivariance.tex
```

<details>
<summary><strong>🛠 常见故障排除 (点击展开)</strong></summary>

<br>

**1. 报错: `Package minted Error: You must invoke LaTeX with -shell-escape`**
* **原因**: 编译器没有权限运行 Python 脚本。
* **解决**: 修改编译命令。如果你使用 VS Code (LaTeX Workshop)，请进入 `Settings > Tools > latex-workshop.latex.tools` 并在参数列表中添加 `"-shell-escape"`。

**2. 报错: `Font "xbs" cannot be found`**
* **原因**: 开启了 `localfonts` 选项，但 LaTeX 在 `fonts/` 文件夹下找不到 `xbs.ttf`。
* **解决**: 确保你下载了方正小标宋文件，并将其**重命名**为 `xbs.ttf` (注意后缀全小写)，放入 `fonts` 目录。

**3. 封面消失了？**
* **原因**: 你可能开启了 `fastcompile` 选项。
* **解决**: 在最终出稿时，从 `\documentclass[...]` 中移除 `fastcompile` 即可。

</details>

<br/><br/>

---

## License

This project is open-sourced under the MIT License.

* Original concept by [Alex M. Zhang (amznotes)](https://github.com/alexmingzhang/amznotes).
* Refactored, Redesigned and CJK-Enhanced by **TW233**.