%----------------------------------------------------------------------------------------------------------------------+
%| DOCUMENT CLASS                                                                                                      |
%----------------------------------------------------------------------------------------------------------------------+

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{template}[2023/10/13 v1.1 Custom LaTeX Class]  % Added version info
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax
\LoadClass[
    11pt,
    a4paper,
    oneside,            % oneside, twoside
    titlepage=true,     % Enables title page environment.
    DIV=calc,           % Auto-calculate type area. Alternatives: DIV=<integer> to manually set the type area.
    BCOR=17mm,          % Binding correction. Adjust this value to fit the binding.
    headsepline,        % Horizontal line below header. Alternative: noheadsepline to remove the line.
    footsepline=false,  % No line above footer. Alternative: footsepline to insert a line.
    open=any,           % Chapters start on any page. Alternative: openright for right-hand pages only.
    fleqn,              % Left-align equations. Remove for centered equations.
    abstract=true,      % Disable abstract environment.
    listof=totoc,       % Lists (figures, tables) in TOC. Alternative: listof=no to exclude from TOC.
    bibliography=totoc, % Bibliography in TOC. Alternative: bibliography=notoc to exclude from TOC.
    headinclude=true,   % Header included in type area calculation.
    footinclude=false,  % Footer excluded from type area calculation.
    numbers=enddot,     % No ending dot in chapter/section numbers. Alternative: numbers=enddot to include an ending dot.
]{scrreprt}

%----------------------------------------------------------------------------------------------------------------------+
%| PACKAGE INCLUSION: Grouped by functionality                                                                         |
%----------------------------------------------------------------------------------------------------------------------+

%--- Typography and Encoding ---
% These packages ensure proper character encoding and enhance the overall appearance of the text.
\usepackage[utf8]{inputenc}  % Allows input of special characters directly.
\usepackage[T1]{fontenc}   % Provides font encoding for proper hyphenation and glyph representation.
\usepackage[english]{babel}  % Multilingual support.
\usepackage{microtype}       % Improves typography by adjusting spacing between letters and words.

%--- Graphics and Colors ---
\usepackage{graphicx}           % Supports the inclusion of images.
\usepackage[export]{adjustbox}  % Provides vertical alignment options.
\usepackage{xcolor}             % Supports the definition and use of colors.
\definecolor{RSColor}{RGB}{68, 153, 228}  % Defines a custom color.
\definecolor{HMColor}{RGB}{233, 97, 91}   % Defines another custom color.

%--- Tables and Floats ---
% These packages enhance the creation and management of tables and other floating elements.
\usepackage{tabularx}        % Extended table support including flexible column widths.
\usepackage{multirow}        % Allows cells spanning multiple rows in tables.
\usepackage{float}           % Improved interface for floating objects.
\usepackage{makecell}        % Enhanced cell creation in tables.
\usepackage{colortbl}        % Adds colored cells in tables.
\usepackage{booktabs}        % Enhances the quality and appearance of tables.
\usepackage{subfig}          % Provides support for subfigures.
% \usepackage{subcaption}      % For sub-figures and sub-captions

%--- Math and Symbols ---
% These packages provide various symbols and formatting options for mathematical content.
\usepackage[intlimits]{amsmath}  % Enhanced math support.
\usepackage{amssymb}            % Extended symbol library.
\usepackage{mathtools}          % Adds more math tools.
\usepackage{nccmath}            % Adds more math tools.
\usepackage{trfsigns}           % Provides support for transformation signs.
\usepackage{siunitx}            % Provides support for SI units.
\usepackage{amssymb}            % For using checkmark and cross symbols
\usepackage{scalerel}           % For scaling symbols
\usepackage[normalem]{ulem}     % Underlyning, strikethrough, etc.


%--- Bibliography ---
% This package manages the bibliography and citation styles.
\usepackage[backend=biber, style=numeric, citestyle=numeric, sorting=none]{biblatex}
\addbibresource{Bibliography.bib}  % Specifies the bibliography file.

