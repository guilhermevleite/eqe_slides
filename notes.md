# Introdução

Culturas celulares são extremamente importantes em uma gama de
aplicações academicas e industriais.

Em especial, no contexto farmaceutico, elas possuem um papel
essencial no desenvolvimento e descoberta de novos medicamentos.

Antes de um novo farmaco atingir as prateleiras das farmacias,
ele precisa passar por uma triagem exaustiva, que consiste de duas
grandes fases, a pré clinica e a fase clinica.

## Slide 2 (Drug discovery)
A fase pré clinica pode ser novamente divida em três sub-fases.
Geralmente a primeira fase é a chamada in silico, onde simulações
de computadores vão avaliar a viabilidade do composto em questão.
Na segunda fase, chamada de in vitro, que é a fase foco do nosso
trabalho, o composto é aplicado a culturas celulares para avaliar
sua eficãcia. Depois de avaliar a eficacia em culturas celulares,
o composto passa para os testes em animais, que é a terceira
fase, chama de in vivo. Nessa fase, o composto é aplicado em
animais vivos, com o objetivo de testar suas reações em um
ambiente mais complexo. Além de testar a eficácia, a partir da
fase in vivo, o composto também é avaliado pela sua segurança.

Quando o composto passa pelas fases pre clinicas, ele entra nos
teste clinicos. Esses testes podem acontecer em até quatro
etapas, onde o composto é aplicado em humanos, e a cada etapa o
número de voluntários vai aumentando.

---

Como pode se notar, esse processo de descobrimento e validação de um
composto é trabalhoso, caro e longo. Ainda mais longo, quando se
leva em consideração o fato de que uma vez que um composto falha
em qualquer uma das etapas, ele pode ser descartado por completo.

Por esse motivo, o processo acaba sendo tendencioso a falhas,
e apenas 10% dos compostos chegam de fato aos testes clinicos.
Essas falhas são atribuídas a simplicidades dos testes pre
clinicos que não conseguiram descartar um composto cedo o
suficiente para economizar recursos e tempo.

Para aumentar a taxa de sucesso dos compostos que passam pelo
testes, vários pesquisadores focam suas pesquisas em melhores
modelos nas fases in silico e in vitro.

## Slide 3 (2D vs 3D)
Nos modelos celulares in vitro, as culturas celulares 2D são o
tipo mais comum de cultura para testes. Nessa cultura as células
se desenvolvem em uma monocamada em um substrato dentro de uma
placa de cultura.

Essas culturas são muito praticas para avaliação de compostos,
por exemplo, testes realizados com elas não precisam passar por
um comitê de ética, o que é um requerimento para testes in vivo.
Outras vantagem é o treinamento de profissionais para esse tipo
de cultura é simplificado, uma vez que as técnicas são
amplamentes difundidas.

Essas células também sua imortalizadas e genéticamente muito
parecidas entre si, facilitando a reprodução de resultados. Não
somente isso, mas elas também podem ser congeladas e utilizadas
por longos períodos, o que não pode ser feito com camundongos por
exemplo, que sobrevivem em média dois meses. Além de serem uma
opção mais barata do que manter os viveiros.

Contudo, esse tipo de cultura também possuí uma grande
desvantagem, dada a sua característica monocamada, ela não
consegue reproduzir o microambiente celular com fidelidade. Por
exemplo, em um microambiente tumoral as complexas interações
entre o tumor e o seu arredor é fundamental para o tumor se
estabelecer. Mais do que isso, a distribuição de nutrientes
dentro do tumor e o descarte de dejetos é essencial na
determinação do crescimento desse tumor.

Uma alternativa é a utilização de culturas 3D, que conseguem
reproduzir por exemplo a comunicação celular, as interações entre
estroma e célula e a diferenciação celular. Nessas culturas, as
células crescem flutuando em um meio nutricional, com ou sem um
scaffold.

Nesse sentido, essas culturas são uma opção mais favorável a
avaliar compostos que passam pela fase in vitro, além de seus
testes serem mais rápidos do que os realizados em animais, esse
tipo de cultura pode ser automátizado e é muito mais
reprodutível.

## Slide 4 (Spheroid Regions)

