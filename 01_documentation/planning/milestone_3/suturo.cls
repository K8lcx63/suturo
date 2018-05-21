% -----------------------------------------------------------------------
% pi1.cls
% Based on pi1-muster.tex and defs.tex used before 2003 for
% PI 1 in Bremen.
% Adapted by Thomas Röfer and Malte Kuhn (uni@monkz.de)
% Further adapted by Sebastian Offermann

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{suturo}
\LoadClass[11pt,a4paper,twoside]{article}
\usepackage[ngerman]{babel}
\usepackage{fancyhdr}
\usepackage{graphicx}
\usepackage[utf8]{inputenc}
\usepackage{listings}
\usepackage{url}
\usepackage{tocloft}
\usepackage{color}

% -----------------------------------------------------------------------
% Page layout

% enlarge page
\setlength{\textwidth}{16cm}
\setlength{\topmargin}{-1cm}
\setlength{\evensidemargin}{0cm}
\setlength{\oddsidemargin}{0cm}
\setlength{\textheight}{24cm}

% skip between paragraphs
\setlength{\parskip}{1ex}
% ... and no indentation at start of a new paragraph
\setlength{\parindent}{0ex}

\newcommand{\thissemester}{Wintersemester 17/18}
\newcommand{\thistitle}{Dokumentation}
\newcommand{\thisshorttitle}{Suturo} % used in headings

\pagestyle{fancy}
\thispagestyle{empty}

%Layout for lstlistings
\lstloadlanguages{Java} % Java-Sprache laden, notwendig wegen option 'savemem'

% neues command ...
\newcommand{\code}[3]{\lstinputlisting[linerange=#1-#1_end, caption=#2.hs]{#3}}

\definecolor{myBGcolor}{rgb}{0.94,0.94,1}
\definecolor{javadocblue}{rgb}{0.25,0.35,0.80} % javadoc
\definecolor{keywordcolor}{rgb}{0,0,0.8}
\definecolor{stringcolor}{rgb}{0,0.5,0}
\definecolor{inlinecolor}{rgb}{1,0.85,0.85}

% inline quellcode für Methoden
\newcommand*{\ilcode}[1]{%
    \colorbox{inlinecolor}%
    {%
        \lstinline!#1!%
    }
}
\lstset{
    language=Haskell,
    rangeprefix=---,rangesuffix=---,
    includerangemarker=false,columns=spaceflexible,
    numbers=left,
    numberstyle=\tiny,
    numbersep=5pt,
    literate=%
        {Ö}{{\"O}}1
        {Ä}{{\"A}}1
        {Ü}{{\"U}}1
        {ß}{{\ss}}1
        {ü}{{\"u}}1
        {ä}{{\"a}}1
        {ö}{{\"o}}1
        {~}{{\textasciitilde}}1
        {°}{{$^\circ$}}1,
    basicstyle=\fontfamily{pcr}\selectfont\footnotesize,
    showspaces=false,
    showtabs=true,
    showstringspaces=false,
    keywordstyle=\bfseries,
    tabsize=4,
    frameround=ffff,
    frame=single,
    extendedchars=true,
    commentstyle=\itshape,
    postbreak=\space,
    breakindent=5pt,
    breaklines=true,
    backgroundcolor=\color{myBGcolor},
}

%\lstset{language=Bash,
%rangeprefix=---,rangesuffix=---,
%  includerangemarker=true,columns=spaceflexible,
%   keywordstyle=\color{keywordcolor},
%   stringstyle=\color{red}\ttfamily,
%   commentstyle=\color{stringcolor},
%   breaklines=true,
%   numbers=left,
%   numberstyle=\small,
%   frame=single,
%   backgroundcolor=\color{myBGcolor},
%   morecomment=[s][\color{javadocblue}]{/**}{*/}
%}

% -----------------------------------------------------------------------
% Main macros

\renewcommand{\maketitle}[8]
          {\@maketitle{#1}{#2}{#3}{#4}{#5}{#6}{#7}{#8}}
\renewcommand\thesection{\arabic{section}}
\newcommand\skipsection{\stepcounter{section}}

\newlength{\seclen}
\settowidth{\seclen}{\textbf{}}
\newlength{\subseclen}
\settowidth{\subseclen}{}
\addtolength{\cftsecnumwidth}{\seclen}
\addtolength{\cftsubsecnumwidth}{\subseclen}
\addtolength{\cftsubsubsecnumwidth}{\subseclen}

% -----------------------------------------------------------------------
% Misc macros

\newcommand{\grenzop}[3]{\mathop{#1}\limits^{#2}_{#3}}
\newcommand{\langrechtspfeil}[2]{\grenzop{\longrightarrow}{#1}{#2}}
\newcommand{\bob}[0]{\hspace*{\fill}$\Box$}

% -----------------------------------------------------------------------

\renewcommand{\@maketitle}[8]
{
    \begin{tabular}[t]{lr}
      \begin{tabular}[t]{l}
        \begin{tabular}[t]{l@{\hskip 10mm}l}
            \thistitle & \thissemester \hspace{4ex} \\
             Meilenstein: {#4} \\
        \end{tabular} \vspace{5mm} \\
        {\Huge\sf {Dokumentation: } {#1} } \\[1.5ex]
        {\Large  Datum: {#2}} \\[1ex]
      \end{tabular}
      &
      \begin{tabular}[t]{l}
          {#5}\\
          {#6}\\
          {#7}\\
    {#8}\\
      \end{tabular} \\[2ex]
    \end{tabular}\\
    \rule{\linewidth}{1pt}

% -----------------------------------------------------------------------
% Create headings (Thanks to Elmar Loos)

    \fancyhead{} %clear all fields
    \fancyhead[LO,RE]{\thisshorttitle, \thissemester}
    \fancyhead[RO,LE]{Gruppe: {#1}}
    \fancyfoot{} %clear all fields
    \fancyfoot[RO,LE]{\thepage}
}

\endinput