%--- Miscellaneous ---
% These packages provide various enhancements and additional features.
\usepackage{setspace}       % Controls line spacing.
\usepackage{wrapfig}        % Allows text wrapping around figures.
\usepackage{pdfpages}       % Includes PDF pages as graphics.
\usepackage{verbatim}       % Implements multi-line comments.
\usepackage{epigraph}       % Adds support for typesetting epigraphs.
\usepackage[newfloat, outputdir=output]{minted}  % Syntax highlighting for code.
\usepackage{caption}        % Customizes captions.
\usepackage{pdflscape}      % Provides landscape environment.
\usepackage[plainpages=false,pdfpagelabels,hypertexnames=false]{hyperref}  % Hyperlinks within the document.
\usepackage{xurl}           % Allows line breaks at any character in URLs.
\usepackage{scrhack}        % Fixes some warnings when using KOMA-script.
\usepackage[left=2.5cm,top=2cm,right=2cm,bottom=2.5cm,bindingoffset=0.5cm]{geometry}  % Customizes page geometry.
\usepackage{csquotes}       % Context-sensitive quotation facilities.
\usepackage[linesnumbered,ruled,vlined]{algorithm2e} % Provides support for algorithms


% Glossary Definitions
\usepackage[acronym,automake,nonumberlist,toc,stylemods=mcols,style=mcolindexgroup]{glossaries-extra}
\newglossary[slg]{symbolslist}{syi}{syg}{List of Symbols}
\setabbreviationstyle[acronym]{long-short}
\glsaddkey{unit}{\glsentrytext{\glslabel}}{\glsentryunit}{\GLsentryunit}{\glsunit}{\Glsunit}{\GLSunit}
\glssetnoexpandfield{unit}  % Avoid expansion issues with \si
\makeglossaries

