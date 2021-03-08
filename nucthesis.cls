%% Noroff university College Thesis Style file
%% Inspired by   RU Computer Science Class  2010
%% (c) Barry Irwin 2021

%% changelog
%% version 0.1 Initial release 

%% TODO
% Add wordcount
% Add disclaimer
% Fix citation/style



%---------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nucthesis}[2021/03/08 Noroff University College Thesis Class]

\newcommand{\Degree}{Bachelor of Interpretive Dance} %% default
\DeclareOption{CSE}{\renewcommand{\Degree}{Bachelor in Cyber Security}}
\DeclareOption{DFO}{\renewcommand{\Degree}{Bachelor in Digital Forensics}} 
\DeclareOption{ADS}{\renewcommand{\Degree}{Bachelor in Applied Data Science} }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
%\ProcessOptions
% we are based off the core report class so pass this through  *again*
%
\if@twoside%
    \LoadClass[12pt, a4paper, twoside]{report} %% twoside=true
\else%
    \LoadClass[12pt, a4paper]{report} %% twoside=false
\fi%


\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}

\RequirePackage[hyphens]{url} % make sure to split on hyphens for urls
\usepackage{hyperref} % There are lots of options that can be added here. RTFM - https://ctan.org/pkg/hyperref?lang=en
\RequirePackage{doi} % hyperlinks DOI's in refs


%page Setup - DO NOT ALTER
\RequirePackage{geometry}
    \if@twoside%
        \geometry{left=25mm,right=25mm,bindingoffset=10mm, top=20mm,bottom=35mm} %% twoside=true
    \else%
        \geometry{left=25mm,right=25mm,bindingoffset=0mm, top=20mm,bottom=35mm} %% twoside=false
    \fi%

%% packages dealing with layout
\RequirePackage{color}
\RequirePackage{fancybox}
\RequirePackage{fancyhdr}
\RequirePackage[parfill]{parskip} %Sets full justification and paragraph spacing} 

%% some other useful components
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{setspace}
%\RequirePackage{acmart} %% required for ACM CCS - see https://www.acm.org/publications/class-2012

