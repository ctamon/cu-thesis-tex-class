%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLARKSON PHD THESIS TEMPLATE
% LaTeX format for theses at Clarkson University
% Based on "Preparing Your PhD Dissertation.pdf" 
% located at: http://www.clarkson.edu/artsandsci/documents/graddocuments/
% Source: based on template by K. SETHURAMAN (MIT) and B. HUDSON (AIS).
% Contact: tino@clarkson.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% `vi' and `upcase' options by Krishna Sethuraman - krishna@athena.mit.edu
% Margins and heading types by Peter Nuth  - nuth@ai.mit.edu
% Title and abstract page by Stephen Gildea - gildea@erl.mit.edu

% To use this style - say something like:
%  for dull, boring thesis format:
%	\documentclass[12pt]{clarksonthesis}
%       \pagestyle{plain}
% OR for fast drafts: 
%	\documentclass[11pt,singlespace,draft]{clarksonthesis}
%	\pagestyle{drafthead}
% OR for Tech Reports:
%	\documentclass[12pt,twoside]{clarksonthesis}	
%	\pagestyle{headings}
% OR
%  some other combination...
%
%%%% New options:
% 
% Option `twoside':
%   Good for producing Tech Reports.
%   The default is single-sided printing.
%
% Option `singlespace':
%   Good for drafts.
%   Double-spaced theses are the default.
%
%   To get singlespacing in an area - Use  the 'singlespace' environment. 
%
% Option `draft':
%   Puts `overfull' boxes at the end of lines that are too long. 
%
% Pagestyle `drafthead':
%   Puts the date and the label ``*DRAFT*'' in the footer.
%
%%%%%%%%%%
%
%%%% Parameters to initialize for boilerplate page:
%
%	\title{\THESISTITLE}
% 	\author{\THESISAUTHOR}
% 	\department{\THESISDEPARTMENT}
% 	\degree{\THESISDEGREE}
% 	\degreemonth{\THESISDEGREEMONTH}
% 	\degreeyear{\THESISDEGREEYEAR}
% 	\thesisdate{\THESISDATE}
%	\thesisadvisor(\THESISADVISOR}
%	\thesisadvisorposition{\THESISADVISORPOSITION}
% and possibly others.

%% If the thesis is copyright by the Institute, leave this line out and
%% the standard copyright line will be used instead.
% 	\copyrightnotice{\THESISAUTHOR, \THESISYEAR}

%% Make the titlepage based on the above information.  If you need
%% something special and can't use the standard form, you can specify
%% the exact text of the titlepage yourself.  Put it in a titlepage
%% environment and leave blank lines where you want vertical space.
%% The spaces will be adjusted to fill the entire page.  The dotted
%% lines for the signatures are made with the \signature command.
%
%% The abstractpage environment sets up everything on the page except
%% the text itself.  The title and other header material are put at the
%% top of the page, and the advisors are listed at the bottom.  A
%% new page is begun both before and after.  Of course, an abstract may
%% be more than one page itself.  If you need more control over the
%% format of the page, you can use the abstract environment, which puts
%% the word "Abstract" at the beginning and single spaces its text.
%
% 	\begin{abstractpage}
%	    Abstract goes here.
%	\end{abstractpage}
%
%%%%%%%% Newer additions 
%
% documentclass options - 
% vi		Will copyright the thesis to you
% 			while giving Clarkson permission to copy and distribute it.
% 			(Based on a similar option at MIT)
% upcase	Will put much of the cover page in uppercase (if so required)
% Also added ``All Rights Reserved'' to default copyright notice.
%
%%%%%%%%%%%
% 
% Documentclass options (vi and upcase) and changes to copyright notice
%	Copyright (c) 1990, by Krishna Sethuraman (MIT).
%
% Pagestyle and header generation
%	Copyright (c) 1987, 1988 by Peter Nuth
%
% Original version
%	 Copyright (c) 1987 by Stephen Gildea
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that
% the copyright notice and this notice are retained.
% 
% THIS WORK IS PROVIDED ON AN "AS IS" BASIS.  THE AUTHOR PROVIDES NO
% WARRANTY WHATSOEVER, EITHER EXPRESS OR IMPLIED, REGARDING THE WORK,
% INCLUDING WARRANTIES WITH RESPECT TO ITS MERCHANTABILITY OR FITNESS
% FOR ANY PARTICULAR PURPOSE.
%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{clarksonthesis}[2015/03/19]

\def\mystretch{1.5}				% Double spacing hack
\DeclareOption{doublespace}{}	% This is default
				% So we do not read this style twice
\DeclareOption{singlespace}{	% If we explicitly want single spacing
    \typeout{Single spaced}
    \def\mystretch{1}}	

%% `vi' and `upcase' document style options.  Krishna Sethuraman (MIT, 1990)
\newcount\vithesis
\DeclareOption{vi}{\typeout{Course VI/VIII thesis style.}\advance\vithesis by1}
\vithesis=0

