%%
%% This is file `oucthesis.cls',
%%
%% The original source files were:
%% 
%% Copyright
%% ouc (C) 2015-2019 Created by Zeping Lee <zepinglee AT gmail.com>
%% OUC version modified my Geo <geoffreychen777 AT gmail.com>
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{oucthesis}[2019/12/18 v1.0.0 OUC Thesis Template]

\RequirePackage{ifxetex}
\RequireXeTeX

\newif\ifouc@pdf
\DeclareOption{print}{\ouc@pdffalse}
\DeclareOption{pdf}{\ouc@pdftrue}

\newif\ifouc@enmac
\ouc@enmacfalse
\DeclareOption{enmac}{\ouc@enmactrue}

\newif\ifouc@count
\ouc@countfalse
\DeclareOption{count}{\ouc@counttrue}

\PassOptionsToClass{openany}{ctexbook}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ExecuteOptions{print}
\ProcessOptions\relax

\PassOptionsToClass{scheme=chinese}{ctexbook}
\PassOptionsToPackage{quiet}{xeCJK}
\LoadClass[UTF8,a4paper,zihao=-4]{ctexbook}[2017/04/01]
\PassOptionsToClass{scheme=chinese}{ctexbook}
\@ifclasslater{ctexbook}{2017/04/01}{}{
  \ClassError{oucthesis}{%
    This template requires TeX Live\MessageBreak 2017 or later version}{}
}
% ===============================================
% Required Package
\RequirePackage{amsmath}
\RequirePackage{unicode-math}
\RequirePackage[driver=xetex]{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{color}
\RequirePackage{titletoc}
\RequirePackage{caption}
\RequirePackage[perpage]{footmisc}
\RequirePackage{url}
\RequirePackage{calc}
\RequirePackage{dashrule}
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{natbib}
\RequirePackage{bashful}
\PassOptionsToPackage{sort&compress}{natbib}
\ifouc@pdf
\RequirePackage{hyperref}
\else
\fi

% ===============================================
% Changable parameters
\newcommand\ouc@atendpackage{\csname ctex_at_end_package:nn\endcsname}
\ouc@atendpackage{hyperref}{
  \hypersetup{
    bookmarksnumbered  = true,
    bookmarksopen      = true,
    bookmarksopenlevel = 1,
    linktoc            = all,
    unicode            = true,
    psdextra           = true,
  }
  \ifouc@pdf
    \hypersetup{
      colorlinks = true,
      allcolors  = cyan,
    }
  \else
    \hypersetup{hidelinks}
  \fi
}

% ===============================================
% Word Count


% ===============================================
% Custom Command

\renewenvironment{titlepage}{%
  \clearpage
  \thispagestyle{empty}%
}{\clearpage}

\newcommand\blankpage{%
  \null
  \thispagestyle{empty}%
  \addtocounter{page}{-1}%
  \newpage
}

\newcommand\zhspace[1][1]{\hspace{#1\ccwd}}

% ===============================================
% Fonts Setting

\newcommand\ouc@strifeq{\csname str_if_eq_x:nnTF\endcsname}
\newcommand\ouc@fontset{\csname g__ctex_fontset_tl\endcsname}
\ifouc@enmac
  \renewcommand\ouc@fontset{mac}
\fi

\ouc@strifeq{\ouc@fontset}{fandol}{
  \setmainfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyretermes}
  \setsansfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyreheros}
  \setmonofont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    Scale          = MatchLowercase,
  ]{texgyrecursor}
  \ClassWarningNoLine{oucthesis}{%
    You are using Fandol font family.\MessageBreak
    Some glyphs may be missing.\MessageBreak
    Please switch to a high-quality font set
  }
}{
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \ouc@strifeq{\ouc@fontset}{mac}{
    \setmonofont[Scale=MatchLowercase]{Menlo}
  }{
    \setmonofont[Scale=MatchLowercase]{Courier New}
  }
}
\ouc@strifeq{\ouc@fontset}{mac}{
  \setCJKmainfont[
       UprightFont = * Light,
          BoldFont = * Bold,
        ItalicFont = Kaiti SC,
    BoldItalicFont = Kaiti SC Bold,
  ]{Songti SC}
  \setCJKsansfont[BoldFont=* Medium]{Heiti SC}
  \setCJKfamilyfont{zhsong}[
       UprightFont = * Light,
          BoldFont = * Bold,
  ]{Songti SC}
  \setCJKfamilyfont{zhhei}[BoldFont=* Medium]{Heiti SC}
  \setCJKfamilyfont{zhkai}[BoldFont=* Bold]{Kaiti SC}
  \xeCJKsetwidth{‘’“”}{1em}
}{
  \xeCJKsetup{EmboldenFactor=2}
  \ouc@strifeq{\ouc@fontset}{windows}{
    \IfFileExists{C:/bootfont.bin}{
      \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi_GB2312]{SimSun}
      \setCJKfamilyfont{zhkai}[AutoFakeBold]{KaiTi_GB2312}
    }{
      \setCJKmainfont[AutoFakeBold,ItalicFont=KaiTi]{SimSun}
      \setCJKfamilyfont{zhkai}[AutoFakeBold]{KaiTi}
    }
    \setCJKsansfont[AutoFakeBold]{SimHei}
    \setCJKfamilyfont{zhsong}[AutoFakeBold]{SimSun}
    \setCJKfamilyfont{zhhei}[AutoFakeBold]{SimHei}
  }{
    \ouc@strifeq{\ouc@fontset}{adobe}{
      \setCJKmainfont[
        AutoFakeBold = true,
        ItalicFont   = AdobeKaitiStd-Regular,
      ]{AdobeSongStd-Light}
      \setCJKsansfont[AutoFakeBold]{AdobeHeitiStd-Regular}
      \setCJKfamilyfont{zhsong}[AutoFakeBold]{AdobeSongStd-Light}
      \setCJKfamilyfont{zhhei}[AutoFakeBold]{AdobeHeitiStd-Regular}
      \setCJKfamilyfont{zhkai}[AutoFakeBold]{AdobeKaitiStd-Regular}
    }{}
  }
}

\newdimen\bp@
\bp@=1bp
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12\bp@}{23\bp@}%
  \abovedisplayskip 12\bp@ \@plus3\bp@ \@minus7\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}
\normalsize
\renewcommand\small{%
  \@setfontsize\small{10.5\bp@}{19.25\bp@}%
  \abovedisplayskip 10.5\bp@ \@plus3\bp@ \@minus6\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6.5\bp@ \@plus3.5\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
  \@setfontsize\footnotesize{9\bp@}{16.5\bp@}%
  \abovedisplayskip 9\bp@ \@plus2\bp@ \@minus5\bp@
  \abovedisplayshortskip \z@ \@plus3\bp@
  \belowdisplayshortskip 6\bp@ \@plus3\bp@ \@minus3\bp@
  \belowdisplayskip \abovedisplayskip
}
\renewcommand\scriptsize{\@setfontsize\scriptsize{7.5\bp@}{13.75\bp@}}
\renewcommand\tiny{\@setfontsize\tiny{6.5\bp@}{11.92\bp@}}
\renewcommand\large{\@setfontsize\large{15\bp@}{27.5\bp@}}
\renewcommand\Large{\@setfontsize\Large{18\bp@}{33\bp@}}
\renewcommand\LARGE{\@setfontsize\LARGE{22\bp@}{40.33\bp@}}
\renewcommand\huge{\@setfontsize\huge{24\bp@}{44\bp@}}
\renewcommand\Huge{\@setfontsize\Huge{26\bp@}{47.67\bp@}}

\linespread{1}\selectfont
\newcommand\ouc@setchinese{%
  \xeCJKResetPunctClass
}
\newcommand\ouc@setenglish{%
  \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
  \xeCJKDeclareCharClass{HalfRight}{%
    "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A%
  }%
}
\ouc@setchinese

% ===============================================
% Page Format 

\geometry{
  paper      = a4paper,
  vmargin    = 2.54cm,
  hmargin    = 3.17cm,
  headheight = 0.75cm,
  headsep    = 0.29cm,
  footskip   = 0.79cm,
}
\pagestyle{fancy}
\let\sectionmark\@gobble
\renewcommand\headrulewidth{0.5\p@}

% ===============================================
% Header Format 
\newcommand\ouc@hf@font{\fontsize{9\bp@}{12\bp@}\selectfont}
\newcommand\ouc@header{\@title}
\fancypagestyle{title}{%
  \fancyhf{}%
  \fancyhead[C]{\ouc@hf@font\ouc@header}%
  \fancyfoot[C]{\ouc@hf@font\thepage}%
  \ifouc@count
    \fancyfoot[R]{\color{gray}\ouc@hf@font \splice{texcount -sum -1 main.tex}}%
  \fi
}
\fancypagestyle{plain}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[C]{}
  \fancyfoot[C]{\ouc@hf@font\thepage}%
}
\pagestyle{title}

% ===============================================
% Pre Content Format 
\ctexset{
  chapter = {
    name        = {,},
    format      = \centering\sffamily\bfseries\fontsize{16\bp@}{26.67\bp@}\selectfont,
    nameformat  = {},
    number      = \thechapter,
    aftername   = \hspace{\ccwd},
    beforeskip  = 24\bp@,
    afterskip   = 18\bp@,
    fixskip     = true,
  },
}

% ===============================================
% Define Information

\newcommand*{\entitle}[1]{
  \def\ouc@entitle{#1}
}
\newcommand*{\advisor}[1]{
  \def\ouc@advisor{#1}
}
\newcommand*{\mythanks}[1]{
  \def\ouc@mythanks{#1}
}

\newcommand*{\keywords}[1]{
  \def\ouc@keywords{#1}
}

\newcommand*{\enkeywords}[1]{
  \def\ouc@enkeywords{#1}
}
% ===============================================
% Define Page Style
% Ackonwlegment
\newcommand\ouc@makeacknowledgment{
  \ouc@setchinese
  \begin{titlepage}%
    \centering
    {\sffamily\fontsize{18\bp@}{20\bp@}\ouc@mythanks}
    \parbox[t][0.6cm][t]{\textwidth}{%
      \raggedleft\sffamily\fontsize{18\bp@}{20\bp@}\selectfont
      \hdashrule[0.5ex]{5cm}{1.5pt}{1.5mm 1pt}\@author\par}\par
  \end{titlepage}
  \ifouc@pdf
  \else
  \blankpage
  \fi
}

% Preface
\newcommand\ouc@makepreface{
  \ouc@setchinese
  \begin{titlepage}%
    \centering
    \vspace*{36\bp@}
    \sffamily\fontsize{18\bp@}{20\bp@}\@title

    \vspace{140\bp@}
    \parbox[t][][t]{\textwidth}{%
      \raggedleft\songti\normalsize\selectfont
      学位论文完成日期：\uline{\makebox[30mm]{}}\par
      指导教师签字：\uline{\makebox[30mm]{}}\par
      答辩委员会成员签字：\uline{\makebox[30mm]{}}\par
      \uline{\makebox[30mm]{}}\par
      \uline{\makebox[30mm]{}}\par
      \uline{\makebox[30mm]{}}\par
      \uline{\makebox[30mm]{}}\par
      \uline{\makebox[30mm]{}}\par
      \uline{\makebox[30mm]{}}\par

    }\par
  \end{titlepage}
  \ifouc@pdf
  \else
  \blankpage
  \fi
}

% Copyright

\newcommand\ouc@makecopyright{
  \ouc@setchinese
  \begin{titlepage}%
    {
      \centering\bf\large
       独\zhspace[1]创\zhspace[1]声\zhspace[1]明 \par
    }
    本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含未获得\uline{（注：如没有其他需要特别声明的，本栏可空）}或其他教育机构的学位或证书使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。
    \par
    \vspace{4em}
    \rightline{学位论文作者签名：\zhspace[5]签字日期：\zhspace[2]年\zhspace[1.5]月\zhspace[1.5]日\ }
    \par
  
    \noindent\hdashrule[0.5ex]{\textwidth}{0.5pt}{1.5mm 1pt}

    {
      \centering\bf\large
      学位论文版权使用授权书 \par
    }
    本学位论文作者完全了解学校有关保留、使用学位论文的规定，并同意以下事项：\par
    1.学校有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许论文被查阅和借阅。\par
    2.学校可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。同时授权清华大学“中国学术期刊(光盘版)电子杂志社”用于出版和编入CNKI《中国知识资源总库》，授权中国科学技术信息研究所将本学位论文收录到《中国学位论文全文数据库》。（保密的学位论文在解密后适用本授权书）
    \par
    \vspace{4em}
    学位论文作者签名：\zhspace[10]导师签字：\zhspace[8] \par
    \vspace{1em}
    \noindent 签字日期：\zhspace[2]年\zhspace[1.5]月\zhspace[1.5]日\zhspace[6]签字日期：\zhspace[2]年\zhspace[1.5]月\zhspace[1.5]日 \par

  \end{titlepage}
  \ifouc@pdf
  \else
  \blankpage
  \fi
}

% Abstract

\NewDocumentCommand\ouc@chapter{o m}{%
  \IfValueTF{#1}{%
    \chaptermark{#1}%
  }{%
    \chaptermark{#2}%
  }%
  {
  \makeatletter\c@secnumdepth=-1\makeatother
  \chapter{#2}
  }
  }
\newcommand\pagenumberingnoreset[1]{\gdef\thepage{\csname @#1\endcsname\c@page}}


% Abstract
\let\standardclearpage\clearpage
\newenvironment{abstract}{%
  \clearpage
  \pagestyle{plain}%
  \pagenumberingnoreset{Roman}
  \ouc@setchinese
  \begin{center}
    \fontsize{16\bp@}{26.67\bp@}\sffamily\@title
  \end{center}
  \let\clearpage\relax
  \ouc@chapter{摘\zhspace[1]要}
  \let\clearpage\standardclearpage
  \vspace{1em}
}{
  \par\null\par\noindent\hangindent=4\ccwd\relax
  \sffamily\textbf{关键词：\ouc@keywords}
  \clearpage
  \pagestyle{title}
  \pagenumberingnoreset{arabic}
}

\newenvironment{enabstract}{%
  \clearpage
  \pagestyle{plain}
  \pagenumberingnoreset{Roman}
  \ouc@setenglish
  \begin{center}
    \fontsize{16\bp@}{26.67\bp@}\sffamily\ouc@entitle
  \end{center}
  \let\clearpage\relax
  \ouc@chapter[Abstract]{Abstract}%
  \let\clearpage\standardclearpage
  \vspace{1em}
}{
  \par\null\par\noindent\hangindent=5.3em\relax
  \textbf{Key Words: \ouc@enkeywords}
  \clearpage
  \pagestyle{title}
  \pagenumberingnoreset{arabic}
}

% Toc
\renewcommand\tableofcontents{%
  \pagestyle{empty}
  \chapter*{\contentsname}%
  \@starttoc{toc}%
  \clearpage
  \pagestyle{title}
}

\newcommand\ouc@leaders{\titlerule*[4\bp@]{\textperiodcentered}}
\titlecontents{chapter}
[\z@]{\fontsize{14\bp@}{25.67\bp@}\selectfont}
{\contentspush{\thecontentslabel\unskip\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}
\titlecontents{section}
[\ccwd]{\normalsize}
{\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}
\titlecontents{subsection}
[2\ccwd]{\normalsize}
{\contentspush{\thecontentslabel\hspace{\ccwd}}}{}
{ \ouc@leaders\contentspage}


\newcommand\makeprepage{%
  \ouc@makeacknowledgment
  \ouc@makepreface
  \ouc@makecopyright
  \setcounter{page}{1}
}

% ===============================================
% Main Content Format 

\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter
}
\renewcommand\mainmatter{
  \clearpage
  \pagestyle{title}
  \setcounter{page}{1}
  \ctexset{
    chapter = {
      format      = \sffamily\bfseries\fontsize{16\bp@}{26.67\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      beforeskip  = 1em,
      afterskip   = 1.8em,
      fixskip     = true,
    },
    section = {
      format = \sffamily\fontsize{14\bp@}{25.67\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      afterskip   = 1.2em,
      fixskip     = true,
    },
    subsection = {
      format    = \fontsize{12\bp@}{22\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      afterskip   = 1.2em,
      fixskip     = true,
      indent    = \z@,
    },
    subsubsection = {
      format    = \rmfamily\fontsize{12\bp@}{22\bp@}\selectfont,
      aftername   = \zhspace[0.5],
      fixskip     = true,
      indent    = \ccwd,
    },
    paragraph = {
      format    = \rmfamily\fontsize{12\bp@}{22\bp@}\selectfont,
      aftername = {},
      indent    = \ccwd,
    },
  }
}

% Caption Stype
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\counterwithin{algorithm}{chapter}
\renewcommand{\thealgorithm}{\thechapter-\arabic{algorithm}}
\floatname{algorithm}{算法}
\DeclareCaptionLabelSeparator{space}{ }
\captionsetup{
   labelsep=space
}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\RequirePackage{mathtools}
\newtagform{test}[]{式（}{）}
\usetagform{test}

% ===============================================
% Tail Content Format 
\newcommand\makeafter{
  \clearpage
  \ctexset{
    chapter = {
      name        = {,},
      format      = \centering\sffamily\bfseries\fontsize{14\bp@}{25.67\bp@}\selectfont,
      nameformat  = {},
      number      = \thechapter,
      aftername   = \hspace{\ccwd},
      beforeskip  = 24\bp@,
      afterskip   = 18\bp@,
      fixskip     = true,
    },
    section = {
      name        = {,},
      format      = \centering\sffamily\bfseries\normalsize\selectfont,
      nameformat  = {},
      number      = \thechapter,
      aftername   = \hspace{\ccwd},
      beforeskip  = 24\bp@,
      afterskip   = 18\bp@,
      fixskip     = true,
    },
  }
}

\newcommand\bibstyle@super{\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\citestyle{super}
\renewcommand\bibfont{\fontsize{10.5\bp@}{20\bp@}\selectfont}
\setlength{\bibsep}{0\p@ \@plus.2\p@}
\setlength{\bibhang}{2\ccwd}
\renewcommand\@biblabel[1]{[#1]\hfill}

\renewcommand\bibsection{%
  \makeafter
  \ouc@chapter{\bibname}%
}

\newenvironment{ackonwlegmentback}{%
  \clearpage
  \makeafter
  \ouc@setchinese
  \ouc@chapter{致\zhspace[1]谢}
}{
  \clearpage
}

\newenvironment{profile}{%
  \clearpage
  \makeafter
  \ouc@setchinese
  \ouc@chapter{个人简历、在学期间发表的学术论文与研究成果}
}{
  \clearpage
}