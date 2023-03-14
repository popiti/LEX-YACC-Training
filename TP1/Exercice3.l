%{
int nb ;
%}
commentaire --.*
chaine \"[^"]*\"
debut (d|D)(e|E)(b|B)(u|U)(t|T)
%%
{commentaire}           {printf("[%s] ceci est un commentaire \n",yytext);}
NOM                     {printf("[%s]\t",yytext);}
{chaine}                {printf("chaine :[%s]\n",yytext);}
PV                      {printf("[%s]\t",yytext);}
{debut}                 {printf("debut: [%s]\t",yytext);}
[\n]                    {printf("retour chariot, on ne fait rien \n ");}
.                       {nb++ ; printf(" caractere '%c' ignore \n",yytext[0]);}
%%
int main(){
nb = 0 ; yylex() ; printf ("\n On a ignore %d caracteres \n",nb) ;
}