A analise de um esferoide, de cultura 3d, acontece nas suas tres
regiões principais, que de fora para dentro, elas são a região
proliferativa, a região quisciente e a região de hipóxia. Como
seu suprimento é feito por difusão das camadas exteriores para as
camadas mais internas, a concentração de nutrientes e oxigenio
diminui no centro do esferoide. Sendo assim, uma quantificação
dessas três regiões serve para não somente validar um composto,
mas também para indicar onde ele está atuando.

A analise de um esferoide por microscopia é dependente de uma
avaliação ocular de um especialista. Que por sua vez sofre com a
subjetividade do fator humano, além falsas impressões. Por
exemplo, a razão entre o raio de um esferoide e seu volume não é
linear, dando a impressão de que um esferoide cresceu muito menos
do que é verdade. Além disso, um único experimento pode gerar
cerca de 96 esferoides, e, devem ser analisados por um
especialista que pode estar fatigado e cometer erros.

Dessa forma, uma ferramenta para a classificação e analise
automática desses esferoides pode ser um componente essencial em
um ambiente laboratorial. Como já mencionado anteriormente, o
processo pre clinico tem uma baixa taxa de acerto, e, qualquer
automatização pode aumentar a vazão de compostos promissores e
baratear a descoberta de novos farmacos. Nós acreditamos que a
utilização de segmentação semântica não somente é a ferramenta
adequada para a quantificação das diferentes regiões do
esferoide, mas também para a reprodução de resultados.

## Slide 5 (Perguntas de Pesquisa)

Durante a exploração do tema, nós nos deparamos com as seguintes
perguntas de pesquisa, que serviram para guiar nossos objetivos
logo a seguir:

1. Como que uma função de perda sensivel a forma afeta nossa
   segmentação?
2. A utilização do encoder da arquitetura U-Net, como parte
   geradora de uma GAN, produz melhores segmentações?
3. O nosso método consegue produzir uma análise quantitativa de
   esferoides com sua região proliferativa destruída?
4. Como que a diferença de escala entre o menor esferoide e o
   maior vai afetar nossa segmentação?
5. As regiões dos esferoides são diferentes o suficiente para
   serem classificadas por uma único modelo adversarial
   generativo?

## Slide 6 (Objetivos)

Nosso projeto possuí dois objetivos globais, o primeiro: a
formação de um banco de dados, contendo imagens de
campo claro de esferoides de cancer, mascaras de segmentação para
cada uma das três regiões e anotações de qual tratamentos foi
utilizado neles.

Nosso segundo objetivo global é o desenvolvimento de um método
de aprendizado profundo, self-supervised, para realizar a
segmentação semantica nas imagens de campo claro dos esferoides.

Essa proposta, mira em atingir uma transferencia de domínio de
segmentação de culturas celulares, que possuem suas mascaras
amplamentes disponiveis, para o domínio dos esferoides.

Nossos objetivos especificos consistem em:

*. Coletar, revisar e publicar uma revisão literária de
   segmentação semantica para esferoides.
*. Uma analise do estado da arte para os métodos de segmentação
   semantica em culturas celulares em imagens de campo claro.
*. Parceria com o laboratório OncoBiomarkers Research Laboratory,
   no instituto de biologia da Unicamp para a obtenção de imagens
   de campo claro de esferoides.
*. Anotação e organização dessas imagens para a publicação do
   banco de dados.
*. Criação dos protocolos de treino e testes do banco de dados,
   para futuras reprodutibilidade e comparações dos nossos
   resultados.
*. Analise das métricas de avaliação utilizadas nas publicações e
   como comparar nosso métodos com os da literatura.
*. Desenvolver um novo método de aprendizado profundo, capaz de
   realizar a segmentação semantica das regiões dos esferoides.
*. Analise das diferentes funções de perda e seus efeitos na
   segmentação
*. Analise de diferentes backbones para nossa arquitetura
   geradora do modelo adversarial.
*. Avaliar nossa segmentação produzida, por metricas
    qualitativas e quantitavias.

## Slide 7 (Desafios Esperados)

Nosso primeiro desafio já foi encontrado, no qual ao revisar a
literatura, nós notamos que há poucos banco de dados disponíveis
a comunidade cientifica. E menos ainda, os trabalhos que relatam
os mesmo protolocolos e métricas em seus resultados, ao ponto de
alguns trabalhos não reportarem nenhuma métrica de avalição.

No que diz respeito ao nosso método, nós esperamos um
desenvolvimento desafiador da arquitetura adversarial e sua
função de perda, uma vez que tal método é conhecido pela
dificuldade na convergencia dessa função.

