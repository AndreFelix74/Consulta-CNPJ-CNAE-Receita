# Consulta-CNPJ-CNAE-Receita
Consulta uma lista de CNPJ e extrai o CNAE

Material necessário:
Sistema operacional Windows
Programa Auto Hot Key instalado:
https://autohotkey.com/download/
Navegador Google Chrome

Como utilizar:
Baixe os arquivos getCNAE e commonRoutines para uma pasta;
Crie o arquvio ListaCNPJ.txt nessa pasta;
Coloque a lista lista de CNPJs a serem consultados no arquivo ListaCNPJ.txt;
Dê duplo clique no arquivo getCNAE;
Informe o captacha solicitado pelo site da Receita Federal (Não sou um robô);
Clique no botão [Consultar].

Funcionamento:
O robô vai:
Abrir a página de consulta da receita;
Abrir o código fonte da página;
Extrair o CNAE do texto;
Salvar a informação no arquivo ListaCNAE.txt;
Fechar a página com o código-fonte;
Fechar a página com a consulta do CNPJ;
Aguardar 20 segundos;
Repetir o processo.

Obs: Eventualmente o site da Receita solicitará novamente que se informe o captcha.
Clique na checkBox [Não sou um robo];
Clique no botão [Consultar];

Resultados esperados:
O arquivo ListaCNAE.txt com uma lista de CNPJ e CNAE separados por vírgula. Exemplo:
00902397000101,14.12-6-01 - Confecção de peças de vestuário, exceto roupas íntimas e as confeccionadas sob medida

Ações corretivas:
Algumas vezes o Site da Receita responde com uma pagina de erro. 
Encerrar a execução do Auto Hot Key;
Abra o arquivo ListaCNAE.txt e copie o CNPJ da última linha;
Feche o arquivo ListaCNAE.txt;
Abra o arquivo ListaCNPJ.txt;
Pressione Ctrl+f - vai abrir a caixa de diálogo e Localizar;
Cole o CNPJ copiado do arquivo ListaCNAE.txt;
Apague as linhas para cima;
Salve o arquivo ListaCNPJ.txt;
Feche o editor do arquivo ListaCNPJ.txt;
Inicie novamente o procedimento.
