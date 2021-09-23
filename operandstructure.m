function mapping = operandstructure()
% Format constants
d = 0;
g = 1;
s = 2;

% Operand types

% Input
name = 'in';
id = 1;
inout = [0 1];
argformat = [d d];
numarg = 2;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 'o';
color = 'b';
notarithmetic = 1;
dotshape = 'doublecircle';
dotname = @(x) sprintf('Input %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping = op;

% Output
name = 'out';
id = 2;
inout = [1 0];
argformat = [d d];
numarg = 2;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 'o';
color = 'b';
notarithmetic = 1;
dotshape = 'doublecircle';
dotname = @(x) sprintf('Output %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Addition Innode1 Innode2 Outnode
name = 'add';
id = 3;
inout = [2 1];
argformat = [d d d d];
numarg = 4;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '+';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Addition %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Subtraction Innode1 (-)Innode2 Outnode
name = 'sub';
id = 4;
inout = [2 1];
argformat = [d d d d];
numarg = 4;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '+';
color = 'r';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Subtraction %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Multiplication Innode Outnode Coeff
name = 'constmult';
id = 5;
inout = [1 1];
argformat = [d d d g];
numarg = 4;
isadaptor = 0;
changeable = 1;
numcoefficients = 1;
marker = '>';
color = 'm';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Constant multiplication %d\\nValue: %g', x(2), x(5)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Delay Innode Outnode
name = 'delay';
id = 6;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 's';
color = 'b';
notarithmetic = 1;
dotshape = 'square';
dotname = @(x) sprintf('Delay %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Quantization Innode Outnode Bits Type
name = 'quant';
id = 7;
inout = [1 1];
argformat = [d d d d s];
numarg = 4;
isadaptor = 0;
changeable = 1;
numcoefficients = 0;
marker = '<';
color = 'b';
notarithmetic = 0;
dotshape = 'hexagon';
dotname = @(x) sprintf('Quantization %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Overflow Innode Outnode Type
name = 'overflow';
id = 8;
inout = [1 1];
argformat = [d d d s];
numarg = 3;
isadaptor = 0;
changeable = 1;
numcoefficients = 0;
marker = '<';
color = 'r';
notarithmetic = 0;
dotshape = 'hexagon';
dotname = @(x) sprintf('Output %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Negation Innode Outnode
name = 'negate';
id = 9;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '>';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Negation %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Shift Innode Outnode Bits Type
name = 'shift';
id = 10;
inout = [1 1];
argformat = [d d d d s];
numarg = 4;
isadaptor = 0;
changeable = 1;
numcoefficients = 0;
marker = 'v';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Shift %d\\n%d bits', x(2), x(7)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Two-port adaptor Innode1 Innode2 Outnode1 Outnode2 Coeff Type
name = 'twoport';
id = 11;
inout = [2 2];
argformat = [d d d d d g s];
numarg = 6;
isadaptor = 1;
changeable = 1;
numcoefficients = 1;
marker = 'p';
color = 'b';
notarithmetic = 0;
dotshape = 'box';
dotname = @(x) sprintf('Two-port adaptor %d\\nAlpha: %g\\nSymmetric', x(2), x(7)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Three-port adaptor Innode1 Innode2 Innode3 Outnode1 Outnode2 Outnode3 Coeff1 Coeff2 Type
name = 'threeport';
id = 12;
inout = [3 3];
argformat = [d d d d d d d g g s];
numarg = 9;
isadaptor = 1;
changeable = 1;
numcoefficients = 2;
marker = 'p';
color = 'r';
notarithmetic = 0;
dotshape = 'box';
dotname = @(x) sprintf('Three-port adaptor %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;


% Four-port adaptor Innode1 Innode2 Innode3 Innode4 Outnode1 Outnode2 Outnode3 Outnode4 Coeff1 Coeff2 Coeff3 Type
name = 'fourport';
id = 13;
inout = [4 4];
argformat = [d d d d d d d d d g g g s];
numarg = 12;
isadaptor = 1;
changeable = 1;
numcoefficients = 3;
marker = 'p';
color = 'g';
notarithmetic = 0;
dotshape = 'box';
dotname = @(x) sprintf('Four-port adaptor %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Radix-2 Butterfly Innode1 Innode2 Outnode1 Outnode2
name = 'butterfly2';
id = 14;
inout = [2 2];
argformat = [d d d d g];
numarg = 6;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 'h';
color = 'b';
notarithmetic = 0;
dotshape = 'box';
dotname = @(x) sprintf('Radix-2 BF %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Division Innode Outnode Coeff
name = 'constdiv';
id = 15;
inout = [1 1];
argformat = [d d d g];
numarg = 4;
isadaptor = 0;
changeable = 1;
numcoefficients = 1;
marker = '^';
color = 'b';
notarithmetic = 0;
dotshape = 'diamond';
dotname = @(x) sprintf('Constant division %d\\n%g', x(2), x(6)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Mux Innode1 Innode2 Controlnode Outnode
name = 'mux';
id = 16;
inout = [3 1];
argformat = [d d d d d];
numarg = 5;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 'd';
color = 'r';
notarithmetic = 0;
dotshape = 'trapezium';
dotname = @(x) sprintf('Mux %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Demux Innode Controlnode Outnode1 Outnode2
name = 'demux';
id = 17;
inout = [2 2];
argformat = [d d d d d];
numarg = 5;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 'd';
color = 'b';
notarithmetic = 0;
dotshape = 'trapezium';
dotname = @(x) sprintf('Demux %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Constant MAC InnodeMult InnodeAdd Outnode Coeff
name = 'constmac';
id = 18;
inout = [2 1];
argformat = [d d d d g];
numarg = 5;
isadaptor = 0;
changeable = 1;
numcoefficients = 1;
marker = 'x';
color = 'g';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Constant MAC %d\\n%g', x(2),x(7)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Two-input multiplication Innode1 Innode2 Outnode
name = 'mult';
id = 19;
inout = [2 1];
argformat = [d d d d];
numarg = 4;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 'x';
color = 'k';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Multiplication %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Two-input division Innode1 Innode2 Outnode
name = 'division';
id = 20;
inout = [2 1];
argformat = [d d d d];
numarg = 4;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '^';
color = 'b';
notarithmetic = 0;
dotshape = 'diamond';
dotname = @(x) sprintf('Division %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Reciprocal Innode Outnode
name = 'reciprocal';
id = 21;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '^';
color = 'm';
notarithmetic = 0;
dotshape = 'diamond';
dotname = @(x) sprintf('Reciprocal %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% MAC Multin1 Multin2 Addin Outnode
name = 'mac';
id = 22;
inout = [3 1];
argformat = [d d d d d];
numarg = 5;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = 'x';
color = 'g';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('MAC %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Constant Outnode Coefficient
name = 'constant';
id = 23;
inout = [0 1];
argformat = [d d g];
numarg = 3;
isadaptor = 0;
changeable = 1;
numcoefficients = 1;
marker = '.';
color = 'k';
notarithmetic = 1;
dotshape = 'doublecircle';
dotname = @(x) sprintf('Constant %d\\nValue: %g', x(2), x(4)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Add/Sub
name = 'addsub';
id = 24;
inout = [2 1];
argformat = [d d d s];
numarg = 4;
isadaptor = 0;
changeable = 1;
numcoefficients = 0;
marker = '+';
color = 'k';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Add/sub %d\\nMode: %d', x(2), x(6)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Conjugate Innode Outnode
name = 'conjugate';
id = 25;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '*';
color = 'g';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Conjugate %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Absolute Innode Outnode
name = 'abs';
id = 26;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '*';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Absolute %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Max Innode1 Innode2 Outnode
name = 'max';
id = 27;
inout = [2 1];
argformat = [d d d d];
numarg = 4;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '+';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Max %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Min Innode1 Innode2 Outnode
name = 'min';
id = 28;
inout = [2 1];
argformat = [d d d d];
numarg = 4;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '+';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Min %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Square root Innode Outnode
name = 'sqrt';
id = 29;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '*';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Square root %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Reciprocal square root Innode Outnode
name = 'recipsqrt';
id = 30;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '*';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Reciprocal square root %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

% Square root Innode Outnode
name = 'square';
id = 31;
inout = [1 1];
argformat = [d d d];
numarg = 3;
isadaptor = 0;
changeable = 0;
numcoefficients = 0;
marker = '*';
color = 'b';
notarithmetic = 0;
dotshape = 'ellipse';
dotname = @(x) sprintf('Square %d', x(2)); 
op = struct('id', id, 'name', name, 'inout', inout, 'argformat', argformat, 'numarg', numarg, 'isadaptor', isadaptor, 'changeable', changeable, 'numcoefficients', numcoefficients, 'marker', marker, 'color', color, 'notarithmetic', notarithmetic, 'dotshape', dotshape, 'dotname', dotname);
mapping(id) = op;