Finalmente, a criação do banco de dados se propoe desafiante, uma
vez que gerar anotação das imagens exige tempo e analise de um
especialista. O que vai resultar em um desafio ao treinar o
modelo com menos dados do que o esperado.

## Slide 8 (Contribuições Esperadas)

Nosso trabalho pretende entregar um banco de dados único, de
imagens de esferoides em campo claro e sua documentação sobre
eventuais tratamentos. Nós planejamos coletar imagens em
diferentes condições de luz, lentes e método de captura. Nós
pretendermos contornar o número de imagens com amostras de
diferentes condições, para treinar modelos generalizadores.

Nós também desenvolveremos uma abordagem para segmentação
semantica self-supervised. Onde utilizaremos uma rede GAN para
segmentar as três regiões do esferoide.

Pretendemos entregar uma ferramenta de segmentação que faça parte
do pipeline de analise no dia a dia de um laboratório.

Entregaremos também um estudo qualitativo, que até onde sabemos,
será único ao avaliar a segmentação obtida. Onde um especialista
irá avaliar qual método produziu a melhor segmentação.

E finalmente, está proposta foca em apresentar resultados
competitivos com o estado da arte atual, e, a publicação desses
resultados em coferencias relevantes ao tópico.

# Slide 9 (Literatura relacionada) 15:35

Na literatura relacionada, nós encontramos os seguintes
trabalhos sobre o tema de segmentação de esferoides:

Autores
Métodos e métricas utilizados
Disponibilidade dos dados

# Slide (Literature Limitations)

Os trabalhos revisados utilizaram em sua grande maioria banco de
dados gerados localmente e não publicados, o que impossibilita a
comparação direta entre as segmentações, e deixando somente a
comparação entre métodos. Outras limitações encontradas foram a
utilização de métodos handcrafted e métricas de avaliação que
dizem muito pouco sobre o resultado obtido, como a acurácia
simples por exemplo, que pode avaliar uma péssima segmentação
como boa.

# Slide 11 (Banco de Dados) 2:55

O único banco de dados que encontramos disponível foi o de
Lacalle e outros. Esse banco de dados na verdade são 6 pequenos
bancos, sendo 3 com imagens de campo claro e 3 com imagens de
fluorescencia.

Nome
Método de captura
Número de imagens
Objetiva
Tipo de cultura

Apesar de apresentar as imagens dos esferoides e suas anotações,
os autores não trazem nenhum protocolo de treino/teste, e, as
mascaras de segmentação diferenciam somente o esferoides e o
background.

## Slide 12 (Anotações de Lacalle)

As mascaras foram anotadas com o software ImageJ, que gera um
tipo especifico de segmentação. Onde em vez de salvar uma imagem
da mascara, o software salva uma lista de coordenadas dos
vertices da mascara. Dessa forma, nós criamos um script em python
que reproduz da mascara a partir das coordenadas.

## Slide 13 (Amostras)

Nesse slide nós podemos ver algumas amostras dos banco de dados e
suas mascaras. É possível perceber que algumas regiões
proliferativas que parecem destruídas foram anotadas como parte
do esferoide, e, também que as anotações não representam
exatamente o contorno do esferoide. Fato que vamos discutir nos
resultados.

## Slide 14 (Banco de Dados Proposto)

Em uma parceria com a Profa. Carmen Verissima do OncoBiomarkers
Research Laboratory no IB da Unicamp, nós coletamos as primeiras
imagens que vão compor nosso banco de dados.

Cada esferoide possui duas imagens, uma com foco em suas bordas e
outra com o foco em seu nucleo. E além disso o banco de dados
também contará com as mascaras de segmentação para cada região e
um arquivo CSV com informações de cada esferoide.

## Slide 15 (Aquisição dos Esferoides)

Os esferoides foram obtidos em tres passos:

No primeiro passo, as células KatoIII foram colocadas em uma
placa de 24 poços e encubadas por 24h em 5% de CO2 e 37C. Depois,
elas foram magnetizadas por mais 24h, nesse passo elas também
foram contadas e transferidas para uma placa cell-repellant.
Finalmente, a placa de 96 poços é colocada sobre um imã para
a formação dos esferoides. Com 48h de formação, os esferoides
foram tratados e as primeiras imagens capturadas.

## Slide 16 (Aquisição das Imagens)

