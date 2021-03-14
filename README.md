# OrbitalDynamics


_Repositório com códigos, em Fortran, utilizados em um trabalho de simulação computacional de transferências orbitais de satélites._


No trabalho, foi apresentada uma proposta de manobras orbitais a partir do modelo de Hohmann para transferências não-impulsivas diferenciando a equação de Hohmann com intuito de obter um modelo semi-analítico de transferência entre órbitas próximas. Para obter os resultados a partir de simulações numéricas, foi utilizado um veículo espacial hipotético cujo decaimento se inicia a partir de 300 km até 120 km de altitude, onde supostamente começa a reentrada atmosférica do veículo até atingir a superfície da Terra. Ainda na fase de decaimento, utiliza-se as equações de força central para propagação orbital com e sem perturbação devido ao arrasto atmosférico, e na fase de reentrada um novo sistema de equações com variáveis de trajetória será implementada donde sairá a latitude e longitude de impacto do corpo na superfície da Terra.

Inicialmente, a partir de condições iniciais orbitais conhecidas, é realizado o decaimento orbital integrando as equações keplerianas num intervalo de tempo, utilizando o método de transferência tipo Hohmann não-impulsivo até atingir a altitude de reentrada atmosférica.

A partir de 300 km de altitude, a transferência até 120 km foi realizada desacelerando o veículo por 22 s, em seguida, o veículo se propaga pelo período P sem a desaceleração. Logo após, uma segunda desaceleração por 22 s é aplicada para circularizar a órbita final 


<img src="https://raw.githubusercontent.com/limadlp/OrbitalDynamics/main/orbital01.png" height="300">
Gráfico da altitude do veículo em função do tempo na órbita inicial circular a qual permanece constante e em seguida decai gradativamente até o veículo atingir 120 km de altitude.

<p></p>
Observa-se que na Figura que a órbita final é uma órbita elíptica com excentricidade 0.00042566, isto é muito próxima de circularizar. Isto garante um bom resultado no processo de transferências não-impulsivas, visto que se obtém um  maior controle no decaimento orbital de veículos espaciais, culminando evidentemente, na escolha da localização do posicionamento no espaço para reentrada atmosférica. 

<img src="https://raw.githubusercontent.com/limadlp/OrbitalDynamics/main/orbital02.png" height="300">
Visão plana da órbita circular inicial (vermelho), decaimento (azul) e Terra (verde).
