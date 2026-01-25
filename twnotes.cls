% ------------------------------------------------------------
% twnotes - TW Notes Template
% Based on amznotes by Alex M. Zhang
% Refactored for CVPR/NeurIPS Aesthetic
% ------------------------------------------------------------

\ProvidesClass{twnotes}[2026/01/26 twnotes professional edition]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[12pt]{report}

% ------------------------------------------------------------

% PROCESS OPTIONS
\RequirePackage{kvoptions}
\DeclareBoolOption{math}        % enables thmbox and math macros
\DeclareBoolOption{code}        % enables codebox, twcode, and \twinputcode
\DeclareBoolOption{fastcompile} % turns off some features for faster compiling

\ProcessKeyvalOptions{twnotes}

% ------------------------------------------------------------

% LOAD REQUIRED PACKAGES
\RequirePackage[margin=1in]{geometry}   % set margins
\RequirePackage[dvipsnames]{xcolor}     % pretty colors

% --- FONT CONFIGURATION ---
\RequirePackage{iftex}
\RequirePackage[T1]{fontenc}
\RequirePackage{newpxtext} 
\RequirePackage{newpxmath} 
\RequirePackage{hyperref}               % hyperlinks
\RequirePackage{fancyhdr}               % fancy headers
\RequirePackage{lastpage}               % "X of Y" footer
\RequirePackage{parskip}                % new line after each paragraph w/o indent
\RequirePackage{setspace}               % 1.5 line spacing
\RequirePackage[explicit]{titlesec}     % chapter styling
\RequirePackage[most]{tcolorbox}        % pretty boxes
\RequirePackage{ifthen}                 % disable index entries not being used
\RequirePackage{multicol}
\RequirePackage{enumitem}               % customize itemize spacing
\RequirePackage{xfrac}                  % small fractions

% Fix marginparwidth warning
\setlength{\marginparwidth}{2cm}
\RequirePackage[textsize=scriptsize]{todonotes}      % todo notes

\RequirePackage{tabularx}
\RequirePackage{tikz}                   % For the Cover Art
\usetikzlibrary{calc, positioning, backgrounds, shapes.geometric}

\iftwnotes@math
\RequirePackage{mathtools}          % for math macros

% Resolve conflict between newpxmath and amsthm
\let\openbox\relax
\RequirePackage{amsthm}
\renewcommand\qedsymbol{$\blacksquare$} 
\RequirePackage{derivative}
\fi

\iftwnotes@code
\RequirePackage{minted}             % syntax coloring for code
\tcbuselibrary{minted}
\fi

% ------------------------------------------------------------

% PAGE LAYOUT
\onehalfspacing
\renewcommand{\arraystretch}{1.25}

% ------------------------------------------------------------

% COLORS (CVPR/NeurIPS Palette)
% 核心主色：Oxford Blue
\definecolor{twchaptercolor}{RGB}{12, 35, 68}

% 定义：Deep Teal
\definecolor{twdfnboxcolor}{RGB}{0, 95, 115}

% 定理：Slate Blue
\definecolor{twthmboxcolor}{RGB}{43, 65, 98}

% 示例：Antique Bronze
\definecolor{twexboxcolor}{RGB}{166, 124, 0}

% 通用：Hunter Green
\definecolor{twgenboxcolor}{RGB}{42, 157, 143}

% 技巧：Burnt Sienna
\definecolor{twtecboxcolor}{RGB}{200, 85, 61}

% 代码：Charcoal
\definecolor{twcodeboxcolor}{HTML}{2d3436}

% 笔记：Brick Red
\definecolor{twnoteboxcolor}{RGB}{180, 50, 50}

% ------------------------------------------------------------

% LINKS
\hypersetup{
	colorlinks=true,
	linkcolor=twthmboxcolor,
	urlcolor=twdfnboxcolor,
	citecolor=twthmboxcolor,
	pdftitle={Notes},
	pdfborderstyle={/S/U/W 1}
}

