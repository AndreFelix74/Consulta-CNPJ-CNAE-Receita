#Include commonRoutines.ahk

arrayCNPJ := Object()
Loop, Read, ListaCNPJ.txt
{
    arrayCNPJ.Insert(A_LoopReadLine)
}

strLinkBase = http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/Cnpjreva_Vstatus.asp?origem=comprovante&cnpj=
strRegExCNAE = CÓDIGO E DESCRIÇÃO DA ATIVIDADE ECONÔMICA PRINCIPAL[\s\S]*?<b>	(.*?) <\/b>[\s\S]*?<\/font>

SetKeyDelay, 100

openPage("", "Nova guia")

for index, element in arrayCNPJ {
	openPage(strLinkBase element, "Comprovante de Inscrição e de Situação Cadastral")
	Sleep, 500
	
	copyPageContent()

	RegExMatch(clipboard, strRegExCNAE, strMatch)

	Fileappend, % element . ";" . strMatch1 "`n",  ListaCNAE.txt
	
	Send ^w
    Sleep, 20 * 1000
}

copyPageContentCheck() {
	if(SubStr(clipboard, 21, 34) = "<title>Companhias Listadas</title>") {
		Return true
	}
	Return true
}
