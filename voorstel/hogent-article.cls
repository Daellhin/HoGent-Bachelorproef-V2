%===============================================================================
% LaTeX-sjabloon voor een artikel voor gebruik in de opleiding toegepaste
% informatica aan HOGENT.
%
% Gebaseerd op ``Stylish Article'' class Version 2.1 (1/10/15)
% Originele stijl beschikbaar op: http://www.LaTeXTemplates.com
%
% Originele auteur:
% Mathias Legrand (legrand.mathias@gmail.com), met uitgebreide aanpassingen door
% Vel (vel@latextemplates.com).
%
% Aanpassingen voor HOGENT:
% Jens Buysse (jens.buysse@hogent.be) en Bert Van Vreckem
% (bert.vanvreckem@hogent.be)
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
%===============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hogent-article}[2019/01/10 Artikel voor gebruik in de opleiding toegepaste informatica aan HOGENT]

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{ifpdf}      % Needed to pick between latex and pdflatex

\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}

%-------------------------------------------------------------------------------
% Algemene vormgeving, pagina-indeling
%-------------------------------------------------------------------------------

\RequirePackage[%
a4paper,
bottom=2.1cm,
left=1.7cm,
right=1.7cm,
top=2.1cm,
footskip=37pt,
headheight=12pt
]{geometry}

\RequirePackage{booktabs}
\RequirePackage{graphicx}

\RequirePackage{enumitem}
\setlist{nolistsep} % Geen ruimte tussen items in een list

\usepackage{hyperref}
\hypersetup{hidelinks,colorlinks,breaklinks=true,urlcolor=black,citecolor=color2,linkcolor=color2,bookmarksopen=false}

%----------------------------------------------------------------------
% Lettertypes en kleuren
%----------------------------------------------------------------------

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{times}      % Loads the Times-Roman Fonts
\RequirePackage{mathptmx}   % Loads the Times-Roman Math Fonts

\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{csquotes}

\RequirePackage{xcolor}

\definecolor{color1}{RGB}{0,147,208} % Color of the article title and sections
\definecolor{color2}{RGB}{0,20,20}   % Color of the boxes behind the abstract and headings

%-------------------------------------------------------------------------------
% Taal, lokalisatie
%-------------------------------------------------------------------------------

\RequirePackage[english,dutch]{babel}
\RequirePackage{iflang}

%-------------------------------------------------------------------------------
% Bijschrift bij afbeeldingen en tabellen
%-------------------------------------------------------------------------------

\RequirePackage[labelfont={bf,sf,small},%
labelsep=period,%
justification=raggedright]{caption}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%-------------------------------------------------------------------------------
% Vormgeving sectiekoppen
%-------------------------------------------------------------------------------

\RequirePackage[explicit]{titlesec}
\titleformat{\section}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering\arabic{section}. #1}}}
  []
\titleformat{name=\section,numberless}
  {\color{color1}\large\sffamily\bfseries}
  {}
  {0em}
  {\colorbox{color2!10}{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\centering#1}}}
  []
\titleformat{\subsection}
  {\color{color1}\sffamily\bfseries}
  {\thesubsection}
  {0.5em}
  {#1}
  []
\titleformat{\subsubsection}
  {\sffamily\small\bfseries}
  {\thesubsubsection}
  {0.5em}
  {#1}
  []
\titleformat{\paragraph}[runin]
  {\sffamily\small\bfseries}
  {}
  {0em}
  {#1}
\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%-------------------------------------------------------------------------------
% Inhoudstafel
%-------------------------------------------------------------------------------

\usepackage{titletoc}

\newlength{\tocsep}
\setlength\tocsep{1.5pc} % Inspringen
\setcounter{tocdepth}{3} % neem 3 niveaus op in de inhoudstafel

\contentsmargin{0cm}
\titlecontents{section}[\tocsep]
  {\addvspace{4pt}\small\bfseries\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\hfill\thecontentspage}
  []
\titlecontents{subsection}[\tocsep]
  {\addvspace{2pt}\sffamily}
  {\contentslabel[\thecontentslabel]{\tocsep}}
  {}
  {\ \titlerule*[.5pc]{.}\ \thecontentspage}
  []
\titlecontents*{subsubsection}[\tocsep]
  {\footnotesize\sffamily}
  {}
  {}
  {}
  [\ \textbullet\ ]

%-------------------------------------------------------------------------------
% Meerdere auteurs
%-------------------------------------------------------------------------------

\newcount\@authcnt
\newcount\@tmpcnt\@tmpcnt\z@

\def\@affiliation{%
  \ifnum\@tmpcnt<\@authcnt
   \global\advance\@tmpcnt1
    \raggedright \csname @auth\romannumeral\the\@tmpcnt\endcsname\hfill\\%
   \let\next\@affiliation \vskip1pt
  \else
   \let\next\relax
  \fi
\next}

\newcommand{\affiliation}[1]{%
    \global\advance\@authcnt1
    \expandafter\gdef\csname @auth\romannumeral\the\@authcnt\endcsname
    {#1}}

%-------------------------------------------------------------------------------
% Titel, kader met samenvatting
%-------------------------------------------------------------------------------

\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\PaperType}[1]{\def\@PaperType{#1}}
\newcommand{\Authors}[1]{\def\@Authors{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\CoPromotor}[1]{\def\@CoPromotor{#1}}

\setlength{\columnsep}{0.55cm} % Distance between the two columns of text
\setlength{\fboxrule}{0.75pt} % Width of the border around the abstract

\renewcommand{\@maketitle}{%
\twocolumn[{%
\thispagestyle{empty}%
\vskip20pt%
{\raggedright\color{color1}\sffamily\bfseries\fontsize{20}{24}\selectfont \@PaperTitle\\}%
{\raggedright\color{color1}\sffamily\bfseries\fontsize{13}{15.6}\selectfont \@PaperType\par}%
\vskip10pt%
{\raggedright\color{color1}\sffamily\fontsize{12}{16}\selectfont  \@Authors\par}%
\vskip18pt%
\fcolorbox{color1}{white}{%
\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
\colorbox{color2!10}{%
\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
\sffamily\textbf{\abstractname}\\\@Abstract%
\ifx\@Keywords\@empty%
\else%
\\[4pt]\textbf{\keywordname}\\\@Keywords%
\fi%
\ifx\@CoPromotor\@empty%
\else%
\\[4pt]\textbf{Co-promotor}\\\@CoPromotor%
\fi%
}%
}%
\vskip4pt%
\begingroup%
\raggedright\sffamily\small%
\footnotesize\@affiliation\par%
\endgroup%%
}%
}%
\vskip25pt%
}]%
}

%----------------------------------------------------------------------
% Paginahoofding en voettekst
%----------------------------------------------------------------------

\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\pagestyle{fancy}          % Enables the custom headers/footers
% Headers
\lhead{\small\sffamily\bfseries\@PaperTitle}%
\chead{}%
\rhead{\thepage/\pageref{LastPage}}
% Footers
\lfoot{\sffamily\small\bfseries\@PaperType}%
\cfoot{}%
\rfoot{\includegraphics[height=1.1cm]{img/HOGENT_Logo_Pos_rgb.png}}%
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0pt}% % No footer rule

%----------------------------------------------------------------------
% Bibliografie
%----------------------------------------------------------------------

\RequirePackage[backend=biber,style=apa]{biblatex}
\DeclareLanguageMapping{dutch}{dutch-apa}
\addbibresource{voorstel.bib}

\endinput