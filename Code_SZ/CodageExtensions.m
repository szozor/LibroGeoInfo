function [Hd,L] = CodageExtensions(pr,d,ne);

% usage [Hd,L] = CodageExtensions(pr,d,ne);
%
% pr : vecteur de proba des etats
% d  : taille de l'alphabet de codage
% ne : taille de l'extension; si c'est un vecteur, on les teste toutes
%
% Hd : entropie de base d de la source
% L  : longueur moyenne par symbole du code d'extension ne


Hd = -sum(pr.*log(pr))/log(d); % entropie
Hd(isnan(Hd)) = 0;

ns = length(pr); % nombre d'etats
if(size(pr,1)==1); pr = pr'; end % pr en une colonne
p = pr;
ne = sort(ne); % taille d'ext. en croissant
               % pour l'extension ne(i) : boucle de ne(i-1) à ne(i) pour la créer...

L = zeros(length(ne),1);
deb = 1; % debut d'indice pour faire les proba d'extension
for ie = 1:length(ne)
  %tic
  for ine = deb:ne(ie)-1
    p = reshape(p*pr',ns^(ine+1),1); % proba de l'extension
  end
  deb = ne(ie); % nouveau debut d'indice pour l'extension suivante
  lp = ns^ne(ie); % longueur de p
  %toc,tic
  dict = huffmandict(1:lp,p,d); % construction du code
  %toc,tic
  for ip = 1:lp
    L(ie) = L(ie)+length(cell2mat(dict(ip,2)))*p(ip);
  end
  L(ie) = L(ie)/ne(ie);
  %toc,pause
end
