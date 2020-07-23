procedure cnpj_format( p_cnpj     in varchar2
                      ,p_message  out varchar2)is 
    
    w1 varchar2(10);
    w2 varchar2(10);
    w3 varchar2(10);
    w4 varchar2(10);
        
    begin 
        w1 :=  substr(p_cnpj,3,1);
        w2 :=  substr(p_cnpj,7,1);
        w3 :=  substr(p_cnpj,11,1);
        w4 :=  substr(p_cnpj,16,1);          
                                                                                   

        if instr(w1,'.') = 0  then
           p_message :=  'w1 with problems. Character "." was not located in the third position');    
     elsif instr(w2,'.') = 0 then
           p_message := 'w2 with problems. Character "." was not located in seventh position '); 
     elsif instr(w3,'/') = 0 then
           p_message :=  'w3 with problems. Character "/" was not located in eleventh position '); 
     elsif instr(w4,'-') = 0 then 
           p_message := 'w4 with problems. Character "-" was not found in the sixteenth position'); 
     else 
          p_message := 'Valid formatting!';
    end if; 
    exception
     when others then 
       raise_application_error (-20099 , sqlerrm || ' - ' || 'P_CNPJ - '||p_cnpj);
    end cnpj_format;