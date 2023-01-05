

A = [1 2 3 6 110; 3 4 5 7 510; 5 6 20 9 610; 3 4 5 7 510; 3 8 5 7 90 ];

row=height(A);
col=width(A);


% A(1,1)

disp('Mean of each column: ')
for i=1:col
       sum=0;
       for x=1:row
            sum=sum+ A(x,i);
       end 
       disp(sum/row)

end





m=[1 2 3 4]

for i=1:4
    disp(m(i))
end

