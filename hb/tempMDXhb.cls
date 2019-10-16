%%% A Class for Module Handbooks
%%% Written by Matthew M. Jones
%%% 21 June 2018
%%%
%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MDXHandbook}[2018/06/21]
%\LoadClass[12pt,twoside]{article}
\LoadClass[12pt,twoside]{book}

\RequirePackage[a4paper, margin=2cm]{geometry}
\RequirePackage{xkeyval}
\RequirePackage{tabularx}
\RequirePackage{rotating}
\RequirePackage{array}
\RequirePackage{dcolumn}

\RequirePackage{fancyhdr}

\RequirePackage{etoolbox}

\RequirePackage[table]{xcolor}
\RequirePackage{tikz}
\usetikzlibrary{positioning}

\RequirePackage{graphicx}

\RequirePackage{ifxetex,ifluatex}

\ifluatex
	\RequirePackage{fontspec}
	\setmainfont{Arial}

	\newfontfamily{\@facultyfont}[SizeFeatures = {Size = 16}]{Arial}
	\newfontfamily{\@mcfont}[SizeFeatures = {Size = 26}]{Arial}
	\newfontfamily{\@mtfont}[SizeFeatures = {Size = 36}]{Arial Bold}
	\newfontfamily{\@mlfont}[SizeFeatures = {Size = 20}]{Arial}
	\newfontfamily{\@genfont}[SizeFeatures = {Size = 14}]{Arial}
	
\else
	\ifxetex
	\RequirePackage{fontspec}
	\setmainfont{Arial}
	
	\newfontfamily{\@facultyfont}[SizeFeatures = {Size = 16}]{Arial}
	\newfontfamily{\@mcfont}[SizeFeatures = {Size = 26}]{Arial}
	\newfontfamily{\@mtfont}[SizeFeatures = {Size = 36}]{Arial Bold}
	\newfontfamily{\@mlfont}[SizeFeatures = {Size = 20}]{Arial}
	\newfontfamily{\@genfont}[SizeFeatures = {Size = 14}]{Arial}
	
	\else
	\RequirePackage{moresize}
	\RequirePackage{helvet}
	\renewcommand{\familydefault}{\sfdefault}
	
	\newcommand{\@facultyfont}{\large}
	\newcommand{\@mcfont}{\huge}
	\newcommand{\@mtfont}{\bfseries \HUGE}
	\newcommand{\@mlfont}{\Large}
	\newcommand{\@genfont}{\large}
	
	\fi
\fi
%%%%%%%%%%%%%%%% Colour definitions %%%%%%%%%%%%%%%%%%%%%%

\definecolor{MDXCorporateLightGrey}{RGB}{175,175,175}
\definecolor{MDXCorporateDarkGrey}{RGB}{110,110,110}
\definecolor{MDXCorporateBlack}{RGB}{0,0,0}
\definecolor{MDXCorporateRed}{RGB}{213,43,30}
\definecolor{MDXCorporateRedDark}{RGB}{196,22,28}

\definecolor{MDXBrightsYellow}{RGB}{254,209,0}
\definecolor{MDXBrightsOrange}{RGB}{233,131,0}
\definecolor{MDXBrightsPink}{RGB}{202,0,93}
\definecolor{MDXBrightsPurple}{RGB}{142,37,141}

\definecolor{MDXBrightsLightBlueA}{RGB}{143,202,231}
\definecolor{MDXBrightsLightBlueB}{RGB}{61,183,228}
\definecolor{MDXBrightsBlue}{RGB}{0,101,189}
\definecolor{MDXBrightsDarkBlue}{RGB}{0,65,101}

\definecolor{MDXBrightsLightGreen}{RGB}{162,173,0}
\definecolor{MDXBrightsGreen}{RGB}{122,184,0}
\definecolor{MDXBrightsBlueGreen}{RGB}{0,173,131}
\definecolor{MDXBrightsDarkGreen}{RGB}{3,86,66}

