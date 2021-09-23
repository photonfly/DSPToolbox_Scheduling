function col = concatinate(matrix)
[rows,cols] = size(matrix);
%col = zeros(rows*cols,1);
    for i = 1: rows
        index1 = (i-1)*cols + 1;
        index2 = index1 + cols - 1;
        col(index1:index2,:) = matrix(i,:)';
    end
end