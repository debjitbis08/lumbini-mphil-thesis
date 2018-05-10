\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2018/05/06 Custom class for IASE thesis]

\LoadClass[a4paper]{report}

\RequirePackage{tgtermes}
% \RequirePackage{pslatex}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\RequirePackage{fmtcount}
\RequirePackage{parskip}
\RequirePackage{scrextend}
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage[a4paper,bindingoffset=0.5in,margin=1in]{geometry}
\RequirePackage[overload]{textcase}
\RequirePackage[english]{babel}
\RequirePackage{hyperref}
\RequirePackage{csquotes}
\RequirePackage[
  backend=biber,
  style=mla,
  guessmedium=false,
  dashed=false
]{biblatex}
% \RequirePackage{tocloft}

\global\let\@institution\@empty
\global\let\@guide\@empty
\global\let\@course\@empty
\global\let\@department\@empty

\def\institution#1{\def\@institution{#1}}
\def\guide#1{\def\@guide{#1}}
\def\course#1{\def\@course{#1}}
\def\department#1{\def\@department{#1}}

% Paragraph styling
\setlength{\parindent}{\p@}
\setlength{\parskip}{1\baselineskip}

% Line spacing
%\onehalfspacing
%\doublespacing
\linespread{1.45}
  
\titleformat{name=\chapter}[display]
{\bfseries\Large\centering}{Chapter \Numberstringnum\thechapter}{1\p@}{}[]
% https://tex.stackexchange.com/questions/63390/how-to-decrease-spacing-before-chapter-title#63393
\titlespacing*{\chapter}{0pt}{-50pt}{40pt}


\titleformat{\section}         % Customise the \section command 
 {\bfseries\large\raggedright}
 {\thesection}{1em}                      
 {}                           
 []                 

% \renewcommand*{\nameyeardelim}{\addcomma\space}

\if@titlepage
  \renewenvironment{abstract}{%
        \newpage
        \addcontentsline{toc}{chapter}{ABSTRACT}
        \@beginparpenalty\@lowpenalty
        \begin{center}%
            \LARGE ABSTRACT
        \end{center}
        \@endparpenalty\@M}%
        {\par\vfil\null\endtitlepage}
\else
  \renewenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi

\newcommand\frontmatter{%
    \cleardoublepage
    \pagenumbering{roman}}
  
\newcommand\mainmatter{%
    \cleardoublepage
    \pagenumbering{arabic}}

\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi}
  
\newlength{\boxt}
\newlength{\boxb}
\def\signat#1#2{%
\settowidth{\boxt}{#1}
\settowidth{\boxb}{#2}
\ifdim\the\boxt>\the\boxb
    \parbox{\the\boxt}{#1\par #2}
\else
    \parbox{\the\boxb}{#1\par #2}
\fi}

% \DeclareNameFormat{family-given-bold}{
%     \ifgiveninits
%         {\usebibmacro{name:family-given}
%           {\mkbibbold\namepartfamily}
%           {\namepartgiveni}
%           {\namepartprefix}
%           {\namepartsuffix}}
%         {\usebibmacro{name:family-given}
%           {\namepartfamily}
%           {\namepartgiven}
%           {\namepartprefix}
%           {\namepartsuffix}}%
%         \usebibmacro{name:andothers}}

% \DeclareNameAlias{sortname}{family-given-bold}

% \DeclareNameFormat{last-first-fb}{%
%   \ifnumequal{\value{listcount}}{1}
%     {\renewcommand*{\mkbibnamelast}[1]{\mkbibbold{##1}}}
%     {\renewcommand*{\mkbibnamelast}[1]{##1}}%
%   \iffirstinits
%     {\usebibmacro{name:last-first}{#1}{#4}{#5}{#7}}
%     {\usebibmacro{name:last-first}{#1}{#3}{#5}{#7}}
%   \usebibmacro{name:andothers}}

\DeclareNameFormat{last-first-bold}{%
  \ifthenelse{\value{listcount}=1}
    {\textbf{\namepartfamily}%
     \ifblank{\namepartgiven}{}{
     \addcomma\space\namepartgiven}}
    {\ifblank{\namepartgiven}{}{\namepartgiven\space}%
    \namepartfamily}%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}}

\DeclareNameAlias{sortname}{last-first-bold}

% \renewbibmacro*{name:last-first}[4]{%
%   \ifuseprefix
%     {\usebibmacro{name:delim}{#3#1}%
%      \usebibmacro{name:hook}{#3#1}%
%      \ifblank{#3}{}{%
%        \ifcapital
%          {\mkbibbold{\mkbibnameprefix{\MakeCapital{#3}}\isdot}}
%          {\mkbibbold{\mkbibnameprefix{#3}\isdot}}%
%        \ifpunctmark{'}{}{\bibnamedelimc}}%
%      \mkbibbold{\mkbibnamelast{#1}\isdot}%
%      \ifblank{#4}{}{\bibnamedelimd\mkbibnameaffix{#4}\isdot}%
%      \ifblank{#2}{}{\revsdnamepunct\bibnamedelimd\mkbibnamefirst{#2}\isdot}}
%     {\usebibmacro{name:delim}{#1}%
%      \usebibmacro{name:hook}{#1}%
%      \mkbibbold{\mkbibnamelast{#1}\isdot}%
%      \ifblank{#4}{}{\bibnamedelimd\mkbibnameaffix{#4}\isdot}%
%      \ifblank{#2#3}{}{\revsdnamepunct}%
%      \ifblank{#2}{}{\bibnamedelimd\mkbibnamefirst{#2}\isdot}%
%      \ifblank{#3}{}{\bibnamedelimd\mkbibnameprefix{#3}\isdot}}}

% \DeclareNameAlias{sortname}{last-first}

\setlength{\bibitemsep}{\baselineskip}

% \addtocontents{toc}{\cftpagenumbersoff{chapter}}

\renewcommand*{\contentsname}{Summary}


\newcommand{\chap}[1]{%
  \stepcounter{chapter}
  \chapter*{Chapter \Numberstringnum\thechapter\\ \uppercase{#1}}
  \addtocontents{toc}{\protect\contentsline{chapter}{\protect\numberline{\thechapter}#1}{}{chapter.\thechapter}}
}