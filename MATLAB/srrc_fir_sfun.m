function srrc_fir_sfun(block)
% MATLAB S-Function used to implement a direct form FIR filter in simulink
setup(block);

%% Function: setup ========================================================
%% Abstract: Define 1 input port and 1 output port for the block.

function setup(block)

% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
block.InputPort(1).Dimensions  = 1;  % Scalar
block.InputPort(1).DatatypeID  = 0;  % Double
block.InputPort(1).Complexity  = 'Real';
block.InputPort(1).DirectFeedthrough = false;

% Override output port properties
block.OutputPort(1).Dimensions  = 1; % Scalar
block.OutputPort(1).DatatypeID  = 0; % Double
block.OutputPort(1).Complexity  = 'Real';

% Register parameters
block.NumDialogPrms     = 0;    %No parameters

% Register sample times
block.SampleTimes = [-1 0]; % Inherited sample time

% Specify the block simStateCompliance
%    'DefaultSimState', < Same sim state as a built-in block
block.SimStateCompliance = 'DefaultSimState';

% Register the block methods
block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Start', @Start);
block.RegBlockMethod('Outputs', @Outputs);
block.RegBlockMethod('Update', @Update);
block.RegBlockMethod('Terminate', @Terminate);

%% Function: DoPostPropSetup ==============================================
% Setup work areas and state variables
function DoPostPropSetup(block)

% Store the input samples
block.NumDworks = 1;
  
  block.Dwork(1).Name            = 'z';
  block.Dwork(1).Dimensions      = 22;     % Vector
  block.Dwork(1).DatatypeID      = 0;      % Double
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = true;

%% Function: InitializeConditions =========================================
function InitializeConditions(block)

% Initialize the filter samples to 0
block.Dwork(1).Data = zeros(1,22); 

%% Function: Start ========================================================
function Start(block)
global coeff

% Vector containing the filter coefficients (already quatized)
coeff = [-271, -246, 253, 694, 253, -1229, -2570, -1739, 2569, 9479, ...
        15966, 18622, 15966, 9479, 2569, -1739, -2570, -1229, 253, 694,...
        253, -246, -271];
    
%end Start

%% Function: Outputs ======================================================
function Outputs(block)

global coeff
global y

y = 0;  % Temporary store the filter output

for i=0:22
    if i == 0
        y = y + block.InputPort(1).Data * coeff(1);
    else
        y = y + block.Dwork(1).Data(i) * coeff(i+1);
    end;
end;

% Update the block output
block.OutputPort(1).Data = floor(y/2^14); % the output is truncated

%% Function: Update =======================================================
% Update block internal state
function Update(block)

% Update the input samples
block.Dwork(1).Data = [block.InputPort(1).Data; block.Dwork(1).Data(1:21)];

%% Function: Terminate ====================================================
function Terminate(block)

%end Terminate