\RequirePackage[english]{babel} % set UK spelling.
\RequirePackage[autostyle]{csquotes}
\MakeOuterQuote{"} %prevents backwards quote symbols

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax


%% define Hyperref  details here
\hypersetup{
	colorlinks=true, %set true if you want coloured links
	linktoc=all,     %set to all if you want both sections and subsections linked
	linkcolor=black,  %choose some color if you want links to stand out	
	citecolor=black,
%	citecolor=blue,
    filecolor=blue,      
    urlcolor=blue, % ULRS via \url and \hyperref
}
	
\newcommand{\NUCLogo}{images/NoroffUClogoH.jpg}

%\newcommand{\Degree}{Doctor of Philosophy of Science}
%\newcommand{\Degree}{Bachelor of Interpretive Dance} %% default
%\newcommand{\mydeg}{Bachelor in Cyber Security}
%\newcommand{\Degree}{Bachelor in Digital Forensics}
%\newcommand{\Degree}{Bachelor in Applied Data Science}

%\ifthenelse{\equal{\mydegree}{"CSE"}}{\renewcommand{\Degree}{Bachelor in Cyber Security}}{}
%\ifthenelse{ree \equal DFO}{\renewcommand{\Degree}{Bachelor in Digital Forensics}}
%\ifthenelse{gree \equal ADS}{\renewcommand{\Degree}{Bachelor in Applied Data Science}}


%disabled till we have alternate types
\newcommand{\DegType}{partial fulfilment}
%\newcommand{\degree}[1]{\renewcommand{\Degree}{#1}}
%\newcommand{\partdegree}[1]{\renewcommand{\Degree}{#1} \renewcommand{\DegType}{partial fulfilment}}
%\newcommand{\fulldegree}[1]{\renewcommand{\Degree}{#1} \renewcommand{\DegType}{partial fulfilment}}
\newcommand{\TitleBox}{false}
\newcommand{\titlebox}[1]{\renewcommand{\TitleBox}{#1}}
\newcommand{\Logo}{true}
\newcommand{\logo}[1]{\renewcommand{\Logo}{#1}}

\newcommand{\SetMargins}[3]{
	\setlength{\hoffset}{-1in + (#1 / 2)}
	\setlength{\voffset}{-1in}
	\setlength{\oddsidemargin}{#1}
	\setlength{\evensidemargin}{#1}
	\setlength{\topmargin}{#1}
	\ifthenelse{\boolean{#2}}{\setlength{\headheight}{15pt}%
		\setlength{\headsep}{20pt}}{\setlength{\headheight}{0pt}%
		\setlength{\headsep}{0pt}}
	\ifthenelse{\boolean{#3}}{\setlength{\footskip}{35pt}}%
		{\setlength{\footskip}{0pt}}
	\setlength{\textheight}{\paperheight - \footskip - \headsep - \headheight - \topmargin - #1}
	\setlength{\textwidth}{\paperwidth - (#1 * 2) - (#1 / 2)}

	\setlength\parskip{\bigskipamount}
	\setlength\parindent{0pt}
	\onehalfspacing
}

%rename Bibliography to references when using bibtex
\renewcommand\bibname{References}
% set some full details
\newcommand\ackname{Acknowledgements}
 
\newcommand{\plagdeclaration}{
    \chapter*{Declaration}
    I declare that the work presented for assessment in this submission is my own, that it has not previously been presented for another assessment, and that work completed by others has been appropriately acknowledged.
    \vspace{3cm} \newline
    Name:\noindent\rule{6cm}{0.4pt} Date:\noindent\rule{4cm}{0.4pt}
    \thispagestyle{empty} 
}

\renewcommand{\headrulewidth}{\iffloatpage{0pt}{0.4pt}}
\pagestyle{fancy}

\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername}\ \thechapter}{}}


%\fancypagestyle{plain}{\fancyhf{}\fancyhead[R]{\thepage}}
\fancyhf{}\fancyhead[R]{\thepage}
\fancyhead[L]{\iffloatpage{}{\slshape \rightmark}}

\newcommand{\mylocation}{Kristiansand, Norway}

\renewcommand{\maketitle}{%
	\begin{titlepage}%
	\begin{center}%
	\ifthenelse{\boolean{\Logo}}{\includegraphics[scale=0.75]{\NUCLogo}\vfill}{\vspace*{\fill}}%
	\ifthenelse{\boolean{\TitleBox}}{
	\Ovalbox{\begin{minipage}[c][\height + 6cm][c]{(\textwidth * 3) / 4}\begin{center}%
	\vspace*{\fill}\LARGE\textsc{\@title}%
	\large\vfill%
	Submitted in \DegType\\%
	of the requirements of the degree of\vskip 0.5em\textsc{\Degree}\vskip 0.5em%
	of Noroff University College%
	\vfill\Large\@author\vspace*{\fill}%
	\end{center}\end{minipage}}}{%

	\begin{center}%
	\vspace*{\fill}\LARGE\textsc{\@title}%
	\large\vfill%
	Submitted in \DegType\\%
	of the requirements of the degree of\vskip 0.5em\textsc{\Degree}\vskip 0.5em%
	of Noroff University College%
	\vfill\Large\@author\vspace*{\fill}%
	\end{center}}%

	\vfill\normalsize%
	\emph{\mylocation}\\%
	\ifcase\month\or  January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December\fi
  \space\number\year
	\month \year  %@date
  \end{center}%
	\end{titlepage}%
}


\if@titlepage
  \newenvironment{ack}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \ackname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{ack}{%
      \if@twocolumn
        \section*{\ackname}%
      \else
        \small
        \begin{center}%
          {\bfseries \ackname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi

\newcommand\acmname{ACM Computing Classification System Classification}

\if@titlepage
  \newenvironment{acm}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \acmname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{acm}{%
      \if@twocolumn
        \section*{\acmname}%
      \else
        \small
        \begin{center}%
          {\bfseries \ackname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi
