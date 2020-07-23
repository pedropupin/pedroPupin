function characters ( p_cnpj    in varchar2)
    return varchar2 is
        
        w_return   varchar2(4000);
        
        begin         
            if length(p_cnpj) <> 14 then 
               w_return := 'INCORRECT QUANTITY OF CHARACTERS!';
            else
              w_return := 'CORRECT AMOUNT OF CHARACTERS!';
            end if;
            
            return(w_return);
            
        exception 
            when others then 
                    raise_application_error (-20099 , sqlerrm || ' - ' || 'P_CNPJ - '||p_cnpj);
   end qtde_caracteres;