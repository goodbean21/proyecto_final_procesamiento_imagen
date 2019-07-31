 if(strcmp(out, 'Agua'))
        if(Array2(1) > Array(1) - Array(1)*5  && Array2(1) < Array(1) + 5*Array(1))
            if (Array2(6) > Array(6) - Array(6)*5 && Array2(6) < Array(6) + Array(6)*5)
                if(Array2(8) > Array(8) - Array(8)*5 && Array2(8) < Array(8) + Array(8)*5)

%                 if(Array2(5) > Array(5) - Array(5)*0.47 && Array2(5) < Array(5) + Array(5)*0.47)
%                     if(euler < 3)
                        if(Array2(3) > Array(3)-Array(3)*10 && Array2(3) < Array(3)+Array(3)*10)
                            outp = 'Agua Encontrada';

                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3);
        %                     
%                             disp(outp);
%                         end
                    end
%                 end
            end
            end
    end
    else
        if(Array2(1) > Array(2) - Array(1)*0.1  && Array2(1) < Array(1) + 0.1*Array(1))
            if (Array2(6) > Array(6) - Array(6)*0.5 && Array2(6) < Array(6) + Array(6)*0.5)
                if(Array2(8) > Array(8) - Array(8)*0.5 && Array2(8) < Array(8) + Array(8)*0.55)

%                 if(Array2(5) > Array(5) - Array(5)*0.47 && Array2(5) < Array(5) + Array(5)*0.47)
%                     if(euler < 3)
                        if(Array2(3) > Array(3)-Array(3)*10 && Array2(3) < Array(3)+Array(3)*10)
                            outp = 'Agua Encontrada';

                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,1);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,2);
                            canvas((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3) = I((round(cent(i,2)) - 60):round(cent(i,2)) - 60 + 120, round(cent(i,1)) - 60:round(cent(i,1)) - 60 + 120,3);
        %                     
                            disp(out);
%                         end
                    end
%                 end
            end
            end
        end
        
    