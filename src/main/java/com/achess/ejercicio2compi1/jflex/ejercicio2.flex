package com.achess.ejercicio2compi1;
%%

%class Lexer
%unicode
%line
%column
%public
%int


%{    
    private int countWordsVocals[] = {0,0,0,0,0};
    private String infoInts = "";

    public void addCount(int nVocals){
        countWordsVocals[nVocals - 1]++;
    }

    public int[] getCount(){
        return countWordsVocals;
    }

    public String info(){
        String info = "";
        for(int i = 0; i < countWordsVocals.length; i++){
            info += "Con " + (i+1) + " vocal(es): " + countWordsVocals[i] + "\n"; 
        }  
        return info;
    }

    public void addInfoInts(String info){
        infoInts += info + "\n";
    }

    public String getInfoInts(){
        return infoInts;
    }
%}

/*Agragar conjunto de letras upper and lower y conjunto de consonantes*/
consonants = [b-dB-Df-hF-Hj-nJ-Np-tP-Tv-zV-Z]
vocals = [AaEeIiOoUu]
wordsNVocals = {consonants}*{vocals}{consonants}*

%%

({wordsNVocals}){5} {addCount(5);}
({wordsNVocals}){4} {addCount(4);}
({wordsNVocals}){3} {addCount(3);}
({wordsNVocals}){2} {addCount(2);}
({wordsNVocals}) {addCount(1);}
\d+ {addInfoInts("Entero ln: " + yyline + " col: " + yycolumn);}

[^] {}