% ------------------------------------------------------------

% CHAPTER STYLING
\iftwnotes@fastcompile
\else

\titleformat{\chapter}[display]
{\normalfont\huge\bfseries}
{}
{20pt}
{
	\begin{tcolorbox}[
		enhanced,
		left=23mm, right=25mm, top=2mm,
		spread sidewards,
		sharp corners,
		colback=twchaptercolor,
		colframe=twchaptercolor,
		boxrule=1mm,
		title=\thechapter,
		attach boxed title to top right={xshift=-15mm, yshift=-4mm},
		boxed title style={
			size=small,
			colback=twchaptercolor,
			colframe=white
		}
		]
		\strut \textcolor{white}{#1}
	\end{tcolorbox}
}

\titleformat{name=\chapter,numberless}[display]{\normalfont\huge\bfseries}
{}
{20pt}
{
	\begin{tcolorbox}[
		enhanced,
		left=23mm, right=25mm, top=2mm,
		spread sidewards,
		sharp corners,
		colback=twchaptercolor,
		colframe=twchaptercolor,
		boxrule=1mm,
		]
		\strut \textcolor{white}{#1}
	\end{tcolorbox}
}

\titlespacing*{\chapter}{0pt}{-40mm}{-10mm}
\fi

% ------------------------------------------------------------

% HEADER STYLING
\iftwnotes@fastcompile
\else
\pagestyle{fancy}
\lhead{\footnotesize\nouppercase{\leftmark}}
\rhead{\footnotesize\nouppercase{\rightmark}}
\cfoot{\thepage\ of \pageref{LastPage}}

\fancypagestyle{plain}{
	\renewcommand{\headrulewidth}{0pt}
	\fancyhead{}
	\cfoot[C]{\thepage\ of \pageref{LastPage}}
}
\fi

% ------------------------------------------------------------

% COLOR BOXES
\newcommand{\twcolorboxtitlesep}{\ \raisebox{2.3pt}{\scalebox{0.5}{ $\blacktriangleright$}}}

\tcbset{
	twdefaultstyle/.style={
		enhanced,
		drop fuzzy shadow,
		% 关键修改：在设置字体时，顺便还原 texttt
        fonttitle=\strut\bfseries\let\texttt\oldtexttt,
		boxrule=0pt,
		frame hidden,
		separator sign=\twcolorboxtitlesep,
		breakable,
	},
	genboxstyle/.style={
		twdefaultstyle,
		frame style={fill=twgenboxcolor!85!black},
		interior style={fill=twgenboxcolor!5!white},
		segmentation style={solid,draw=twgenboxcolor!50!black,opacity=0.25,line width=1pt}
	},
	noteboxstyle/.style={
		enhanced,
		boxrule=0pt,
		frame hidden,
		borderline west={4pt}{0pt}{twnoteboxcolor},
		colback=twnoteboxcolor!7!white,
		sharp corners,
	},
	codeboxstyle/.style={
		overlay={\begin{tcbclipinterior}\fill[darkgray!20!white] (frame.south west) rectangle ([xshift=6mm]frame.north west);\end{tcbclipinterior}},
		skin=bicolor,
		collower=white,
		colbacklower=darkgray
	},
}

% ------------------------------------------------------------
% INLINE CODE STYLING (\texttt)
% 重定义 \texttt 命令，为其添加淡灰色背景，并收窄上下间距
% ------------------------------------------------------------

% 1. 定义一个名为 \twcodeinline 的行内盒子
\newtcbox{\twcodeinline}{
    on line,                % 行内模式，不换行
    fontupper=\ttfamily,    % 内容强制使用打字机字体
    colback=black!6,        % 背景色：淡灰色 (6% 黑)
    colframe=black!6,       % 边框色：同背景色，隐藏边框线
    boxrule=0pt,            % 边框宽度为 0
    arc=2pt,                % 圆角半径 (微小圆角，看起来更精致)
    boxsep=0pt,             % 清除默认的内边距
    left=2.5pt, right=2.5pt,% 左右留出一点呼吸空间
    top=1pt, bottom=1pt,    % [关键] 上下边距设为极窄 (可改为 0.5pt 甚至 0pt)
    tcbox raise base        % 自动对齐基线，防止文字忽高忽低
}

% 2. 覆盖 LaTeX 原生的 \texttt 命令
% 这样在正文中继续用 \texttt{...} 就能自动获得新效果
\let\oldtexttt\texttt      % (可选) 备份旧命令
\renewcommand{\texttt}[1]{\twcodeinline{#1}}

\renewcommand{\l@tcolorbox}{\@dottedtocline{1}{0pt}{3em}}

\setlength{\columnsep}{3em}

\newcommand{\twindex}{
	\addcontentsline{toc}{chapter}{Index}
	\chapter*{Index}
	\renewcommand{\headrulewidth}{0pt}
	\fancyhead{}
	\begin{multicols}{2}
		\twindexbody
	\end{multicols}
}

\newcommand{\twindexbody}{}

\newcommand{\addindexentry}[2]{%
	\appto\twindexbody{
		\iftoggle{#2}{\tcblistof[\section*]{#2}{#1}}{}
	}
}

\newcounter{twboxcounter}

\NewDocumentCommand{\newtwbox}{m m m m O{}}{
	\newtcbtheorem[use counter=twboxcounter,number within=section,list inside={#3}]{tc#1}{#2}{
		twdefaultstyle,
		frame style={fill=#4!85!black}, 
		interior style={fill=#4!5!white},
		segmentation style={solid,draw=#4!50!black,opacity=0.25,line width=1pt},
		#5
	}{#3}
	\providetoggle{#3}
	\settoggle{#3}{false}
	\newenvironment{#1}[2]{\global\settoggle{#3}{true}\begin{tc#1}{##1}{##2}}{\end{tc#1}}
	\newenvironment{#1*}[1]{\begin{tc#1*}{##1}}{\end{tc#1*}}
	\addindexentry{#2s}{#3}
}

\newtwbox{dfnbox}{Definition}{dfn}{twdfnboxcolor}
\newtwbox{exbox}{Example}{ex}{twexboxcolor}
\newtwbox{tecbox}{Technique}{tec}{twtecboxcolor}
\newtcolorbox{genbox}[1]{twdefaultstyle, genboxstyle, title={#1}}
\newtcolorbox{notebox}{noteboxstyle}

\iftwnotes@math
\newtwbox{lembox}{Lemma}{lem}{twthmboxcolor}
\newtwbox{thmbox}{Theorem}{thm}{twthmboxcolor}
\fi

\iftwnotes@code
\renewcommand{\theFancyVerbLine}{\ttfamily\scriptsize{\arabic{FancyVerbLine}}}

\newtwbox{codebox}{Code Snippet}{code}{twcodeboxcolor}[codeboxstyle]
\newenvironment{twcode}[2][]{%
    \let\texttt\oldtexttt % <--- 加上这一句，进入环境即还原
	\VerbatimEnvironment
	\begin{minted}[
		linenos,
		breaklines,
		autogobble,
		tabsize=4,
		xleftmargin=3.75mm,
		]{#2}%
	}{\end{minted}}
\newcommand{\twinputcode}[2]{\inputminted[linenos,breaklines,autogobble,tabsize=4,xleftmargin=3.75mm]{#1}{#2}}
\fi

\newcommand{\dfntxt}[1]{\textit{\textbf{#1}}}
\newcommand{\tabitem}{~~\llap{\textbullet}~~}

% ------------------------------------------------------------

% MATH MACROS
\iftwnotes@math
\newcommand{\rel}[1]{\mathrel{\mathcal{#1}}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\F}{\mathbb{F}}
\DeclareMathOperator{\laplace}{\mathscr{L}}
\DeclareMathOperator{\proj}{proj}
\DeclareMathOperator{\comp}{comp}
\DeclareMathOperator{\TIME}{TIME}
\newcommand{\id}{\text{id}}
\newcommand{\bigO}{\mathcal{O}}
\newcommand{\symdiff}{\bigtriangleup}
\newcommand{\alg}[1]{{\left\langle {#1} \right\rangle}}
\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\newcommand\restrict[2]{{\left.\kern-\nulldelimiterspace#1\vphantom{\big|}\right|_{#2}}}
\fi

% ------------------------------------------------------------
% COVER PAGE DESIGN: "The Tensor Manifold"
% ------------------------------------------------------------

\makeatletter
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\institution}[1]{\gdef\@institution{#1}}
\newcommand{\@subtitle}{}
\newcommand{\@institution}{}

\renewcommand{\maketitle}{
	\begin{titlepage}
		\newgeometry{left=0cm, right=0cm, top=0cm, bottom=0cm} % Full bleed
		\begin{tikzpicture}[remember picture, overlay]
			% 1. Background
			\fill[twchaptercolor] (current page.north west) rectangle ($(current page.south west) + (8cm, 0)$);
			
			% 2. Generative Art
			\begin{scope}[shift={(current page.south west)}]
				\clip (0,0) rectangle (8cm, 29.7cm);
				\foreach \i in {1,...,25} {
					\coordinate (A) at ({rnd*8}, {rnd*29.7});
					\coordinate (B) at ({rnd*8}, {rnd*29.7});
					\draw[white, opacity=0.08, line width=0.5pt] (A) -- (B);
					\fill[white, opacity=0.15] (A) circle (2pt);
				}
				\foreach \x in {0.5, 1.5, ..., 7.5} {
					\foreach \y in {1, 2, ..., 28} {
						\fill[white, opacity=0.03] (\x,\y) circle (1pt);
					}
				}
			\end{scope}
			
			% 3. Vertical Line
			\draw[twgenboxcolor, line width=4pt] (8cm, 0) -- (8cm, 29.7cm);
			
			% 4. Content
			% [Institution]
			\node[anchor=north west, inner sep=0, text width=7cm, align=left] 
			at ($(current page.north west) + (1cm, -2cm)$) {
				\color{white}\sffamily\tiny\bfseries\MakeUppercase{RESEARCH MONOGRAPH} \\
				\vspace{0.2cm}
				\color{white}\sffamily\large\bfseries \@institution
			};
			
			% [Title]
			\node[anchor=north west, inner sep=0] (titleNode)
			at ($(current page.north west) + (9.5cm, -8cm)$) {
				\begin{minipage}{11cm}
					\raggedright
					\color{twchaptercolor}
					\fontsize{40}{45}\selectfont 
					\bfseries
					\@title
				\end{minipage}
			};
			
			% [Subtitle]
			\ifx\@subtitle\empty\else
			\node[anchor=north west, inner sep=0] 
			at ($(titleNode.south west) + (0, -1.5cm)$) { 
				\begin{minipage}{11cm}
					\raggedright
					\color{gray}\sffamily\Large 
					\@subtitle
				\end{minipage}
			};
			\fi
			
			% [Author]
			\node[anchor=south west, inner sep=0, text width=11cm, align=flush left] 
			at ($(current page.south east) + (-12.5cm, 3cm)$) {
				\color{black}\sffamily\bfseries\Large \@author \\
				\vspace{0.5cm}
				\color{gray}\sffamily\normalsize \@date
			};
			
			% [Year]
			\node[anchor=south east, inner sep=0, opacity=0.05] 
			at ($(current page.south east) + (-1cm, 1cm)$) {
				\sffamily\fontsize{100}{100}\selectfont\bfseries \the\year
			};
			
		\end{tikzpicture}
	\end{titlepage}
	\restoregeometry
}
\makeatother