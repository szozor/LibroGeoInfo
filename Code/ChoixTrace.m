%load  ../Mat/PnLn_n2_d2_ext15

le = length(ne);
for ir = 1:Nr+1
  M = 1-Hd(ir);%max(L(:,ir)-Hd(ir)); 
  DL = (L(:,ir)-Hd(ir))/M; % difference normalisee
  %DL = L(:,ir)/Hd(ir)-1; % difference relative
  plot(ne,DL,'bo-');%,ne,1/M./ne','r-');
  set(gca,'xlim',[0 max(ne)],'ylim',[0 1.01])
  %set(gca,'xlim',[0 max(ne)],'ylim',[0 1/Hd(ir)-1])
  s = input(['Sauvegarde du jeu no ' int2str(ir) ' ? O/N [N]'],'s');
  if(strcmp(s,'O'));
    %Lmax = max(L(:,ir)); 
    fic = fopen(['Loptn_p' num2str((ir-1)/2/Nr) '.txt'],'w');
    for ie=1:le; fprintf(fic,'%d  %12.8f\n',[ne(ie) 2*DL(ie)]); end
    fclose(fic);
  end
end

%disp(['Proba avec la croissance la plus forte : ' num2str(prm)]);