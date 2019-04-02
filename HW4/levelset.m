function [interval] = levelset(alpha,point)

  dataSize = size(point,2);
  if dataSize < 3
    interval = point;
  elseif dataSize == 3
    a = point(1);
    b = point(2);
    c = point(3);
    interval= [a+alpha*(b-a),c-alpha*(c-b)];
  elseif dataSize == 4
    a = point(1);
    b = point(2);
    c = point(3);
    d = point(4);
    interval = [a+alpha*(b-a),d-alpha*(d-c)];
  endif
endfunction