As imagens foram coletadas em 48h de formação e em intervalos de
24h depois disso. No momento da primeira coleta eles estão em
condições ideais de crescimento, porém, a partir disso eles serão
tratados com o composto selecionado, que pode inteferir no seu
crescimento.

As imagens foram capturadas com um microscopio Etaluma LS620, em
tons de cinza.

.
.
.

# Slide 17 (Método) 6:15

Essa figura mostra uma visão geral do nosso método
self-supervised. Na entrada do nosso diagram, cada imagem de
esferoide é pareada com sua respectiva mascara. Logo em
seguida ambas as imagens são reduzidas para o tamanho
adequado da rede e passam pelo processo de data augmentation. Uma vez que
esses pre processamentos foram realizados as imagens entram
para treinar o modelo GAN proposto.

## Slide 18 (Data Augmentation)

O processo de data augmentation diz respeito a gerar novas
amostras a partir das imagens que já possuímos. Dessa forma
nós conseguimos criar novos dados sem o custo de capturar
novas imagens. Quanto mais dados nós temos, melhor é a chance
do modelo aprender os parametros para solucionar o problema.

O tipo de augmentation deve ser selecionado de acordo com o
problema, a imagem ilustra alguns exemplos que nós
utilizamos: Random Crop, Rotation, Random Brightness and
Contrast (modificar o brilho e contraste da imagem) e
horizontal e vertical flip.

## Slide 19 (Gerador)

A arquitetura do gerador (segmentador) da nossa rede é a
seguinte:

.
.
.

Ela é baseada no método DeepLabV2, exceto a partir dos blocos
conv3, onde nós aplicamos uma Atrous Spatial Pyramid Pooling,
com o objetivo de capturar as características do esferoide em
diferentes escalas. Após isso, nas convs 4 e 5, nós reduzimos
o stride para 1 e trocamos as convoluções por dilated
convolutions.

As dilated convolutions são utilizadas para aumentar o campo
receptor da convolulção e incorporar informações visuais que
estão espacialmente distantes. Nós contamos com a modificação
no stride para produzir melhores resultados depois do
upsampling, que é seguido de uma camada softmax para
classificar a saída.

## Slide 20 (Discriminador)

A arquitetura do nosso discriminador é composta de uma FCN,
com 5 camadas convolucionais, com kernels 4x4 e stride de 2.
Depois de cada camada há uma leaky-relu e o mapa gerado é
upsampled para o tamanho do input.

## Slide 21 (Função de Perca Gerador)

Nossa proposta conta com duas funções de perca, uma para o
gerador e outra para o discriminador.

Nossa função do gerador é uma combinação de uma função cross
entropy, com uma perca adversarial ponderada e uma perca semi
supervisionada, também ponderada. Essa função faz o
treinamento supervisionado nas primeiras épocas, e, depois
passa para um treinamento self-supervised, onde o que foi
aprendido até então é utilizado para gerar uma máscara que
sirva para guiar o treinamento.

Nosso discriminador conta com uma função de perca que é uma
cross-entropy multi classe, que intercala partes da função de
acordo se a entrada veio do gerador ou da mascara.

## Slide 23 (Métricas de Avaliação)

Para avaliar nossos resultados, nós selecionamos métricas que
são comummente utilizadas em segmentação semantica.
O Dice Coefficient foi outra métrica escolhida, também
chamada de F1-score, e, também a interseção sobre a união, também
conhecida como Jaccard Index. Ambas medem a similaridade entre
duas mascaras.

## Slide 24 (Baseline)

Nosso baseline selecionado é a aplicação de uma abordagem
handcrafted, baseada no algoritmo watershed.

Watershed é uma técnica de limiarização, que trata imagens em
tons de cinza como se fossem um mapa topografico. Dessa forma
os pixels brancos representam os vales e os pretos os picos.
Dentro desse mapa o algoritmo seleciona pontos para criar
sementes de água nos mínimos locais, e a partir dessas
sementes o algoritmo começa a encher o mapa topografico com
água. Quando dois corpos de água se encontram, a linha que se
forma entre eles é uma segmentação.

Esse algoritmo tende a criar sementes demais, o que resulta
em uma segmentação muito fragmentada. É recomendado que se
escolha uma nova forma de criar as sementes.

# Slide 25 (Resultados Preliminares) 9:00

