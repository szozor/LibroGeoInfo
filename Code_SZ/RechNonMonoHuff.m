%addpath /Users/steeve/MA_ZONE/matlab
%0.3139      0.3163    0.0517    0.3182
%0.7088    0.0566    0.1920    0.0426 MIEUX!!!

ns = 2;% nombre etats X
d = 2; % taille de l'alphabet de codage
ne = 17; % extensions à tester


%Nr = 50; % nb realisations / proba testées p_1 de 0 à .5 (sym)
Nr = 0;

Hd = zeros(1,Nr+1); L = zeros(length(ne),Nr+1); lbcle=int2str(Nr+1);
for ind = 1:Nr+1
  tic
  %pr = rand(ns,1); pr = pr/sum(pr); % proba des etats
  %pr = [(ind-1)/2/Nr ; (2*Nr+1-ind)/2/Nr ];
  pr = [.33 ; .67];
  %
  [Hd(ind),L(:,ind)] = CodageExtensions(pr,d,ne);
  %
  disp(['boucle ' int2str(ind) ' sur ' lbcle ' : ' num2str(toc) ' s']);
  %dL = diff(L);
  %if(sum(dL>0)>0);
  %  Pn = [Pn pr]; Ln = [Ln L];
  %  [M I] = max(dL);
  %  if(M > Md); prm = pr; Md = M; end
  %  if(sum(dL>0)>1); Pn2 = [Pn2 pr]; Ln2 = [Ln2 L]; end
  %  if(sum(dL>0)>2); Pn3 = [Pn3 pr]; Ln3 = [Ln3 L]; end
  %end
  %Ln(:,ind) = L;
end
eval(['save PnLn_n2_d2_ext' int2str(ne(end)) ';']);