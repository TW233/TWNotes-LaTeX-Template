# TWNotes: A Professional LaTeX Notes Template

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![LaTeX](https://img.shields.io/badge/LaTeX-Project-47A141?style=flat&logo=latex&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue)

**Current Version:** 1.0.0 (January 2026)

**TWNotes** is a polished, modern LaTeX template designed for research notes, academic monographs, and course summaries. 

It is a heavy refactor of [amznotes](https://github.com/alexmingzhang/amznotes), updated with a **CVPR/NeurIPS-inspired color palette**, improved typography (Palatino-based), and enhanced code highlighting.

> [!NOTE]  
> **Preview Images**: *Please replace this line with actual screenshots of your PDF (e.g., Cover Page, Chapter Page, Code Blocks) after you build it.*

## Key Features

* **Academic Aesthetic**: Uses a professional color scheme (Oxford Blue, Deep Teal, Slate Blue) inspired by top-tier CV conference papers.
* **Refined Typography**: Replaced standard Computer Modern with `newpxtext` and `newpxmath` (Palatino) for better on-screen readability.
* **Enhanced Code Blocks**: 
    * Uses `minted` for syntax highlighting.
    * Custom inline code styling (`\texttt`) with rounded gray backgrounds (similar to Notion/GitHub).
* **Modular Design**: Toggle features like `math` or `code` support via package options.
* **Generative Cover**: A TikZ-based algorithmic cover design ("The Tensor Manifold").

## Requirements

To compile this template, you need a standard TeX distribution (TeX Live, MacTeX, or MikTeX) with the following specific requirements:

1.  **Engine**: XeLaTeX or LuaLaTeX is recommended (though PDFLaTeX should work if fonts are configured correctly).
2.  **Python & Pygments**: Required for the `minted` package (syntax highlighting).
    * Install Python.
    * Run `pip install pygments`.
3.  **Compilation Flag**: You must enable shell escape.
    * Flag: `-shell-escape`

## Usage

1.  Download `twnotes.cls` and place it in your project directory.
2.  Load the class in your `.tex` file:

```latex
\documentclass[math,code]{twnotes}
```

### Options

* `math`: Enables theorem environments (`thmbox`, `lembox`, etc.) and math macros.
* `code`: Enables code highlighting environments (`codebox`, `twcode`) requiring `minted`.
* `fastcompile`: Disables fancy headers and chapter decorations for faster draft builds.

### Environments

| Environment | Description | Color Theme |
| :--- | :--- | :--- |
| `dfnbox` | Definitions | Deep Teal |
| `thmbox` | Theorems | Slate Blue |
| `exbox` | Examples | Antique Bronze |
| `codebox` | Code Snippets | Charcoal |
| `notebox` | Important Notes | Brick Red |

## Example

```latex
\documentclass[math,code]{twnotes}

\title{Deep Learning Notes}
\author{Your Name}
\institution{Your Institution}

\begin{document}
    \maketitle
    
    \chapter{Introduction}
    \begin{dfnbox}{Rotation Equivariance}{rot-equiv}
       A function $f: X \to Y$ is equivariant to a group $G$ if...
    \end{dfnbox}
\end{document}
```

## Credits & License

* Original concept and base code by [Alex M. Zhang (amznotes)](https://github.com/alexmingzhang/amznotes).
* Modifications and aesthetic overhaul by **TW233**.

This project is licensed under the MIT License.

---

# TWNotes: 专业 LaTeX 笔记模板

![Version](https://img.shields.io/badge/版本-1.0.0-blue)

**当前版本：** 1.0.0 (2026/01/26)

**TWNotes** 是一款专为科研笔记、学术专著和课程总结设计的 LaTeX 模板。

本项目基于 [amznotes](https://github.com/alexmingzhang/amznotes) 进行了深度重构与美化。主要改进包括采用了 **CVPR/NeurIPS 风格的配色方案**，替换了更易读的 Palatino 字体组合，并对代码块和行内代码样式进行了精细调整。

## 主要特性

* **学术级配色**：摒弃高饱和度颜色，采用 Oxford Blue、Deep Teal 等沉稳色调，阅读体验更佳。
* **字体优化**：使用 `newpxtext` 和 `newpxmath` 替代默认字体，正文和数学公式更加优雅。
* **代码美化**：
    * 集成 `minted` 实现代码高亮。
    * 重写了 `\texttt` 样式，为行内代码添加了淡灰色圆角背景（类似 Notion 风格）。
* **封面设计**：内置基于 TikZ 的生成式封面艺术 ("The Tensor Manifold")。
* **模块化**：可通过参数按需开启数学或代码功能。

## 环境要求

为了正常编译，你需要安装 TeX 发行版 (TeX Live / MacTeX)，并满足以下条件：

1.  **编译引擎**：推荐使用 `XeLaTeX` 或 `LuaLaTeX`。
2.  **Pygments**：由于使用了 `minted` 宏包，你需要安装 Python 并安装 Pygments：
    ```bash
    pip install pygments
    ```
3.  **Shell Escape**：编译时必须开启 shell escape 权限：
    * 编译参数：`-shell-escape`

## 使用说明

1.  下载 `twnotes.cls` 并将其放入你的项目文件夹。
2.  在 `.tex` 文件开头引用文档类：

```latex
\documentclass[math,code]{twnotes}
```

### 编译选项 (Options)

* `math`: 开启数学功能。包含 `thmbox` (定理), `lembox` (引理) 等环境及常用数学宏。
* `code`: 开启代码功能。包含 `codebox` (代码框), `twcode` 等环境（依赖 `minted`）。
* `fastcompile`: 快速编译模式。关闭页眉装饰和章节特效，用于在写作过程中加快编译速度。

### 常用环境盒子

| 环境名 | 用途 | 颜色 |
| :--- | :--- | :--- |
| `dfnbox` | 定义 (Definition) | 深青色 (Deep Teal) |
| `thmbox` | 定理 (Theorem) | 板岩蓝 (Slate Blue) |
| `exbox` | 示例 (Example) | 古铜色 (Antique Bronze) |
| `codebox` | 代码片段 | 炭灰色 |
| `notebox` | 重点备注 | 砖红色 |

## 示例代码

```latex
\documentclass[math,code]{twnotes}

\title{Deep Learning Notes}
\author{Your Name}
\institution{Your Institution}

\begin{document}
    \maketitle
    
    \chapter{Introduction}
    \begin{dfnbox}{Rotation Equivariance}{rot-equiv}
       A function $f: X \to Y$ is equivariant to a group $G$ if...
    \end{dfnbox}
\end{document}
```

## 鸣谢与许可

* 本项目基础代码源自 [Alex M. Zhang (amznotes)](https://github.com/alexmingzhang/amznotes)。
* 在此基础上由 **TW233** 进行了视觉风格重构与功能扩展。

本项目采用 MIT 许可证。