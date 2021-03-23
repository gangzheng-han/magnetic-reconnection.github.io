function[x1, x2, x3] = nran()
while(1)
	v1 = 2.*rand()-1;
    v2 = 2.*rand()-1;
    s = v1^2 + v2^2;
    if(s < 1) 
        break;
    end
end
r = sqrt(-2.*log(s)/s);
x1 = v1*r;
x2 = v2*r;
x3 = 0;
end
