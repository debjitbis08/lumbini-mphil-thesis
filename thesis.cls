\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2018/05/06 Custom class for IASE thesis]

\LoadClass[a4paper]{report}

\RequirePackage{tgtermes}
\RequirePackage[utf8]{inputenc}
\RequirePackage{titlesec}
\RequirePackage{fmtcount}
\RequirePackage{parskip}
\RequirePackage{scrextend}
\RequirePackage{setspace}
\RequirePackage[a4paper,bindingoffset=0.5in,margin=1in]{geometry}
\RequirePackage[overload]{textcase}
\RequirePackage[english]{babel}
\RequirePackage{hyperref}
\RequirePackage{csquotes}
\RequirePackage[
backend=biber,
style=mla,
citestyle=authoryear,
guessmedium=false
]{biblatex}

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
{\bfseries\Large\centering}{Chapter \Numberstringnum\thechapter}{1\p@}{\uppercase}[]
% https://tex.stackexchange.com/questions/63390/how-to-decrease-spacing-before-chapter-title#63393
\titlespacing*{\chapter}{0pt}{-50pt}{40pt}


\titleformat{\section}         % Customise the \section command 
 {\bfseries\large\raggedright}
 {\thesection}{1em}                      
 {}                           
 []                 

\renewcommand*{\nameyeardelim}{\addcomma\space}

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