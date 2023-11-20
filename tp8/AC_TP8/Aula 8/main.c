#include <stdio.h>
#include <string.h>
#include <time.h>

#include "sort.h"

/*
Exemplo realizado na aula TP 8.
Pretendia-se implementar em assembly o algoritmo Bubble Sort para ordenar uma tabela de inteiros.
Disponibilizo uma versão em assembly e uma versão em C e medimos o tempo que ambas as implementações
levam a correr. Como o timer interno do C não tem muita resolução,repetiu-se a ordenação
1,000,000 de vezes.

Como podem observar a diferença em termos de execução não é aparentemente muito significativa,
simplesmente porque este é um algoritmo muito simples e o compilador está a conseguir optimizar
bem o código gerado em assembly. Na ficha 9 vamos depois ver outro exemplo onde as diferenças
podem ser maiores.
*/

int tab[]={30,50,10,80,5,20,45,70,15,55,32,52,12,82,7,22,47,72,17,58};
int tabAux[20];

void imprime(int *tab,int num,char *str){

  int i;
  
  printf("Tab %s: ",str);
  for(i=0;i<num;i++){
    if(i>0)
      printf(",");
    printf("%d",tab[i]);
  }
  printf("\n");
  

}

void troca_c(int *tab){
  int aux;
  
  if(tab[0]>tab[1]){
    aux=tab[0];
    tab[0]=tab[1];
    tab[1]=aux;
  }
}

void sort_c(int *tab,int num){
  int i,j;
  for(i=num-1;i>0;i--){
    for(j=0;j<i;j++){
      troca_c(&tab[j]);
    }
  }
}


void main(){

  clock_t T1,T2;
  int i;

  imprime(tab,20,"Original");

  // Vamos cronometrar a função em Assembly
  T1=clock();

  for(i=0;i<1000000;i++){
    memcpy((void *)tabAux, (void *)tab, 20*sizeof(int));    
    sort(tabAux,20);
  }

  T2=clock();
  printf("A sua rotina em assembly executou em %6.3f segundos.\n",(((double)(T2-T1))/CLOCKS_PER_SEC));

  imprime(tabAux,20,"Resultante em Assembly");

  // Vamos cronometrar agora a função em C
  T1=clock();
  
  for(i=0;i<1000000;i++){
    memcpy((void *)tabAux, (void *)tab, 20*sizeof(int));    
    sort_c(tabAux,20);
  }

  T2=clock();
  printf("A sua rotina em C executou em %6.3f segundos.\n",(((double)(T2-T1))/CLOCKS_PER_SEC));

  imprime(tabAux,20,"Resultante em C");

}
