function rhs = nBody(t,X)
% Setup of the rhs vector and some global variables

global M;
global G;
global n;

rhs = zeros(6*n,1);

%% Precomputing the repeating values

% Calculating the distances between the masses 
% i - the mass, j - the other masses
r = zeros(n,n);

for i = 1:n
    for j = 1:n
        
        if j~=i         % Only for different bodies there can be a distance
            
            r(i,j) =  ( (X((3*(j-1))+1)-X((3*(i-1))+1)).^2 + ...
                        (X((3*(j-1))+2)-X((3*(i-1))+2)).^2 + ...
                        (X(3*j)-X(3*i)).^2 ).^(3/2);
            
            r(j,i) = r(i,j);
        
        end
    end
end

%% Filling in the velocities

for i = 1:3*n
    rhs(i) = X(3*n+i);
end

%% Accelerations

for i = 1:n
    
    % X - component
    acc = 0;            % Temporary holder  set to 0
    for j=1:n 
        if j~=i 
            acc = acc + (M(j)/(r(i,j)))*(X((3*(j-1))+1)-X((3*(i-1))+1));
        end
    end
    acc = G*acc;        % adjusting for the gravitational constant
    % setting the rhs
    rhs(3*n+(3*(i-1))+1) = acc;
    
    % Y - component
    acc = 0;            % Temporary holder reset to 0 
    for j=1:n 
        if j~=i
              acc = acc + (M(j)/(r(i,j)))*(X((3*(j-1))+2)-X((3*(i-1))+2));     
        end
    end
    acc = G*acc;        % adjusting for the gravitational constant
    % setting the rhs
    rhs(3*n+(3*(i-1))+2) = acc;

    % Z - component
    acc = 0;            % Temporary holder reset to 0
    for j=1:n 
        if j~=i
             acc = acc + (M(j)/(r(i,j)))*(X(3*j)-X(3*i));
        end
    end
    acc = G*acc;        % adjusting for the gravitational constant
    % setting the rhs
    rhs(3*n+3*i) = acc;

end

end          
