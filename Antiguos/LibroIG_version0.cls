\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LibroIG}[2016/08/22 .cls Personal, V1.0]

% clase de base

\LoadClass[a4paper, 10pt]{article}

% extensions

\RequirePackage[latin1]{inputenc} % encoding
\RequirePackage[T1]{fontenc} % font encoding
\RequirePackage{amsmath,amssymb} % mathematical packages
\RequirePackage{epsfig,graphics,graphicx,color} % figures packages
%\RequirePackage[labelsep=endash]{caption}
%\RequirePackage[figurename={\fontsize{8}{8}\selectfont Toto}]{caption}
%\RequirePackage{setspace} % space package
\RequirePackage{etoolbox,ifthen} % conditioning packages
\RequirePackage{tocloft} % table of content managment package
%\RequirePackage{xargs}
\RequirePackage[spanish]{babel} % spanish mode for babel

\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial
%\renewcommand{\familydefault}{\sfdefault}


\renewcommand\thepage{1-\arabic{page}} %
\renewcommand\listtablename{\\'Indice de Tablas}       % Cambia Indice de Cuadros a Ã­ndice de Tablas
\renewcommand\listfigurename{\\'Indice de Figuras}     % Cambia List of Figures a Lista de Figuras
\renewcommand{\figurename}{Figura}
\renewcommand{\tablename}{Tabla}


%% EDULP: margenes superior e inferior 2 cm, margenes izquierdo y derecho 3 cm
\setlength{\textwidth}{150mm}
\setlength{\textheight}{255mm}
\setlength{\oddsidemargin}{6mm}
\setlength{\evensidemargin}{6mm}
\setlength{\topmargin}{-5mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{0mm}
\addtolength{\footnotesep}{5mm}
\addtolength{\skip\footins}{5mm}
%\interfootnotelinepenalty=10000
%%

%% EDULP: Arial 10, interlineado 1.5, sangria 0.5 cm
\renewcommand{\baselinestretch}{1.5}
\setlength{\parindent}{0.5cm}
\fontsize{10}{10}\selectfont
%%

%\pagestyle{empty}



% PORTADA =============================================================================

\newenvironment{portada}{
\thispagestyle{empty}
\addtolength{\topmargin}{6cm}

%% EDULP : TÍTULO DEL LIBRO (ARIAL 20, NEGRITA, VERSALITA) 
\newcommand{\titulo}[1]{\centerline{\fontsize{20}{20}\selectfont\bfseries\textsc{##1}}}

%% EDULP : SUBTÍTULO (OPTATIVO) (ARIAL 17, NORMAL, VERSALITA)
\newcommand{\subtitulo}[1]{\centerline{\fontsize{17}{20}\selectfont\textsc{##1}}}

%% EDULP : Autores: Nombre y Apellido (Arial 14, normal, interlineado sencillo)
\newcommand{\autores}[3]{\vspace{4cm}{\fontsize{14}{14}\selectfont
%\begin{spacing}{1}
\renewcommand{\baselinestretch}{1}
\begin{center}
\noindent ##1
%\ifstrempty{#2}{}{\\[-1mm]\noindent  ##2}
%\ifstrempty{#3}{}{\\[-1mm] \noindent  ##3}
\\[-1mm] \noindent  ##2\\[-1mm] \noindent  ##3
\end{center}
%\end{spacing}
}}

%% EDULP : Facultad o Colegio (Arial 11, normal)
\newcommand\facultad[1]{
\vspace{4cm}
\renewcommand{\baselinestretch}{1}
%\begin{spacing}{1}
\centerline{\fontsize{11}{11}\selectfont \noindent ##1}
%\end{spacing}
}

%\vfill
%\begin{center}
%\includegraphics[width=4cm]{logo_large}

%\AtEndEnvironment{\newpage}
}{\newpage}



% DEDICATORIA =========================================================================

%%EDULP : dedicatoria (Arial 9, normal, interlineado de 1,5 líneas, alineación derecha)
\newenvironment{dedicatoria}{
\thispagestyle{empty}
\fontsize{9}{9}\selectfont
\addtolength{\topmargin}{6cm}
\raggedleft
%\begin{spacing}{1.5}
%\renewcommand{\baselinestretch}{1.5}
}{\newpage}
%{\end{spacing}\newpage}



% AGREDECIMIENTOS =====================================================================

%% EDULP: Agradecimientos (Arial 18, negrita)
%  Texto Arial 10, interlineado de 1,5 líneas, alineación justificada, sangría 0,5 cm.
%  Máximo una carilla.

\newenvironment{agradecimientos}{
\thispagestyle{empty}
{\fontsize{18}{18}\selectfont\bf Agradecimientos}\vspace{4cm}\newline
\fontsize{10}{15}\selectfont\indent
%\begin{spacing}{1.5}
}{\newpage}
%{\end{spacing}\newpage}



% EPIGRAFE ============================================================================

%% EDULP: Epígrafe (Arial 9, cursiva interlineado de 1,5 líneas, alineación derecha).

\newenvironment{epigrafe}{
\ifthenelse{\value{capitulo}=0}{\thispagestyle{empty}\addtolength{\topmargin}{6cm}}{\vspace{4cm}}
\fontsize{9}{9}\selectfont\em
%\raggedleft
\begin{flushright}
%\begin{spacing}{1.5}
\newcommand{\autortituloepigrafe}[1]{\linebreak \textsc{##1}}
\newcommand{\tituloepigrafe}[1]{,~\textsc{##1}}
}{\end{flushright}\ifthenelse{\value{capitulo}=0}{\newpage}{\vspace{1cm}}}
%\end{spacing}


%% counters ===========================================================================
\newcounter{capitulo}
\setcounter{capitulo}{0}
\newcounter{seccion}[capitulo]
\newcounter{subseccion}[seccion]
\newcounter{subsubseccion}[subseccion]



%% Definition de los capitulos ========================================================
%% EDULP: titulo de capitulo 18 negrita
%%        nombre y appelido 14, cursiva

\newcommand{\capitulo}[2]{
\refstepcounter{capitulo}
\cftaddtitleline{toc}{part}
 {
 %\begin{spacing}{1.5}
 {\fontsize{10}{10}\selectfont\bf Cap\'itulo~\arabic{capitulo}}\newline
 {\fontsize{10}{10}\selectfont\normalfont #1}
 \ifstrempty{#2}{}{\newline {\fontsize{10}{10}\selectfont\normalfont\em  #2}}
 %\end{spacing}
 }{}
%
{\fontsize{18}{18}\selectfont\bf\indent\indent CAP\'ITULO~\arabic{capitulo}\vspace{1.5mm}\newline
\indent\indent #1\vspace{5mm}}\newline 
\ifstrempty{#2}{}{{\fontsize{14}{14}\selectfont\em \indent\indent #2}\newline}
}{}


% Definition de las secciones =========================================================
%% EDULP: seccion 14 negrita, 2 espacios antes, 1 despues
\newcommand{\seccion}[1]{
\refstepcounter{seccion}
\mbox{}\newline\newline
{\fontsize{14}{14}\selectfont\bf \noindent\arabic{seccion}.~#1}\newline
}



% Definition de las subsecciones ======================================================
%% EDULP: subseccion 12 negrita, 2 espacios antes, 1 despues
\newcommand{\subseccion}[1]{
\refstepcounter{subseccion}
\mbox{}\newline\mbox{}\newline
{\fontsize{12}{12}\selectfont\bf \noindent\arabic{seccion}.\arabic{subseccion}~#1}\newline
}



% Definition de las subsubsecciones ===================================================
%% EDULP: subsubseccion 10 negrita, 1 espacios antes, ninguno despues
\newcommand{\subsubseccion}[1]{
\refstepcounter{subsubseccion}
\mbox{}\newline
{\fontsize{12}{12}\selectfont\bf \noindent\arabic{seccion}.\noindent\arabic{subseccion}.\noindent\arabic{subsubseccion}.~#1}
}


% Definition de las citas de mas 40 palabras ==========================================
%% EDULP : cita a bando, sin entrecomillas, Arial 9, interlineado de 1,5 lineas
%          sangrías izquierda y derecha de 2cm a ambos lados
%          separado del texto anterior y posterior por un espacio
\newenvironment{citas}{
\vspace{2.5mm}
\fontsize{9}{9}\selectfont
%\begin{spacing}{1.5}
\begin{list}{}{%
\setlength{\leftmargin}{2cm}%
\setlength{\rightmargin}{2cm}%
 }\item[]}{\end{list}\vspace{2.5mm}}
%{\end{list}\end{spacing}\vspace{2.5mm}}


% Definition del footnote =============================================================
%% EDULP : Arial 8, interlineado sencillo
\newcommand{\notaalpie}[1]{
\footnote{\fontsize{8}{8}\selectfont #1}
}


% Definition de la leyendas de figuras ================================================
%% EDULP : Arial 8, normal
\addto\captionsspanish{
  \renewcommand{\figurename}{\fontsize{8}{8}\selectfont Figura}
}
\newcommand{\leyenda}[1]{
\renewcommand{\baselinestretch}{1.5}
\caption{\fontsize{8}{8}\selectfont  #1}
}


% Definition del indice ===============================================================
%% EDULP : Índice, Arial 18, Negrita
%          Capítulo~no, Arial 10, negrita, interlineado de 1,5 lineas
%          Título del capítulo, arial 10, normal, interlineado de 1,5 lineas
%          Nombre y apellido, arial 10, cursiva, interlineado de 1,5 lineas
\newcommand{\indice}{
\renewcommand{\contentsname}{\fontsize{18}{18}\selectfont\bf \'Indice\vspace{4cm}}
\tableofcontents
\newpage
}