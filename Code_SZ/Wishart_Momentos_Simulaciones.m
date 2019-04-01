d = 4; % dimension
co = 10;
while co >=8
  V = randn(d); Vd = V*V';% fijamos une matriz en P_d^+
  co = cond(V);
end
disp('V generada');
%
n = 10;% grados de libertad, entero para la simulacion

Nreal = 25000000;% numero de realizaciones

J = zeros(d^2); K = J;
I = eye(d);

for ii = 1:d
  for jj = 1:d
    J((ii-1)*d+jj,(jj-1)*d+ii) = 1;
    K((ii-1)*d+ii,(jj-1)*d+jj) = 1;
  end
end


m = zeros(d);% inicializacion del promedio
c = zeros(d^2);% inicializacion de la covarianza
v = zeros(d); % test varianzas

for ind=1:Nreal
  g = V*randn(d,n);% n gausiana de covarianza Vd
  %
  w = sum(reshape(kron(g,ones(1,d)).*kron(reshape(g,1,d*n),ones(d,1)),d,d,n),3);
  %w = zeros(d);
  %for in = 1:n
  %  w = w + g(:,in)*g(:,in)';
  %end
  m = m + w;% actualizacion del promedio
  c = c + kron(w,w);% actualizacion del momento de orden 2
  v = v + w.^2;
  if(rem(ind,100000)==0);disp(['Bucla no ' int2str(ind) ' sobre ' int2str(Nreal)]);end
end
m = m/Nreal; % promedio estimado
c = c/(Nreal-1) - (Nreal/(Nreal-1))*kron(m,m);
v = v/(Nreal-1) - (Nreal/(Nreal-1))*m.^2;

mth = n*Vd;
vth = n*(Vd.^2+diag(Vd)*diag(Vd)');
cth = zeros(d^2);

em = max(max(abs(1-m./mth)));
ev = max(max(abs(1-v./vth)));
ec = 0;
%ec2 = 0;
for ic = 1:d
  for jc=1:d
    for kc = 1:d
      for lc = 1:d
	cthD((ic-1)*d+kc,(jc-1)*d+lc) = n*Vd(ic,kc)*Vd(jc,lc);
	cthC((ic-1)*d+kc,(jc-1)*d+lc) = n*Vd(ic,lc)*Vd(jc,kc);
	cth((ic-1)*d+kc,(jc-1)*d+lc) = n*(Vd(ic,kc)*Vd(jc,lc)+Vd(ic,lc)*Vd(jc,kc));
	%cth2 = n*(Vd(ic,jc)*Vd(kc,lc)+Vd(ic,lc)*Vd(jc,kc));
	ces = c((ic-1)*d+kc,(jc-1)*d+lc);
	%pause
	ec = max(ec,abs(1-ces/cth((ic-1)*d+kc,(jc-1)*d+lc)));
	%ec2 = max(ec2,abs(1-ces/cth2));
      end
    end
  end
end

[em ev ec]


subplot(2,2,1);imagesc(c); colorbar
subplot(2,2,3);imagesc(cth); colorbar
%
subplot(2,2,2);imagesc(abs(c-cth)); colorbar
subplot(2,2,4);imagesc(abs(1-c./cth)); colorbar