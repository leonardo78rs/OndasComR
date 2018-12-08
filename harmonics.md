---
output:
  html_document: default
  word_document: default
---
# Produ��o de gr�ficos com ![R](http://developer.r-project.org/Logo/Rlogo-5.png)
## T�pico: Somat�rio de ondas harm�nicas.


![plot of chunk unnamed-chunk-17](figure/unnamed-chunk-17-1.png)


**Resumo:** Atrav�s deste trabalho mostro como trabalhar v�rias fun��es e como implementar t�cnicas r�pidas e simples de programa��o, utilizando a linguaguem R, e ao mesmo tempo dando uma no��o de como formar ondas harm�nicas atrav�s de dados e ao final produzindo gr�ficos que mostram o comportamento destas ondas.

### Aprendendo programa��o em R e como pensar a teoria das ondas cl�ssicas.

- Decidi fazer um passo a passo de como programar em R, para exibi��o de gr�ficos de ondas harm�nicas. Para leitura deste artigo, n�o � necess�rio entender nenhum desses conceitos, mas toda informa��o pr�via � muito bem utilizada. 


### Gerando o gr�fico mais simples 

- Utilizando RStudio, vamos mostrar como fazer um gr�fico com as fun��es mais simples de todas: "seq" e "plot". A primeira, cria uma sequencia de acordo com os par�metros  e a segunda lista diretamente um gr�fico (padr�o XY).

- Primeiramente, vamos fazer um gr�fico qualquer em R. Atrav�s da fun��o seq, geramos uma sequencia de 1 a 20, incrementando de 1 em 1. 


```r
# Atribuindo uma sequencia de 0 a 20
x = seq(0,20, 1)
# Listando a sequencia 
x
```

```
##  [1]  0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
```

```r
# Grafico desta sequencia
plot(x)
```

![plot of chunk unnamed-chunk-18](figure/unnamed-chunk-18-1.png)


- Como chamei a fun��o plot com um array de 1 dimens�o, o eixo horizontal assume seus valores como a sua posi��o (ordem) no array. 

- A fun��o plot lista a sequ�ncia. Com estes dois fundamentos vamos demonstrar como modelar segmentos de ondas. 


### Gr�fico de uma fun��o de onda 

- J� pulando alguns passos, vou fazer o pr�ximo gr�fico da fun��o seno de x. Como as ondas tem car�ter senoidal, o pr�ximo gr�fico j� representa uma onda. 

- Para melhorar a qualidade do gr�fico, eu diminui o incremento da sequencia, ou seja, cada ponto ser� acrescido de 0.1, gerando mais pontos no gr�fico, ou seja, vamos aumentar nossa sequencia x, para um conjunto maior, de 200 elementos. . 


```r
x = seq(0,20, 0.1)
plot(sin(x))
```

![plot of chunk unnamed-chunk-19](figure/unnamed-chunk-19-1.png)
 
- Para quem j� tem conhecimento sobre ondas harm�nicas e alguma coisa sobre R, por aqui j� � suficiente para todo o desenvolvimento restante. Mas vamos no passo a passo. 

- Vemos que o gr�fico acima � equivalente a um pouco mais de tr�s comprimentos de onda. Cada comprimento de onda (lambda) � o tamanho no eixo horizontal onde temos uma repeti��o.

### Gr�fico com comprimentos de onda inteiros

- Iniciando uma sequencia com multiplos de PI

- O primeiro ajuste � iniciar e terminar a sequ�ncia de dados com m�ltiplos de Pi. Lembrando que `sin(n * PI) = 0`. Desta forma o gr�fico fica com comprimentos de onda inteiros. Ainda vemos que o n representa a quantidade de ondas.


```r
x <- seq(-2*pi, 2*pi, 0.01)
plot( x , sin(x) ) 
abline(h=0)
abline(v=0)
```

![plot of chunk unnamed-chunk-20](figure/unnamed-chunk-20-1.png)

- Aqui j� temos um segmento de onda, podendo ser a representa��o da fotografia do movimento de uma corda. 

### De ondas simples para ondas complexas

- Na primeira figura, vemos uma onda complexa com dois comprimentos de onda representados. 

- A grande maioria dos sons que ouvimos, das ondas que enxergamos, que utilizamos nas comunica��es, s�o ondas complexas, ou seja, possuem diversos comprimentos de onda e cada comprimento de onda � equivalente a uma frequencia. Estes comprimentos de onda, quando s�o m�ltiplos s�o chamados comprimentos de ondas harm�nicos. 

- Criando um vetor de 1 a  4 (diferentes frequencias/comprimentos de onda)

### Listando quatro ondas harm�nicas no mesmo gr�fico.

#### Script para montar v�rios harm�nicos (ondas com frequencia m�ltiplas)

- Iniciando uma sequencia para representar dois comprimentos de onda.

- Iniciando um vetor com os n�meros 1 a 4, que ser�o usados como multiplicadores.


```r
x <- seq(-2*pi, 2*pi, 0.01)
harm <- seq(1,4)
```

