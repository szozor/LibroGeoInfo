\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LibroIG}[2019/04/30 .cls Personal, V1.1]

% clase de base

\LoadClass[a4paper, 10pt, twoside, openright]{article}


% extensions

%% EDULP: margenes superior e inferior 2 cm, margenes izquierdo y derecho 3 cm
\RequirePackage[left=2cm,right=2cm,top=3cm,bottom=3cm]{geometry}
\RequirePackage[latin1]{inputenc} % encoding
\RequirePackage[T1]{fontenc} % font encoding
\RequirePackage{amsmath,amssymb,amsthm,bbm,mathtools} % mathematical packages
%\RequirePackage{dotlessi} %
%\RequirePackage{stix} % hebrew letters
\RequirePackage{xspace} % spacing package
\RequirePackage{epsfig,graphics,graphicx,color,tikz,tikz-3dplot,pgfplots,etoolbox} % figures packages
\usetikzlibrary{math}% paquete de mathematica en tikz
\RequirePackage{enumitem} % to manage the labels... en enumerate
%\RequirePackage[labelsep=endash]{caption}
%\RequirePackage{setspace} % space package
\RequirePackage{comment}
\RequirePackage{ccaption,caption} % ease the management of captions
\RequirePackage{etoolbox,ifthen,xifthen} % conditioning packages
\RequirePackage{titletoc,tocloft} % table of content managment package
\RequirePackage{tabularx,supertabular,fullpage} % para manejar las tablas y tablas largas
\RequirePackage{ltxtable,longtable} % para manejar las tablas largas
%\RequirePackage{boites,chngpage} % para poder cortar tablas cambiando de pagina
\RequirePackage{footnote,footmisc} % to manage the numeration and reference to footnote
\makesavenoteenv{tabular} % to manage the footnote in tabular environment
%\RequirePackage{tablefootnote} % to manage the footnote in tabular environment
%\RequirePackage{xargs}
%\RequirePackage{accents}
%\providecommand{\BIBand}{e}
\RequirePackage{apacite}
%\providecommand{\BIBand}{e}
\RequirePackage[spanish]{babel} % spanish mode for babel

\renewcommand{\rmdefault}{phv} % Arial
\renewcommand{\sfdefault}{phv} % Arial
%\renewcommand{\familydefault}{\sfdefault}