\DeclareOption{upcase}{\typeout{Uppercase cover page.}
	\gdef\choosecase#1{\uppercase\expandafter{#1}}}
\def\choosecase#1{#1}

%% leftblank option by Kevin Fu
\newif\if@leftblank \@leftblankfalse

\DeclareOption{leftblank}{\typeout{Intentionally Leaving Pages Blank}
\@leftblanktrue}

%  Thesis looks much like report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass{report}

% If the user wants single spacing, set baselinestretch=1.


% MIT's packages
\usepackage{lgrind} 
\usepackage{cmap}
\usepackage[T1]{fontenc}

% Brian's package definitions
% CAVEAT: ignoring for now the biblatex packages.
%\usepackage[style=alphabetic]{biblatex}
\usepackage{bookmark}
\usepackage[colorinlistoftodos]{todonotes}
\usepackage[utf8]{inputenc}
\usepackage{fancyhdr}
\usepackage[papersize={8.5in,11in}, lmargin={1.5in}, rmargin={1in}, tmargin={1in}, bmargin={1in}]{geometry}
\usepackage{graphicx}
\usepackage{setspace}

%\addbibresource{references.bib} % biblatex
\pagestyle{fancy} % fancyhdr
\graphicspath{ {images/} } % graphicsx

%% Customizing header
\fancyhead{}
\fancyhead[L]{\leftmark}
\fancyhead[R]{\thepage}

%% Customizing footer
\fancyfoot{}

\pagenumbering{roman}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\baselinestretch{\mystretch}	% Double spacing hack

%%%%%%%  Set up margins and formatting params %%%

% Margins.
%  Note we want 1in top margin assuming no header line, so push header
%	into 1in margin.
%  Draft mode brings the header back down.

\setlength{\oddsidemargin}{0.5in}	% 1.5in left margin 
\setlength{\evensidemargin}{0.5in}	% 1.5in left margin (even pages)
\setlength{\topmargin}{0.0in}		% 1.0in top margin
\setlength{\textwidth}{6.0in}		% 6.0in text - 1.25in rt margin
\setlength{\textheight}{9in}		% Body ht for 1in margins
\addtolength{\topmargin}{-\headheight}	% No header, so compensate
\addtolength{\topmargin}{-\headsep}	% for header height and separation

% The next two macros compensate page style for headers and footers
% We only need them in page styles that USE headers and footers.
    % If we have a header, it must be 1in from top of page.
\def\pulldownheader{			% Shift header down 1in from top
    \addtolength{\topmargin}{\headheight}	
    \addtolength{\topmargin}{\headsep}	
    \addtolength{\textheight}{-\headheight}
    \addtolength{\textheight}{-\headsep}
}
    % If we have a footer, put it 1in up from bottom
\def\pullupfooter{				% Shift footer up
    \addtolength{\textheight}{-\footskip}
%    \addtolength{\textheight}{-\footheight}  %footheight doesn't
%    						exist in 2e
}

%%%%%%%  End of margins and formatting params %%%

%%%%%%%  Fix various header and footer problems %%%

% Draft mark on the right side of left pages (outside)
% this mark is also the only one visible on single sided.
\newcommand{\draftrmark}{**DRAFT**} 
% Draft mark on the left side of right pages (outside)
\newcommand{\draftlmark}{**DRAFT**} % 

% Macros to make changing the Draft easier
\newcommand{\drmark}[1]{\renewcommand{\draftrmark}{#1}}
\newcommand{\dlmark}[1]{\renewcommand{\draftlmark}{#1}}
\newcommand{\dmark}[1]{\drmark{#1}\dlmark{#1}}

% Format for draft of thesis.  Define our own PageStyle -
% Just like headings, but has foot lines with the date and warning

\if@twoside         % If two-sided printing.
\def\ps@drafthead{
    \let\@mkboth\markboth
    \def\@oddfoot{\rm \today \hfil \sc \draftrmark}
    \def\@evenfoot{\sc \draftlmark \hfil \rm \today }
    \def\@evenhead{\rm \thepage\hfil \sl \leftmark}
    \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
    \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}{}}
    \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
	\thesection. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
    \pullupfooter				% Bring footer up
}
\else               % If one-sided printing.
\def\ps@drafthead{
    \let\@mkboth\markboth
    \def\@oddfoot{\rm \today \hfil \sc \draftrmark}
    \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}
    \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
    \pullupfooter				% Bring footer up
}
\fi

% Redefined these formats that were defined in report.sty
% Definition of 'headings' page style 
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%

\if@twoside					% If two-sided printing.
\def\ps@headings{\let\@mkboth\markboth
    \def\@oddfoot{}
    \def\@evenfoot{}		% No feet.
    \def\@evenhead{\rm \thepage\hfil \sl \leftmark}	% Left heading.
    \def\@oddhead{\hbox{}\sl \rightmark \hfil \rm\thepage}	% Right heading.
    \def\chaptermark##1{\markboth {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}{}}	
    \def\sectionmark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\z@
	\thesection. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
}
\else						% If one-sided printing.
\def\ps@headings{\let\@mkboth\markboth
    \def\@oddfoot{}
    \def\@evenfoot{}		%     No feet.
    \def\@oddhead{\hbox {}\sl \rightmark \hfil \rm\thepage}	% Heading.
    \def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
	\@chapapp\ \thechapter. \ \fi ##1}}}
    \pulldownheader				% Bring header down from edge
}
\fi

% Redefinition of 'myheadings' page style.  
%
\def\ps@myheadings{\let\@mkboth\@gobbletwo
    \def\@oddfoot{}
    \def\@evenfoot{}
    \def\sectionmark##1{}
    \def\subsectionmark##1{}
    \def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox {}}	%
    \def\@oddhead{\hbox{}\sl\rightmark \hfil \rm\thepage}	%
    \pulldownheader				% Bring header down from edge
}						

% Redefine '/chapter' to always start on an odd page.
% Should make no difference in singleside mode.
%
\if@leftblank
% Prints "THIS PAGE INTENTIONALLY LEFT BLANK" on blank pages.
\def\chapter{\clearpage\ifodd\c@page\else
   \hbox{}\par\vfill\centerline%
   {THIS PAGE INTENTIONALLY LEFT BLANK}%
   \vfill\newpage\fi
   \thispagestyle{plain}	% Page style of chapter page is 'plain'
   \global\@topnum\z@		% Prevents figures from going at top of page.
   \@afterindentfalse		% Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
\else
\def\chapter{\cleardoublepage	% Starts new page.
   \thispagestyle{plain}	% Page style of chapter page is 'plain'
   \global\@topnum\z@		% Prevents figures from going at top of page.
   \@afterindentfalse		% Suppresses indent in first paragraph.  Change
   \secdef\@chapter\@schapter}	% to \@afterindenttrue to have indent.
\fi
% If using the report style, use - instead of . in the figure number.
\@ifundefined{thechapter}{}{\def\thefigure{\thechapter-\arabic{figure}}}

%%%%%%%%%  End of Style parameters %%%%

% Here's Gildea's Boilerplate Stuff.
% Copyright (c) 1987 by Stephen Gildea
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that
% the copyright notice and this notice are retained.

%% Define all the pieces that go on the title page and the abstract.

% \title and \author already exist

\def\university#1{\gdef\@university{#1}}
\def\department#1{\gdef\@department{#1}}

% If you are getting two degrees, use \and between the names.
\def\degree#1{\setbox0\hbox{#1}	 %for side effect of setting \@degreeword
  \gdef\@degree{#1}}

% \and is used inside the \degree argument to separate two degrees
\def\and{\gdef\@degreeword{degrees} \par and \par}
\def\@degreeword{degree}

% The copyright notice stuff is a tremendous mess.
%
% \@copyrightnotice is used by \maketitle to actually put text on the
% page; it defaults to ``Copyright Clarkson 20xx.  All rights reserved.''
% \copyrightnoticetext takes an argument and defined \@copyrightnotice
% to that argument.  \copyrightnotice takes an argument, and calls
% \copyrightnoticetext with that argument, preceeded by a copyright
% symbol and followed by ``All rights reserved.'' and the standard
% permission notice.
% 
% If you use the 'vi' option, \copyrightnoticetext is used to set the
% copyright to ``(C) Your Name, Current Year in Roman Numerals.''
% followed by the permission notice.

% If there is no \copyrightnotice command, it is asssumed that MIT
% holds the copyright.  This commands adds the copyright symbol to the
% beginning, and puts the standard permission notice below.
%% ``All rights reserved'' added.  Krishna Sethuraman (1990)
\def\copyrightnotice#1{\copyrightnoticetext{\copyright\ #1.  All rights
reserved.\par\permission}}

% Occacionally you will need to exactly specify the text of the 
% copyright notice.  The \copyrightnoticetext command is then useful.
\long\def\copyrightnoticetext#1{\gdef\@copyrightnotice{#1}}
\def\@copyrightnotice{\copyright\ \Clarkson\ \@degreeyear.  All rights reserved.}

%% `vi' documentclass option: Specifying this option automatically
%% copyrights the thesis to the author and gives MIT permission to copy and
%% distribute the document.  If you want, you can still specify
%% \copyrightnotice{stuff} to copyright to someone else, or
%% \copyrightnoticetext{stuff} to specify the exact text of the copyright
%% notice.
\ifodd\vithesis \copyrightnoticetext{\copyright\ \@author,
\uppercase\expandafter{\romannumeral\@degreeyear}.  All rights reserved.\par\permission}
%% or just
%%\@degreeyear}}
\typeout{Copyright given to author,
	permission to copy/distribute given to Clarkson University.}
\else \typeout{Thesis document copyright Clarkson University unless otherwise (manually) specified}
\fi


% date of thesis defense
\def\thesisdate#1{\gdef\@thesisdate{#1}}

% typically just a month and year
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}

% area or discipline. For example: Computer Science.
\def\degreearea#1{\gdef\@degreearea{#1}}


%% Not used but might be useful later.
% Usage: \advisor{name}{title}
% since there can be more than one advisor,
% we build the appropriate boxes for the titlepage and
% the abstractpage as the user makes multiple calls
% to \advisor
\newbox\@titleadvisor 	\newbox\@abstractadvisor

\def\advisor#1#2{\setbox\@titleadvisor\vbox
  {\unvbox\@titleadvisor \vskip 10pt% plus 1fil minus 1fil
  \def\baselinestretch{1}\large
  \signature{Certified by}{#1 \\ #2 \\ Thesis Advisor}}
  \setbox\@abstractadvisor\vbox{\unvbox\@abstractadvisor
  \vskip\baselineskip \def\baselinestretch{1}\@normalsize 
  \par\noindent Thesis Advisor: #1 \\ Title: #2}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% REVISED TITLE PAGE: BASED ON CLARKSON SPECS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% `upcase' documentclass option: \choosecase is defined either as a dummy or
%% a macro to change the (expanded) argument to uppercase.
\def\maketitle{\begin{titlepage}
	\large
	{\def\baselinestretch{2}\Large\bf \choosecase{\@university} \par}
	\vskip 2\baselineskip
	{\def\baselinestretch{1}\Large\bf \choosecase{\@title} \par}
	\vskip \baselineskip
	A Dissertation by \\
	{\large\bf  \choosecase{\@author}}
	\vskip \baselineskip
	\choosecase{Department of } \choosecase{\@department}
	\vskip \baselineskip
	\choosecase{Submitted in partial fulfillment of the requirements for the degree of} \\
	\choosecase{\@degree}, \
	\choosecase{\@degreearea}
	\vskip \baselineskip
	\choosecase{\@degreemonth \ \@degreeyear} \\
	\vskip \baselineskip
	\@copyrightnotice
	\end{titlepage}}


% environment for abstract page
\def\abstractpage{\cleardoublepage
	%\setcounter{page}{4}
	\pdfbookmark[0]{Abstract}{abstract}
	\chapter*{Abstract}
	\addcontentsline{toc}{chapter}{Abstract}
}
\def\endabstractpage{\newpage}

% environment for acknowledgment page
\def\ackpage{\cleardoublepage
	%\setcounter{page}{4}
	\pdfbookmark[0]{Acknowledgments}{acknowledgments}
	\chapter*{Acknowledgments}
	\addcontentsline{toc}{chapter}{Acknowledgments}
}
\def\endackpage{\newpage}

% environment for chapters
\def\chapterpage#1#2{
	\pdfbookmark[0]{#1}{chapter}
	\chapter{#2}
}
\def\endchapterpage{\newpage}


%% This counter is used to save the page number
%\newcounter{savepage}

% You can use the titlepage environment to do it all yourself if you
% don't want to use \maketitle.  If the titlepage environment, the
% paragraph skip is infinitely stretchable, so if you leave a blank line
% between lines that you want space between, the space will stretch so
% that the title page fills up the entire page.

\def\titlepage{\cleardoublepage\centering
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
% The \kern0pt pushes any depth into the height.  Thanks to Richard Stone.
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

\def\CLARKSON{CLARKSON UNIVERSITY}
\def\Clarkson{Clarkson University}

\def\permission{\par\noindent{\centering
   The author hereby grants to \Clarkson ~ permission to reproduce and to
   distribute publicly paper and electronic copies of this thesis
   document in whole or in part in any medium now known or hereafter
   created.}\par}


% deprecated
\def\signature#1#2{\par\noindent#1\dotfill\null\\*
  {\raggedleft #2\par}}

% definitions for signature page.
% Based on templates by B. Hudson.
\def\mysignature#1#2{\hfill\makebox[3in]{\hrulefill} \\
	\hfill\makebox[3in][l]{#1} \\
	\hfill\makebox[3in][l]{#2}}

\def\mydatesignature#1#2{
	\noindent\makebox[2in][l]{\hrulefill} \hfill\makebox[3in]{\hrulefill} \\
	\makebox[2in][l]{Date} \hfill\makebox[3in][l]{#1} \\
	\par\hfill\makebox[3in][l]{#2}}

% deprecated: abstract wrappers
\def\abstract{\subsection*{Abstract}\small\def\baselinestretch{1}\@normalsize}
\def\endabstract{\par}


