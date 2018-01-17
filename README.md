# Consulta-CNPJ-CNAE-Receita
Consulta uma lista de CNPJ e extrai o CNAE.
Esse script foi desenvolvido para ajudar pesquisadores que precisam determinar o CNAE de uma lista de CNPJ.

### Material necessário:
* Um arquivo texto com uma lista de CNPJ com apenas os números (sem pontos, barra e traço);
* Sistema operacional Windows;
* Programa Auto Hot Key instalado:
https://autohotkey.com/download/
* Navegador Google Chrome.

### Como utilizar:
* Baixe os arquivos getCNAE.ahk e commonRoutines.ahk para uma pasta no teu computador;
* Crie o arquvio ListaCNPJ.txt - com a lista de CNPJ - nessa pasta;
* Dê duplo clique no arquivo getCNAE;
* Informe o captacha solicitado pelo site da Receita Federal (Não sou um robô);
* Clique no botão [Consultar].

### Funcionamento:
O robô vai executar as operações:
* Abrir a página de consulta da receita;
* Abrir o código fonte da página;
* Extrair o CNAE do texto;
* Salvar a informação do CNAE no arquivo ListaCNAE.txt;
* Fechar a página com o código-fonte;
* Fechar a página com a consulta do CNPJ;
* Aguardar 20 segundos;
* Repetir o processo.

Obs: Esse tempo de 20 segundos foi um melhor equilibrio encontrado entre velocidade e solicitação de novo captcha pelo site. Menos de 20 segundos resulta em mais pedidos de captcha.

Obs: Eventualmente o site da Receita solicitará novamente que se informe o captcha.
* Clique na checkBox [Não sou um robo];
* Clique no botão [Consultar];

### Resultados esperados:
* O arquivo ListaCNAE.txt com uma lista de CNPJ e CNAE separados por vírgula. Exemplo:
```sh
00902397000101,14.12-6-01 - Confecção de peças de vestuário, exceto roupas íntimas e as confeccionadas sob medida
```
Dica: Esse arquivo pode ser aberto em qualquer programa de planilha eletrônica como o MSExcel.

### Ações corretivas:
Algumas vezes o Site da Receita responde com uma pagina de erro, execute os procedimentos abaixo antes de reiniciar a execução:
* Encerrar a execução do Auto Hot Key (clique no ícone H que aparece na barra de tarefas perto do relógio do Windows);
* Abra o arquivo ListaCNAE.txt e vá para a última linha - pressione Ctrl+End;
* Copie o CNPJ da última linha;
* Feche o arquivo ListaCNAE.txt;
* Abra o arquivo ListaCNPJ.txt;
* Pressione Ctrl+f - vai abrir a caixa de diálogo Localizar;
* Cole o CNPJ copiado do arquivo ListaCNAE.txt;
* Clique no botão Localizar;
* Apague as linhas para cima;
* Salve o arquivo ListaCNPJ.txt;
* Feche o editor do arquivo ListaCNPJ.txt;
* Inicie novamente o procedimento.
