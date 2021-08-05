function [nz] = convindices(nx,ny)
nz= min(nx)+min(ny) :1: max(nx)+max(ny);
end

