/// val_to_text(type,val);

switch(argument[0])
    {
    case 0: // boolean
        if (argument[1] < 0.5)
            return("OFF");
        else
            return("ON");
        break;
    
    case 1: // percent
        return(string(round(argument[1]*100))+"%");
        break;
    }
