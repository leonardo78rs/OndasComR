# iniciando uma sequencia com multiplos de PI
x <- seq(-2*pi, 2*pi, 0.01)
# cria um vetor de 1..4 (quantidade de harmonicos)
harm <- seq(1,4)
y
#inicializa vetores 
serie = c()
eixox = c()
cores = c()

# a cada loop a s�rie incrementa a s�rie anterior
# o conteudo da s�rie � sen(x), sen(2x), .... 
# matematicamente o que multiplica o X � a frequencia 
# angular
for (i in 1:length(harm))
{
  serie = c( serie, sin(x*harm[i]) )
  eixox = c( eixox, x )
  cores = c( cores, rep(i, length(x)))
}

# agora a serie cont�m valores de todos os
# harmonicos em sequencia
# E as cores servem para diferenciar cada harmonico

#transformando o vetor em matriz XY 
sobrepostos = matrix( c(eixox, serie), ncol=2)

# agora listando todas no mesmo gr�fico. 

title1 <- 'Ondas M�ltiplas'

plot(sobrepostos, cex = 0.2, col=cores, xlab = 'X', ylab = 'y', main = title1)
abline(h=0)


##### somatorio 
# limpando os vetores
serie = sin(x*harm[1]) 
#View(serie)
serie = c() 
eixox = c()
cores = c()

# ao inv�s de concatenar, agora vamos som�-los.
for (i in 2:length(harm))
{
  serie = serie + sin(i*harm[i]) 
  eixox = c( eixox, x )
  cores = c( cores, rep(i, length(x)))
}

ondaunica = matrix( c(eixox, serie), ncol=2)


title1 <- 'Somat�rio de Ondas'

plot(ondaunica, cex = 0.2, col=cores, xlab = 'X', ylab = 'y', main = title1)
abline(h=0)

