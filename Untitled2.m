clc
clear

[x,n]=stepseq_1(-2,8,2);
stem(n,x)
function [x,n]=stepseq_1(n1,n2,n0)
         n=[n1:n2];
         x = [zeros(1,n0-n1),ones(1,n2+1-n0)];
end