% Numeros de paginas, figuras...
%\renewcommand\thepage{\arabic{capitulo}-\arabic{page}}
\renewcommand\thefigure{\arabic{capitulo}-\arabic{figure}}
\renewcommand\thetable{\arabic{capitulo}-\arabic{table}}
%\renewcommand\listtablename{\\'Indice de Tablas}       % Cambia Indice de Cuadros a Ã­ndice de Tablas
%\renewcommand\listfigurename{\\'Indice de Figuras}     % Cambia List of Figures a Lista de Figuras


%% EDULP: margenes superior e inferior 2 cm, margenes izquierdo y derecho 3 cm
%\setlength{\textwidth}{150mm}
%\setlength{\textheight}{255mm}
%\setlength{\oddsidemargin}{6mm}
%\setlength{\evensidemargin}{6mm}
%\setlength{\topmargin}{-5mm}
%\setlength{\headheight}{0mm}
%\setlength{\headsep}{0mm}
\addtolength{\footnotesep}{5mm}\addtolength{\skip\footins}{5mm}
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
\renewcommand{\baselinestretch}{1}
\begin{center}
\noindent ##1
%\ifstrempty{#2}{}{\\[-1mm]\noindent  ##2}
%\ifstrempty{#3}{}{\\[-1mm] \noindent  ##3}
\\[-1mm] \noindent  ##2\\[-1mm] \noindent  ##3
\end{center}
}}

%% EDULP : Facultad o Colegio (Arial 11, normal)
\newcommand\facultad[1]{
\vspace{4cm}
\renewcommand{\baselinestretch}{1}
\centerline{\fontsize{11}{11}\selectfont \noindent ##1}
}

%\vfill
%\begin{center}
%\includegraphics[width=4cm]{logo_large}
%\end{center}

%\AtEndEnvironment{\newpage}
}{\cleardoublepage}



% DEDICATORIA =========================================================================

%%EDULP : dedicatoria (Arial 9, normal, interlineado de 1,5 líneas, alineación derecha)
\newenvironment{dedicatoria}{
%\ifodd\pageno\vfill\eject\hbox{}\fi\newpage
\cleardoublepage
\thispagestyle{empty}
\fontsize{9}{9}\selectfont
\addtolength{\topmargin}{6cm}
\raggedleft
}{\cleardoublepage}



% AGREDECIMIENTOS =====================================================================

%% EDULP: Agradecimientos (Arial 18, negrita)
%  Texto Arial 10, interlineado de 1,5 líneas, alineación justificada, sangría 0,5 cm.
%  Máximo una carilla.

\newenvironment{agradecimientos}{
\cleardoublepage
\thispagestyle{empty}
{\fontsize{18}{18}\selectfont\bf Agradecimientos}\vspace{4cm}\newline
\fontsize{10}{15}\selectfont\indent
}{\cleardoublepage}



% EPIGRAFE ============================================================================

%% EDULP: Epígrafe (Arial 9, cursiva interlineado de 1,5 líneas, alineación derecha).

\newenvironment{epigrafe}{
\ifthenelse{\value{capitulo}=0}{\cleardoublepage\thispagestyle{empty}\addtolength{\topmargin}{6cm}}{\vspace{4cm}}
%\ifthenelse{\value{capitulo}=0}{\addtolength{\topmargin}{6cm}}{\vspace{4cm}}
\fontsize{9}{9}\selectfont\em
\begin{flushright}
\newcommand{\autortituloepigrafe}[1]{\linebreak \textsc{##1}}
}{\end{flushright}\ifthenelse{\value{capitulo}=0}{\cleardoublepage}{\vspace{1cm}}}



% INTRODUCCION - ADVERTENCIA - PRESENTACION - PROLOGO - EPILOGO - CONCLUSION ==========

%% EDULP: TITULO Arial 18, nergito, mayuscula
%  texto, Arial 10, interlineado 1,5 líneas

\newenvironment{preliminar}[1]{
\cleardoublepage
\MakeUppercase{\fontsize{18}{18}\selectfont\bf #1}\vspace{2cm}\newline
\fontsize{10}{10}\selectfont\normalfont
\newcommand{\firma}[1]{\mbox{}\hfill {\em ##1} \hspace{2.5cm}\mbox{}\linebreak}
\newcommand{\fecha}[1]{\mbox{}\hfill {\em ##1} \hspace{2.5cm}\mbox{}}
}{\cleardoublepage}




%% counters ===========================================================================
\newcounter{capitulo}
\setcounter{capitulo}{0}
\newcounter{seccion}[capitulo]
\newcounter{subseccion}[seccion]
\newcounter{subsubseccion}[subseccion]
\renewcommand{\theseccion}{\arabic{capitulo}.\arabic{seccion}}
\renewcommand{\thesubseccion}{\arabic{capitulo}.\arabic{seccion}.\arabic{subseccion}}
\renewcommand{\thesubsubseccion}{\arabic{capitulo}.\arabic{seccion}.\arabic{subseccion}.\arabic{subsubseccion}}

%% Definition de los capitulos ========================================================
%% EDULP: titulo de capitulo 18 negrita
%%        nombre y appelido 14, cursiva

\newcommand{\capitulo}[2]{
\cleardoublepage
\refstepcounter{capitulo}
%\setcounter{page}{1}
\cftaddtitleline{toc}{part}
 {
 \hspace{-6.25pt} {\fontsize{10}{10}\selectfont\bf Cap\'itulo~\arabic{capitulo}}\newline
 {\fontsize{10}{10}\selectfont\normalfont #1}
 \ifstrempty{#2}{}{\newline {\fontsize{10}{10}\selectfont\normalfont\em  #2}}
  \vspace{1.5mm}
 }{}
%
{\fontsize{18}{18}\selectfont\bf\indent\indent CAP\'ITULO~\arabic{capitulo}\vspace{1.5mm}\newline
\indent\indent #1\vspace{5mm}}\newline 
\ifstrempty{#2}{}{{\fontsize{14}{14}\selectfont\em \indent\indent #2}\newline}
}


% Definition de las secciones =========================================================
%% EDULP: seccion 14 negrita, 2 espacios antes, 1 despues
\newcommand{\seccion}[1]{
\refstepcounter{seccion}
\addcontentsline{toc}{section}{
\fontsize{9}{9}\selectfont\normalfont \arabic{capitulo}-\arabic{seccion}~~#1
}
\mbox{}\newline\newline
{\fontsize{14}{14}\selectfont\bf \noindent\arabic{capitulo}.\arabic{seccion}~~#1}\newline
}



% Definition de las subsecciones ======================================================
%% EDULP: subseccion 12 negrita, 2 espacios antes, 1 despues
\newcommand{\subseccion}[1]{
\refstepcounter{subseccion}
\mbox{}\newline\mbox{}\newline
{\fontsize{12}{12}\selectfont\bf \noindent\arabic{capitulo}.\arabic{seccion}.\arabic{subseccion}~#1}\newline
}



% Definition de las subsubsecciones ===================================================
%% EDULP: subsubseccion 10 negrita, 1 espacios antes, ninguno despues
\newcommand{\subsubseccion}[1]{
\refstepcounter{subsubseccion}
\mbox{}\newline
{\fontsize{12}{12}\selectfont\bf \noindent\arabic{capitulo}.\arabic{seccion}.\noindent\arabic{subseccion}.\noindent\arabic{subsubseccion}.~#1}
}


% Definition de las citas de mas 40 palabras ==========================================
%% EDULP : cita a bando, sin entrecomillas, Arial 9, interlineado de 1,5 lineas
%          sangrías izquierda y derecha de 2cm a ambos lados
%          separado del texto anterior y posterior por un espacio
\newenvironment{citas}{
\vspace{2.5mm}
\fontsize{9}{9}\selectfont
\begin{list}{}{%
\setlength{\leftmargin}{2cm}%
\setlength{\rightmargin}{2cm}%
 }\item[]}{\end{list}\vspace{2.5mm}}


% Definition del footnote =============================================================
%% EDULP : Arial 8, interlineado sencillo
\newcommand{\notaalpie}[1]{
\footnote{\fontsize{8}{8}\selectfont #1}
}


% Definition de la leyendas de figuras y tablas ================================================
%% EDULP : Arial 8, normal
\addto\captionsspanish{\renewcommand{\figurename}{\fontsize{10}{10}\selectfont\bf Figura}}
\addto\captionsspanish{\renewcommand{\tablename}{\fontsize{10}{10}\selectfont\bf Tabla}}
\newcommand{\leyenda}[1]{
\renewcommand{\baselinestretch}{1.5}
\caption{\fontsize{10}{10}\selectfont\normalfont  #1}
}
%[footnoteless]


% Definition de fuentes de figuras, tablas... =========================================
%% EDULP : Arial 9, cursiva
\newcommand{\fuente}[1]{
\renewcommand{\baselinestretch}{1.5}
\begin{center}
{\fontsize{9}{9}\selectfont\em  Fuente: #1}
\end{center}
}


% Definition del indice ===============================================================
%% EDULP : Índice, Arial 18, Negrita
%          Capítulo~no, Arial 10, negrita, interlineado de 1,5 lineas
%          Título del capítulo, arial 10, normal, interlineado de 1,5 lineas
%          Nombre y apellido, arial 10, cursiva, interlineado de 1,5 lineas
%
\titlecontents{section}%
  [0pt]% left indent
  {\addvspace{-1mm}}% reducir el interlineado
  {}% no usa numero => eso sirve a nada (operacion de antes si hay un numero)
  {\hspace{5mm}}% poner un espacio aditcional de 5mm
  {}% punto y numero de pagina : nada para EDULP (ponen ellos)
  []% no nos sirve
\newcommand{\indice}{
\cleardoublepage
\renewcommand{\contentsname}{\fontsize{18}{18}\selectfont\bf \'Indice\vspace{4cm}}
\tableofcontents
\thispagestyle{empty}
\cleardoublepage
}


% Definition del tipo de la bibliografia
\bibliographystyle{newapa}
\newcommand{\bibliografia}[1]{
\cleardoublepage
\thispagestyle{empty}
\renewcommand{\refname}{\fontsize{18}{18}\selectfont\bf Referencias\vspace{4cm}}
% Bibliograf\'ia sugerida\vspace{4cm}}
 \bibliography{#1}
\cleardoublepage
}

% Definition de la pagina de los autores ==============================================
%% EDULP : Los autores, Arial 18, Negrita
%          Apellido, Nombre, Arial 12, negrita sin sangría
%          Parafo / autor, arial 10, normal, interlineado de 1,5 lineas, sin sangría
\newenvironment{losautores}
{
\newpage
\fontsize{18}{18}\selectfont\bf \noindent Los autores\vspace{2cm}\newline
%
%\newcommand{\elcoordinador}[2]{
%  \vspace{5mm}\newline
%  {\fontsize{12}{12}\selectfont\bf\noindent ##1}\newline
%  {\fontsize{10}{10}\selectfont\normalfont\noindent ##2}}
%
\newcommand{\elautor}[2]{
  \vspace{5mm}\newline
  {\fontsize{12}{12}\selectfont\bf\noindent ##1}\newline
  {\fontsize{10}{10}\selectfont\normalfont\noindent ##2}}
}{}

% definicion de las definiciones, teoremas...

\newtheorem{definicion}{Definici\'on}
\newtheorem{teorema}{Teorema}
\newtheorem{corolario}{Corolario}
\newtheorem{lema}{Lema}
\newtheorem{propuesta}{Propuesta}
\newtheorem{ejemplo}{Ejemplo}

% numerotacion con el numero de capitulo
\renewcommand\thedefinicion{\arabic{capitulo}-\arabic{definicion}}
\renewcommand\theteorema{\arabic{capitulo}-\arabic{teorema}}
\renewcommand\thecorolario{\arabic{capitulo}-\arabic{corolario}}
\renewcommand\thelema{\arabic{capitulo}-\arabic{lema}}
\renewcommand\thepropuesta{\arabic{capitulo}-\arabic{propuesta}}
\renewcommand\theejemplo{\arabic{capitulo}-\arabic{ejemplo}}