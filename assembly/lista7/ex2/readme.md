# Exercício 2

Escreva um programa equivalente ao código C abaixo com o assembly do MIPS.
Assim como no exemplo em C, utilize duas subrotinas (soma3n e soma). Armazene
os valores em $t0, $t1, $t2 e $t3, para X, Y, Z e R, respectivamente.

main(){
int X=150;
int Y=230;
int Z=991;
int R=0;
R = soma3n(X, Y, Z);
}
int soma3n(int n1, int n2, int n3){
return( soma(n3, soma(n1, n2)));
}
int soma(int A, int B){
return( A+B );
}