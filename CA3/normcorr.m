function result = normcorr(x, y)
    x=double(x);
    y=double(y);
    a = x.*y;
    a = sum(a);
    numerator = sum(a);
    b = x.*x;
    b = sum(b);
    denumeratorPartX = sum(b);
    c = y.*y;
    c = sum(c);
    denumeratorPartY = sum(c);
    result = numerator/sqrt(denumeratorPartX*denumeratorPartY);
end