- inicializando vetores 

```r
serie = c()
eixox = c()
cores = c()
```

- A cada loop, a s�rie incrementa a s�rie anterior.

- o conteudo da s�rie � sen(x), sen(2x), ... 

- Matematicamente, o que multiplica o X, � a frequ�ncia angular (w), sendo f a frequ�ncia da onda.

$$w = 2\pi f$$
    

```r
for (i in 1:length(harm))
{
  serie = c( serie, sin(x*harm[i]) )
  eixox = c( eixox, x )
  cores = c( cores, rep(i, length(x)))
}
```

- Agora a s�rie cont�m valores de todos os harm�nicos em sequ�ncia. E as cores servem para diferenciar cada harm�nico.

- Veja que o tamanho da s�rie � quatro vezes o tamanho original de x, pois o loop realizou quatro voltas. 

- Atrav�s da fun��o length() podemos ver o tamanho do vetor x `length(x)` e do vetor s�rie `length(serie)`


```
## [1] "length(x) =  1257 , length(serie) =  5028"
```
- Transformando o vetor em matriz XY. 


```r
sobrepostos = matrix( c(eixox, serie), ncol=2)
dim(sobrepostos)
```

```
## [1] 5028    2
```

- Agora listando todas no mesmo gr�fico. 


```r
title1 <- 'Ondas M�ltiplas'

plot(sobrepostos, cex = 0.2, col=cores, xlab = 'X', ylab = 'y', main = title1)
abline(h=0)
```

![plot of chunk unnamed-chunk-26](figure/unnamed-chunk-26-1.png)

### Onda resultante (unificar as quatro ondas)


```r
x <- seq(-2*pi, 2*pi, 0.01)
harm <- seq(1,4)

serie = sin(x*harm[1]) 
eixox = c(x)
cores = rep(1, length(x))

# ao inv�s de concatenar, agora vamos som�-los.

for (i in 2:length(harm))
{
  serie = serie + sin(x*harm[i]) 
}

ondaunica = matrix( c(eixox, serie), ncol=2)
```

- A onda �nica � resultado do somat�rio dos pontos em Y para cada posi��o do eixo x. Veja acima que o vetor eixox n�o sofre altera��o de uma onda para a outra. 

- Como estamos trabalhando com somat�rio, a onda resultante cont�m menos dados, pois ela � o agrupamento das posi��es do eixo x atrav�s do somat�rio das posi��es repetidas em Y.



```r
dim(ondaunica)
```

```
## [1] 1257    2
```


- Listando a onda resultante. 


```r
title1 <- 'Somat�rio de Ondas'

plot(ondaunica, cex = 0.2, xlab = 'X', ylab = 'y', main = title1)
abline(h=0)
```

![plot of chunk unnamed-chunk-29](figure/unnamed-chunk-29-1.png)

### Onda resultante mais 'Natural'

- Na natureza, a produ��o de ondas com frequencias multiplas, que d�o origem �s notas harmonicas tem origem no fenomeno da reflex�o. Por outro lado, e apesar da conserva��o de energia, a maioria das intera��es f�sicas possuem caracter�stica da resist�ncia ao movimento, gerando assim uma diminui��o da energia. Desta forma n�o � estranho pensar que a energia e por consequencia, a amplitude da onda seja menor a cada reflex�o. 

- Para implementar a amplitude, vamos atribuir pessos a cada uym dos harm�nicos. Abaixo, o novo array `pesos`, iniciado como `c(100, 80, 80, 60) ` mostra 100% para a primeira frequencia (a fundamental) e um leve decaimento at� a quarta frequ�ncia. 


```r
x <- seq(-4*pi, 4*pi, 0.01)
harm <- seq(1,4)
pesos <- c(100, 80, 80, 60) 

serie = pesos[1]*sin(x*harm[1]) 
eixox = c(x)
cores = rep(1, length(x))

# ao inv�s de concatenar, agora vamos som�-los.

for (i in 2:length(harm))
{
  serie = serie + pesos[i]*sin(x*harm[i]) 
}

ondaunica = matrix( c(eixox, serie), ncol=2)

title1 <- 'Onda Resultante (Variando amplitude harmonicos)'

plot(ondaunica, cex = 0.2, xlab = 'X', ylab = 'y', main = title1)
abline(h=0)
```

![plot of chunk unnamed-chunk-30](figure/unnamed-chunk-30-1.png)

### Onda resultante de instrumentos musicais

- Os instrumentos musicais possuem uma arquitetura corporal e de resson�ncia que permite a forma��o de diferentes harm�nicos, o que leva a um **timbre** diferente que permite a diferencia��o auditiva. Uma mesma nota (frequencia fundamental), emitida por instrumentos diferentes s�o diferentes. Como se explica? 

- O **timbre** � o pr�prio resultado da distribui��o harm�nica, e a nota que identificamos � a **frequ�ncia** da onda resultante. Como se pode ver abaixo, apesar de diferentes distribui��es, o comprimento de onda se mant�m semelhante ao comprimento de onda da nota mais grave, ou seja, a *frequ�ncia fundamental*.