% Custom glossary style
\newglossarystyle{symbunitlong}{%
    \setglossarystyle{long3col}  % Base this style on the long3col style
    \renewenvironment{theglossary}{%
        \begin{longtable}{lp{0.6\glsdescwidth}>{\centering\arraybackslash}p{2cm}}}%
            {\end{longtable}}%
    \renewcommand*{\glossaryheader}{%
        \bfseries Sign & \bfseries Description & \bfseries Unit \\
        \hline
        \endhead
    }%
    \renewcommand*{\glossentry}[2]{%
        \glstarget{##1}{\glossentryname{##1}} &
        \glossentrydesc{##1} &
        \glsentryunit{##1} \tabularnewline
    }%
}


%--- Headers and Footers ---
% This package customizes headers and footers.
\usepackage[automark, headsepline]{scrlayer-scrpage}
\clearpairofpagestyles
\ohead{\headmark}  % Outer header: chapter/section title.
\ihead{\documentType\ \authorName}
\ofoot[\pagemark]{\pagemark}


%----------------------------------------------------------------------------------------------------------
%| DOCUMENT SETTINGS                                                                                     |
%----------------------------------------------------------------------------------------------------------

%--- Layout Adjustments ---
% These settings adjust the layout of the document, controlling things like spacing and numbering.
\renewcommand*{\chapterheadstartvskip}{\vspace*{0pt}}
\renewcommand{\arraystretch}{1.25}
\setcounter{tocdepth}{2}
\pagestyle{scrheadings}     % Sets the page style to scrheadings, affecting headers/footers.
\renewcommand{\titlepagestyle}{scrheadings}
\renewcommand{\partpagestyle}{scrheadings}
\renewcommand{\chapterpagestyle}{scrheadings}
\renewcommand{\indexpagestyle}{scrheadings}

%--- Counter Adjustments ---
% These commands ensure proper numbering of various elements within the document.
\makeatletter
\@addtoreset{equation}{chapter}
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\renewcommand\theequation{\thechapter.\@arabic\c@equation}
\renewcommand\thefigure{\thechapter.\@arabic\c@figure}
\renewcommand\thetable{\thechapter.\@arabic\c@table}
\makeatother

%--- Formatting Adjustments ---
% These commands adjust the formatting of the document, controlling things like indentation and penalties.
\parindent 1pt
\parskip   3pt
\clubpenalty         = 10000  % Penalty for creating a club line.
\widowpenalty        = 10000  % Penalty for creating a widow line.
\displaywidowpenalty = 10000  % Penalty for creating a display widow line.

%----------------------------------------------------------------------------------------------------------
%| TEXT SUBSTITUTIONS                                                                                    |
%----------------------------------------------------------------------------------------------------------

%--- Commands for User-defined Info ---
% These commands allow the user to define key information that is used throughout the document.
\newcommand{\company}[1]{\renewcommand{\company}{#1}}
\newcommand{\university}[1]{\renewcommand{\university}{#1}}
\newcommand{\universityGer}[1]{\renewcommand{\universityGer}{#1}}
\newcommand{\documentType}[1]{\renewcommand{\documentType}{#1}}
\newcommand{\authorName}[1]{\renewcommand{\authorName}{#1}}
\newcommand{\submissionDate}[1]{\renewcommand{\submissionDate}{#1}}
\newcommand{\startDate}[1]{\renewcommand{\startDate}{#1}}
\newcommand{\uniAdvisor}[1]{\renewcommand{\uniAdvisor}{#1}}
\newcommand{\compAdvisor}[1]{\renewcommand{\compAdvisor}{#1}}
\newcommand{\uniDepartment}[1]{\renewcommand{\uniDepartment}{#1}}
\newcommand{\uniDepartmentGer}[1]{\renewcommand{\uniDepartmentGer}{#1}}
\newcommand{\compDepartment}[1]{\renewcommand{\compDepartment}{#1}}
\newcommand{\thesisTitle}[1]{\renewcommand{\thesisTitle}{#1}}
\newcommand{\thesisTitleGer}[1]{\renewcommand{\thesisTitleGer}{#1}}
\newcommand{\thesisNumber}[1]{\renewcommand{\thesisNumber}{#1}}

%----------------------------------------------------------------------------------------------------------
%| Symbols and other commands                                                                            |
%----------------------------------------------------------------------------------------------------------

%--- Predefined Commands ---
% These commands provide shortcuts for frequently used sequences or complex commands.
\newcommand{\MakeFrontCover}{
    \input{appendices/A_Cover.tex}  % Includes the cover page from a separate file.
}

% Command to Input File with No Headers/Footers
\newcommand{\inputNoHead}[1]{%
    \clearpage  % Ensure the content starts on a new page
    \thispagestyle{empty}  % Set the page style to empty for this page
    \input{#1}  % Input the specified file
    \clearpage  % Ensure subsequent content starts on a new page
}

% Command to add a new symbol to the list of symbols
\newcommand{\newSym}[5]{
    \newglossaryentry{#1}{
        name={\ensuremath{#2}},
        description={#3},
        unit={#4},
        sort={#5, #1},
        type=symbolslist
    }
}

\newcommand{\newGroup}[2]{
    \newSym{A0#2}{\textbf{#1}}{\ }{\si{}}{#2}  % Actual group name
    \newSym{z9#2}{\ }{\ }{\si{}}{#2}  % Placeholder to push to the bottom
}

% Easier acc of symbols
\newcommand{\sym}[1]{\gls*{#1}}

% Prints the glossaries
\newcommand{\MakeGlossary}{
    \glsaddall
    \printglossary[type=\acronymtype, title=Abbreviations, toctitle=Abbreviations]
    \printglossary[type=symbolslist, style=symbunitlong]  % Note the type is 'symbolslist'
    \glsresetall
}

% Custom Section Headers with Images
\newcommand{\imgsection}[2]{
    \section*{\thesection\hspace{1em}#1\hspace{1em}\includegraphics[height=2em,valign=c]{#2}}
    \addcontentsline{toc}{section}{\protect\numberline{\thesection}#1}
    \stepcounter{section}
}


\newcommand{\bfm}[1]{\boldsymbol{#1}}
\newcommand{\mbf}[1]{\mathbf{#1}}

% Symbols
\newcommand{\azim}{\bfm{\phi}}
\newcommand{\elev}{\bfm{\vartheta}}
\newcommand{\bfT}{\bfm{\theta}}
\newcommand{\NPred}{\widehat{N}}
\newcommand{\C}{\widehat{\bfm{C}}_x}
\newcommand{\Csub}{\widehat{\bfm{C}}'_x}
\newcommand{\UH}{\widehat{\bfm{U}}}
\newcommand{\UsH}{\widehat{\bfm{U}}_S}
\newcommand{\UnH}{\widehat{\bfm{U}}_\eta}
\newcommand{\NSet}{\widehat{\mathbb{N}}}
\newcommand{\bfL}{\bfm{\lambda}}
\newcommand{\SNR}{\mathrm{SNR}}
\newcommand{\SIR}{\mathrm{SIR}}
\newcommand{\SNRmax}{\mathrm{SNR}_{\max}}
\newcommand{\SNRmin}{\mathrm{SNR}_{\min}}


%% Machine Learning
\newcommand{\D}{\mathcal{D}}
\newcommand{\DTrain}{\mathcal{D}_{(\text{train})}}
\newcommand{\DVal}{\mathcal{D}_{(\text{val})}}
\newcommand{\DTest}{\mathcal{D}_{(\text{test})}}
\newcommand{\DMain}{ \mathcal{D}^{\{K_{100},\text{Sub}\}}}
\newcommand{\DKvar}{\mathcal{D}^{\{K_{var.},\text{Sub}\}}}
\newcommand{\DCoh}{\mathcal{D}^{\{K_{100},\text{Coh}\}}}
\newcommand{\B}{\mathcal{B}} % Batchsize
\newcommand{\bfLT}{\bfm{\varLambda}}

% Loss and accuracy commands
\newcommand{\loss}{\mathcal{L}}
\newcommand{\meanLoss}{\overline{\loss}}
\newcommand{\meanLossTrain}{\overline{\loss}_{(\text{train})}}
\newcommand{\meanLossVal}{\overline{\loss}_{(\text{val})}}
\newcommand{\meanLossTest}{\overline{\loss}_{(\text{test})}}
\newcommand{\meanLossCE}{\overline{\loss}_{\text{CE}}}
\newcommand{\meanLossMSE}{\overline{\loss}_{\text{MSE}}}
\newcommand{\Acc}{\text{Acc}}
\newcommand{\meanAcc}{\overline{\Acc}}
\newcommand{\meanAccVal}{\overline{\Acc}_{(\text{val})}}
\newcommand{\meanAccTest}{\overline{\Acc}_{(\text{test})}}
\newcommand{\lossCE}{\loss^{\text{CE}}}
\newcommand{\lossMSE}{\loss^{\text{MSE}}}
\newcommand{\lossCETrain}{\loss_{\text{train}}^{\text{CE}}}
\newcommand{\lossCEVal}{\loss_{(\text{val})}^{\text{CE}}}
\newcommand{\lossCETest}{\loss_{(\text{test})}^{\text{CE}}}
\newcommand{\lossMSETrain}{\loss_{(\text{train})}^{\text{MSE}}}
\newcommand{\lossMSEVal}{\loss_{(\text{val})}^{\text{MSE}}}
\newcommand{\lossMSETest}{\loss_{(\text{test})}^{\text{MSE}}}
\newcommand{\meanLossCEVal}{\overline{\loss}_{(\text{val})}^{\text{CE}}}
\newcommand{\meanLossCETest}{\overline{\loss}_{(\text{test})}^{\text{CE}}}
\newcommand{\meanLossCETrain}{\overline{\loss}_{(\text{train})}^{\text{CE}}}

% text colors
\newcommand{\gn}[1]{\textcolor{green}{#1}}
\newcommand{\rd}[1]{\textcolor{red}{#1}}
% colored boxes
\newcommand{\rdbx}[1]{\fcolorbox{red}{white}{#1}}
\newcommand{\gnbx}[1]{\fcolorbox{green}{white}{#1}}
\newcommand{\gnbxeq}[1]{\fcolorbox{green}{white}{$#1$}}

% Math Operators
\newcommand{\am}{\overline{\operatorname{arithm}}}
\newcommand{\gm}{\overline{\operatorname{geom}}}
\newcommand{\stkout}[1]{\ifmmode\text{\sout{\ensuremath{#1}}}\else\sout{#1}\fi}
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclarePairedDelimiter{\nint}\lfloor\rceil
\DeclareMathOperator{\softmax}{softmax}

% Oplus and Ominus
\let\bigopsize\bigoplus
\def\bigoplus{{\scalerel*{\boldsymbol\oplus}{\bigopsize}}}
\def\bigominus{{\scalerel*{\boldsymbol\ominus}{\bigopsize}}}
\def\redbigoplus{{\textcolor{red}{\bigoplus}}}
\def\redbigominus{{\textcolor{red}{\bigominus}}}
\def\greenbigoplus{{\textcolor{green}{\bigoplus}}}
\def\greenbigominus{{\textcolor{green}{\bigominus}}}