\definecolor{MDXNeutralsPinkGrey}{RGB}{221,185,154}
\definecolor{MDXNeutralsLightGrey}{RGB}{219,206,172}
\definecolor{MDXNeutralsGrey}{RGB}{170,163,142}
\definecolor{MDXNeutralsBlue}{RGB}{172,192,198}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@modulecode{[MODULE CODE]}
\newcommand{\modulecode}[1]{\def\@modulecode{#1}}

\def\@moduletitle{[Module Title]}
\newcommand{\moduletitle}[1]{\def\@moduletitle{#1}}

\def\@moduleleader{[Name]}
\newcommand{\moduleleader}[1]{\def\@moduleleader{#1}}

\def\@term{AY (2018)}
\newcommand{\term}[1]{\def\@term{#1}}

\def\@duration{24 weeks}
\newcommand{\duration}[1]{\def\@duration{#1}}

\def\@version{1}
\newcommand{\version}[1]{\def\@version{#1}}

\def\@dept{Design Engineering and Mathematics}
\newcommand{\dept}[1]{\def\@dept{#1}}

\setlength{\baselineskip}{20pt}

\renewcommand{\maketitle}{%
	\begin{titlepage}
		\begin{tikzpicture}[remember picture, overlay]
			\draw (current page.north east) ++ (-1in,-1in) node [anchor = north east, text width = 2in, align = right] {\textcolor{MDXCorporateRed}{\@facultyfont Faculty of Science and Technology}};			
			\draw (current page.north west) ++ (1in, -1in) node [anchor = north west] {\includegraphics[width = 4cm]{MU_LDN_Logo.pdf}};			
			\draw (current page.north) ++ (0,-9cm) node {\textcolor{MDXCorporateDarkGrey}{\@mcfont\@modulecode}};			
			\draw (current page.north) ++ (0,-11cm) node {\textcolor{MDXCorporateRed}{\parbox[][][c]{.9\textwidth}{\centering\@mtfont\@moduletitle}}};
			\draw (current page.north) ++ (0, -16cm) node {\@mlfont Module Leader: \@moduleleader};			
			\draw (current page.south west) ++ (1in,8cm) node [anchor = west] {\@genfont Term: \@term};			
			\draw (current page.south west) ++ (1in, 7cm) node [anchor = west]  {\@genfont Duration of the module: \@duration};			
			\draw (current page.south west) ++ (1in, 6cm) node  [anchor = west] {\@genfont Document version: \@version};			
			\draw [MDXCorporateDarkGrey] (current page.south west) ++ (.1\paperwidth,4cm) --++ (.8\paperwidth,0) node [midway, anchor = north] {\textcolor{MDXCorporateDarkGrey}{\@facultyfont \@dept}};
		\end{tikzpicture}
	\end{titlepage}%
}

\setlength{\parindent}{\z@}
\setlength{\parskip}{8pt}

%%%%%%%%%%% Set headers and footers %%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyhead{}
\fancyhead[RO,LE]{\@modulecode}
\fancyfoot{} % clear all footer fields
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}


%%%%%%%%%%% \moduleStaf[]{Name} %%%%%%%%%%%%%%%%%%%%%

\def\@photo{NO PHOTO}
\define@key{tm}{role}{\def\@role{#1}}
\define@key{tm}{telephone}{\def\@telephone{#1}}
\define@key{tm}{tel}{\def\@telephone{#1}}
\define@key{tm}{photo}{\def\@photo{\includegraphics[width = .2\textwidth]{#1}}}
\define@key{tm}{room}{\def\@room{#1}}
\define@key{tm}{email}{\def\@email{#1}}
\setkeys{tm}{role=,telephone=,room=,email=}

\newcommand{\moduleStaff}[2][]{%
\setkeys{tm}{role=,telephone=,room=,email=}
\def\@photo{NO PHOTO}
\setkeys{tm}{#1}%
\begin{center}
	\begin{tabular}{|p{.2\textwidth}|p{.8\textwidth}|}
	\hline
	\rowcolor{MDXCorporateRed}\multicolumn{2}{c}{\textcolor{white}{\textbf{#2}}}\\
	\hline \raisebox{-.5\totalheight}{\@photo}%
						 	&	\def\arraystretch{1.75}%
						 		\begin{tabularx}{.8\textwidth}{p{.2\textwidth}|X}
									Role:						&		\@role			\\
									\hline Room:			&		\@room		\\
									\hline Email:			&		\@email			\\
									\hline Telephone:	&		\@telephone			\\								
								\end{tabularx}%
								\def\arraystretch{1}\\
	\hline
	\end{tabular}
\end{center}}

%%%%%%%%%%%%%%%%%% Twenty point grade scales %%%%%%%%%%%%%%%%%%%%%%

\newlength{\@tpgtablewidth}

\define@key{tpg}{subject}{	\def\@subj{#1}}
\define@key{tpg}{width}{\setlength{\@tpgtablewidth}{#1}}
\define@key{tpg}{level}{\def\@level{#1}}
\setkeys{tpg}{subject = MSO, width = \textheight, level = UG}

\newcommand{\TwentyPointGradeTable}[1][]{%
\setkeys{tpg}{subject = MSO, width = \textheight, level = UG}
\setkeys{tpg}{#1}
\ifdefstring{\@subj}{MSO}{
	\ifdefstring{\@level}{UG}{ %% UG MSO Table
		\def\arraystretch{1.25}		
		\begin{tabularx}{\@tpgtablewidth}{|>{\centering}X|>{\centering}p{.2\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering\arraybackslash}p{.15\@tpgtablewidth}|}
\hline \rowcolor{MDXCorporateLightGrey}	\textbf{Classification}		&		\textbf{Grade}		& 	\multicolumn{2}{c}{\textbf{Percentages}} & \textbf{Midpoint} \\
\hline
				First class							&  1 & 90 & 100 & 95.0 \\
													   & 2 & 80 & 89 & 84.5 \\
													   & 3 & 72 & 79 & 75.5 \\
													   & 4 & 70 & 71 & 70.5 \\
\hline		Upper second class		  & 5 & 68 & 69 & 68.5 \\
													  & 6 & 65 & 67 & 66.0 \\
													  & 7 & 62 & 64 & 63.0\\
													  & 8 & 60 & 61 & 60.5 \\
\hline		Lower second class		  & 9 & 58 & 59 & 58.5 \\
													  & 10 & 55 & 57 & 56.0 \\
													  & 11 & 52 & 54 & 53.0 \\
													  & 12 & 50 & 51 & 50.5 \\
\hline		Third								  & 13 & 48 & 49 & 48.5 \\
												     & 14 & 45 & 47 & 46.0 \\
												     & 15 & 42 & 44 & 43.0\\
												     & 16 & 40 & 41 & 40.5\\
\hline		Compensatable fail		 & 17 & 35 & 39 & 37.0 \\
												     & 18 & 30 & 34 & 32.0\\
\hline		Uncompensatable fail   & 19 & 0 & 29 & 14.5\\
\hline
		\end{tabularx}
	}{ %% PG MSO Table
		\def\arraystretch{1.25}		
		\begin{tabularx}{\@tpgtablewidth}{|>{\centering}X|>{\centering}p{.2\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering\arraybackslash}p{.15\@tpgtablewidth}|}
\hline \rowcolor{MDXCorporateLightGrey}	\textbf{Classification}		&		\textbf{Grade}		& 	\multicolumn{2}{c}{\textbf{Percentages}} & \textbf{Midpoint} \\
\hline
				Distinction						&  1 & 90 & 100 & 95.0 \\
													   & 2 & 80 & 89 & 84.5 \\
													   & 3 & 72 & 79 & 75.5 \\
													   & 4 & 70 & 71 & 70.5 \\
\hline		Merit								  & 5 & 68 & 69 & 68.5 \\
													  & 6 & 65 & 67 & 66.0 \\
													  & 7 & 62 & 64 & 63.0\\
													  & 8 & 60 & 61 & 60.5 \\
\hline		Pass	      						  & 9 & 58 & 59 & 58.5 \\
													  & 10 & 55 & 57 & 56.0 \\
													  & 11 & 52 & 54 & 53.0 \\
													  & 12 & 50 & 51 & 50.5 \\
												     & 13 & 48 & 49 & 48.5 \\
												     & 14 & 45 & 47 & 46.0 \\
												     & 15 & 42 & 44 & 43.0\\
												     & 16 & 40 & 41 & 40.5\\
\hline		Compensatable fail		 & 17 & 35 & 39 & 37.0 \\
												     & 18 & 30 & 34 & 32.0\\
\hline		Uncompensatable fail   & 19 & 0 & 29 & 14.5\\
\hline
		\end{tabularx}
	}
}{}

\ifdefstring{\@subj}{PDE}{
	\ifdefstring{\@level}{UG}{%% PDE UG 
	\def\arraystretch{1.25}		
		\begin{tabularx}{\@tpgtablewidth}{|>{\centering}X|>{\centering}p{.2\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering\arraybackslash}p{.15\@tpgtablewidth}|}
\hline \rowcolor{MDXCorporateLightGrey}	\textbf{Classification}		&		\textbf{Grade}		& 	\multicolumn{2}{c}{\textbf{Percentages}} & \textbf{Midpoint} \\
\hline
				First class							&  1 & 80 & 100 & 90.0 \\
													   & 2 & 76 & 79 & 77.5 \\
													   & 3 & 72 & 75 & 73.5 \\
													   & 4 & 70 & 71 & 70.5 \\
\hline		Upper second class		  & 5 & 68 & 69 & 68.5 \\
													  & 6 & 65 & 67 & 66.0 \\
													  & 7 & 62 & 64 & 63.0\\
													  & 8 & 60 & 61 & 60.5 \\
\hline		Lower second class		  & 9 & 58 & 59 & 58.5 \\
													  & 10 & 55 & 57 & 56.0 \\
													  & 11 & 52 & 54 & 53.0 \\
													  & 12 & 50 & 51 & 50.5 \\
\hline		Third								  & 13 & 48 & 49 & 48.5 \\
												     & 14 & 45 & 47 & 46.0 \\
												     & 15 & 42 & 44 & 43.0\\
												     & 16 & 40 & 41 & 40.5\\
\hline		Compensatable fail		 & 17 & 35 & 39 & 37.0 \\
												     & 18 & 30 & 34 & 32.0\\
\hline		Uncompensatable fail   & 19 & 0 & 29 & 14.5\\
\hline
		\end{tabularx}	
	}{ %% PDE PG
	\def\arraystretch{1.25}		
		\begin{tabularx}{\@tpgtablewidth}{|>{\centering}X|>{\centering}p{.2\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering}p{.15\@tpgtablewidth}|>{\centering\arraybackslash}p{.15\@tpgtablewidth}|}
\hline \rowcolor{MDXCorporateLightGrey}	\textbf{Classification}		&		\textbf{Grade}		& 	\multicolumn{2}{c}{\textbf{Percentages}} & \textbf{Midpoint} \\
\hline
				Distinction							&  1 & 80 & 100 & 90.0 \\
													   & 2 & 76 & 79 & 77.5 \\
													   & 3 & 72 & 75 & 73.5 \\
													   & 4 & 70 & 71 & 70.5 \\
\hline		Merit								  & 5 & 68 & 69 & 68.5 \\
													  & 6 & 65 & 67 & 66.0 \\
													  & 7 & 62 & 64 & 63.0\\
													  & 8 & 60 & 61 & 60.5 \\
\hline		Pass								  & 9 & 58 & 59 & 58.5 \\
													  & 10 & 55 & 57 & 56.0 \\
													  & 11 & 52 & 54 & 53.0 \\
													  & 12 & 50 & 51 & 50.5 \\
													  & 13 & 48 & 49 & 48.5 \\
												     & 14 & 45 & 47 & 46.0 \\
												     & 15 & 42 & 44 & 43.0\\
												     & 16 & 40 & 41 & 40.5\\
\hline		Compensatable fail		 & 17 & 35 & 39 & 37.0 \\
												     & 18 & 30 & 34 & 32.0\\
\hline		Uncompensatable fail   & 19 & 0 & 29 & 14.5\\
\hline
		\end{tabularx}	
	}
}{}
}

