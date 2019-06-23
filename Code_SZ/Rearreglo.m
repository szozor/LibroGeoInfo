d = 2;
r = 0:.01:3.5;
nu = 6;
%mu = [1 ; zeros(d-1,1)];
mu = ones(d,1)/sqrt(d);

S = eye(d)/(nu+2)+mu*mu';
v = trace(S)/d;

% Mezcla de Student-r : propto [ (1-||x+mu||^2)_+^((nu-d)/2) +  (1-||x-mu||^2)_+^((nu-d)/2) ]

% Rearreglo de la mezcla de Student-r = Student-r :  (1 - ||x||^2/4^(1/d))_+^((nu-d)/2) ]
% e integracion en la bola de radio r da L(r) = betainc(r,d/2,(nu-d)/2+1)
I = find(r <= 2^(1/d)); l = length(r)-length(I);I = I(end);
Lp = [betainc(r(1:I).^2/(4^(1/d)),d/2,(nu-d)/2+1) ones(1,l)];

% Lo mismo para la gausiana 
u = (r.^2)/2/v;
Lg = gammainc(u,d/2);


% Lo mismo para la Student-t
u = r.^2/((nu-2)*v);
Ls = 2/(d*beta(d/2,(nu+d)/2))*hypergeom([d/2 (nu+d)/2],d/2+1,-u);

% Lo mismo para la uniforme de misa varianza
%a = sqrt(3*(nu+3)/(nu+2));
%I = find(r <= a); l = length(r)-length(I);I = I(end);
%Iur = [r(1:I)/a ones(1,l)];


% Lo mismo para la arcsin
%s = sqrt(v);
%I = find(r <= sqrt(2)*s); l = length(r)-length(I);I = I(end);
%Iar = [1-2*asin(1-r(1:I)/sqrt(2)/s)/pi ones(1,l)];


plot(r,Lp,'r-',r,Lg,'k-',r,Ls,'b-')
%,r,Iur,'b--',r,erf(r/sqrt(2*v)),'r-',r,Iar,'k-',r,1-exp(-2*r/s),'k--')