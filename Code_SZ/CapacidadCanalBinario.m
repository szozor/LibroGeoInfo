dp = 1e-3; p = (0:dp:1)'; un = ones(size(p));
hp = -p.*log2(p)-(1-p).*log2(1-p); I = find((p==0)+(p==1)); hp(I) = 0;

Hp = hp*un'; P = p*un';

C = log2(1+2.^((Hp-Hp')./(1-P-P')))-((1-P').*Hp-P.*Hp')./(1-P-P');
C = C.*flipud(1-eye(size(C)));

subplot('position',[0 0 .75 1]);
h = imagesc(p,p,C); axis xy; colormap(1-gray); brighten(-.5); col = colorbar;
% brighten(-.5);

set(gca,'fontsize',6,'visible','off','box','off');
OrigSize = get(gca,'position');
OrigPos = get(col,'position');
set(col,'position',OrigPos+[.28 0 0 0],'ticklabels',{});
set(gca,'position',OrigSize);
%set(gcf, 'renderer', 'painters');

%screenpos = get(gcf,'Position');
%larg = 1.5; haut = 1.25; marg = 0;
set(gcf,'paperposition',[0 0 4 3]);
%figuresize(1.5,1.25,'centimeters');

print('CapacidadBinaria','-r2000','-dpng')