Na tabela a seguir nós mostramos a eficácia do nosso baseline
ao segmentar diferentes banco de dados, avaliados pelo
Jaccard Index. E também apresentamos o resultado preliminar
de uma U-Net. Apesar de alguns bancos serem de imagens de
fluorescencia, nós utilizamos somente a parte de campo claro
disponível.

O watershed obteve seu melhor resultado no banco BL5S, que é onde
nós concentramos nossos esforços. Apesar da nossa tentativa de
utilizar um método com o menor número de parametros possível,
nossos resultados mostram que esse ideal pode ser inalcansável.
Nossos parametros mostraram uma queda brusca para os outros
bancos, que nós acreditamos indicar que o método é esperadamente
sucetivel a variações, apesar de ser mais sucetivel do que o
esperado.

# Slide

O banco BL5S é composto por imagens de background claro e
esferoides escuros e na maioria das vezes pequenos. Nós
acreditamos que o contraste entre objeto e fundo foi ideial
para o watershed, junto com o fato de serem pequenos
esferoides.

# Slide

No dataset BN10S o resultado foi bem pior, nós acreditamos
que a objetiva de 10x contribuiu para isso. Ela gerou
esferoides que ocupam quase todo canvas, e a tendencia do
watershed de fragmentar a segmentação atrapalhou o resultado
final. A diminuição do contraste entre objeto e background
prejudicou a segmentação, junto com o fato de que várias
anotações parecem não condizerem com o esferoide em quadro.

# Slide

Nós observamos que os resultados referentes ao BN2S parecem
serem causados pela inacurácia das anotações, somadas ao
pouco contraste entre objeto e fundo, novamente.

# Slide

No caso do banco FL5C, é possível notar vários artefatos que
aparecem nas imagens e não fazem parte do esferroide. O fato
deles serem bem mais escuros que os esferoides parece ter
confundido o algoritmo ao realizar a limiarização.

# Slide
Aparentemente os esferoides do banco FL5S são em média bem
menores que os outros, isso causou uma fragmentação na
segmentação.

Mesmo nos casos em que o watershed encontrou o esferoide, devido
ao nosso algoritmo que seleciona qual corpo de agua deve ser
escolhido, somente uma parte foi selecionada.

# Slide
As imagens do banco FN2S parecem conter partes que se parecem
com o corpo de um esferoide, porém não compoem o mesmo. Nosso
baseline não foi capaz de diferenciar ambos, o que refletiu
na baixa métrica, e, além do contraste afetar a diferenciação.

# Slide
Esses resultados mostraram desafios que nós esperavamos ao
aplicar o modelo GAN, desafios do tipo: se devemos compensar o
contraste e quais areas do esferoide são de fato de
interesse? Além disso, em nenhuma instância o watershed foi
capaz de realizar um contorno satisfatório da borda dos
esferoides.

# Slide
TODO: repetição

Além dos resultados com o watershed, nós também
experimentamos com a arquitetura U-Net. Nesse experimento o
modelo foi treinado com o banco FL5C, onde ele obteve um
indice de 93%. Nós queriamos testar se o modelo era capaz de
ignorar os artefatos encontrados, porém quando nós
transferimos esse aprendizado para outro banco, ou seja, nós
testamos o mesmo modelo no banco BL5S, que possuí imagens
similares porém não possuí artefatos. Ficou evidente que
houve um overfitting, já que o modelo não conseguiu
generalizar seu aprendizado para outro banco.

A utilização da U-Net serve não somente como reprodução de resultados,
mas também nós pretendemos utilizar a segmentação da rede para gerar
pré-mascaras em nosso banco, que em seguida serão revisadas e
corrigidas por um especialista.

# Slide (Schedule) 10:29

# Final Considerations

Nossos resultados preliminares indicam, como esperado, que
metodos handcrafted não são versateis o suficiente para
realizar a segmentação de esferoides em diferentes cenários.
Além disso, nós tivemos dificuldades em encontrar banco de
dados publicos e com anotações confiáveis.

Em vista desses desafios, nós propomos, o que será o
primeiro banco de dados, com imagens de esferoides, contendo
protolocos de treino/teste, suas devidas anotações e
anotações das tres regioes distintas.
E finalmente, nós propomos um método self-supervised para
segmentar os esferoides, que fará uso de métodos atuais da
literatura como GANs e Transformers.

# 1:14

# First: 45min 37min
