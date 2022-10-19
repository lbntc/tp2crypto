function [ y ] = RF( x,n,k,choix )
if(choix==0) %chiffrement
    g(1,:)=x(1:4);
    d(1,:)=x(5:8);
    for i=1:n
        g(i+1,:)=d(i,:);
        A=bin2dec(g(i,:));
        b=bin2dec(d(i,:));
        B=f(b,i,k);
        H=bitxor(A,B);
        d(i+1,:)=dec2bin(H,4);
    end
    y=[g(n+1,:),d(n+1,:)];
else
    g(n+1,:)=x(1:4);
    d(n+1,:)=x(5:8);
    for i=n:-1:1
        d(i,:)=g(i+1,:);
        A=bin2dec(d(i+1,:));
        b=bin2dec(g(i+1,:));
        B=f(b,i,k);
        H=bitxor(A,B);
        g(i,:)=dec2bin(H,4);
    end
    y=[g(1,:),(d(1,:))];

end
end