- Primeiramente vamos aumentar o n�mero de harm�nicos sens�veis para 10 e modular os pesos destes harm�nicos de forma diferente.

- Depois, estes pesos diferentes ser�o aplicados a cada uma das ondas antes de som�-las, trazendo assim a caracter�stica de amplitudes diferentes para cada m�ltiplo.



```r
x <- seq(-6*pi, 6*pi, 0.01)
harm <- seq(1,10)
pesos <- c(100, 90,  80,  70,  60,  50,  40,  30,  20,  10 )
pesos <- seq(100, 10, -10)

pesos2<- c(100,  0,  80,   0,  60,   0,  40,   0,  20,   0 ) 
pesos3<- c(100,  0,   0,  70,   0,   0,  40,   0,   0,  10 )
pesos4<- c(100,  0,   0,   0,  60,   0,   0,   0,  20,   0 ) 
pesos5<- c(100,  0,   0,   0,   0,  50,   0,   0,   0,   0 ) 
pesos6<- c(100,  0, 100,   0, 100,   0, 100,   0, 100,   0 ) 
#Instrumentos de sopro com comportamento an�malo, com pedal no terceiro ou quinto harmonico
pesos7<- c( 50, 60, 100,  90,  70,  60,   0,   0,   0,   0 ) 
pesos8<- c( 60, 70,  80,  90, 100,  90, 80,  70,   60,  50 ) 
pesos9<- c( 0,100, 100, 0,   0, 0,  0,  0,   0,  0 ) 

for (instru in 1:9) {
  
    # Em cada loop, assume um tipo de distribui��o de pesos de cada harm�nico
    if(instru==2) {pesos <- pesos2}
    if(instru==3) {pesos <- pesos3}
    if(instru==4) {pesos <- pesos4}
    if(instru==5) {pesos <- pesos5}
    if(instru==6) {pesos <- pesos6}
    if(instru==7) {pesos <- pesos7}
    if(instru==8) {pesos <- pesos8}
    if(instru==9) {pesos <- pesos9}
    
    
    serie = pesos[1]*sin(x*harm[1]) 
    eixox = c(x)
    cores = rep(1, length(x))
    
    # ao inv�s de concatenar, agora vamos som�-los.
    
    for (i in 2:length(harm))
    {
      serie = serie + pesos[i]*sin(x*harm[i]) 
    }
    
    ondaunica = matrix( c(eixox, serie), ncol=2)
    
    
    title1 <- paste('Onda Resultante: ( Simula��o' , instru , ')' ) 
    
    plot(ondaunica, cex = 0.2, xlab = 'X', ylab = 'y', main = title1)
    abline(h=0)
}
```

![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-1.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-2.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-3.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-4.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-5.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-6.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-7.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-8.png)![plot of chunk unnamed-chunk-31](figure/unnamed-chunk-31-9.png)

### Batimento 

- O batimento � o resultado do somat�rio de duas ondas com frequ�ncias semelhantes. A Caracter�stica do batimento � escutarmos a m�dia entre as frequencias e simultaneamente escutamos uma frequencia muito baixa, resultado da oscila��o da amplitude, dando a sensa��o do som que aumenta e diminui.

- � muito comum ao afinar instrumentos de corda que este batimento sirva de refer�ncia para a afina��o, ou seja, ao parar de escutar o batimento, se sabe que as duas frequencia est�o iguais.

- Abaixo uma amostra (com 16 comprimentos de onda), onde as frequencias base s�o: $$f1=4\pi,  f2=4.1\pi$$. A frequencia resultante ser� a m�dia, e uma frequ�ncia mais baixa (maior comprimento de onda) do batimento: $$fm=4.05\pi, fb=0.1\pi$$


- 

- 

```r
for(nBat in c(2,3,3) )
{
  x <- seq(-(nBat^2)*pi , (nBat^2)*pi, 0.001)
  harm <- c(4*pi,4.1*pi)
  
  serie = sin(x*harm[1]) 
  eixox = c(x)
  cores = rep(1, length(x))
  
  for (i in 2:length(harm))
  {
    serie = serie + sin(x*harm[i]) 
  }
  
  ondaunica = matrix( c(eixox, serie), ncol=2)
  
  title1 <- ''
  
  plot(ondaunica, cex = 0.2, xlab = 'X', ylab = 'y', main = title1)
  abline(h=0)
}
```

![plot of chunk unnamed-chunk-32](figure/unnamed-chunk-32-1.png)![plot of chunk unnamed-chunk-32](figure/unnamed-chunk-32-2.png)

```r
# Ultimo gr�fico, tra�ar a curva do batimento
serie = serie + sin(x* 0.1 * pi)

plot(ondaunica, cex = 0.2, xlab = 'X', ylab = 'y', main = title1)
```

![plot of chunk unnamed-chunk-32](figure/unnamed-chunk-32-3.png)
