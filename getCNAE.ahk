#Include commonRoutines.ahk

lastCNPJ_CNAE := findLastCNPJ_CNAE()

bLineReached := (lastCNPJ_CNAE = "")

arrayCNPJ := Object()

Loop, Read, ListaCNPJ.txt
{
    if (bLineReached = false) {
        bLineReached := (A_LoopReadLine = lastCNPJ_CNAE)
        continue
    }

    arrayCNPJ.Insert(A_LoopReadLine)
}

strLinkBase = http://www.receita.fazenda.gov.br/pessoajuridica/cnpj/cnpjreva/Cnpjreva_Vstatus.asp?origem=comprovante&cnpj=
strRegExCNPJ = NÚMERO DE INSCRIÇÃO[\s\S]*?<b>(.*?)<\/b><br>[\s\S]*?<b>
strRegExCNAE = CÓDIGO E DESCRIÇÃO DA ATIVIDADE ECONÔMICA PRINCIPAL[\s\S]*?<b>	(.*?) <\/b>[\s\S]*?<\/font>

SetKeyDelay, 100

openPage("", "Nova guia")

nIndex := 0
for index, element in arrayCNPJ {
    nIndex += 1
	openPage(strLinkBase element, "Comprovante de Inscrição e de Situação Cadastral")
	Sleep, 500
	
	copyPageContent()

    RegExMatch(clipboard, strRegExCNPJ, strMatchCNPJ)
	RegExMatch(clipboard, strRegExCNAE, strMatchCNAE)

	Fileappend, % element . ";" . strMatchCNPJ1 . ";" . strMatchCNAE1 "`n",  ListaCNAE.txt
	
	Send ^w
    if (nIndex = 2) {
        nIndex := 0
        Sleep, 20 * 1000
    } else {
        Sleep, 2 * 1000
    }
}

MsgBox "Finalizado."
Exit

copyPageContentCheck() {
	if (SubStr(clipboard, 21, 34) = "<title>Companhias Listadas</title>") {
		Return true
	}

	Return true
}

findLastCNPJ_CNAE() {
    strReturn := ""
    Loop, Read, ListaCNAE.txt
    {
        strReturn = %A_LoopReadLine%
    }

    strReturn := SubStr(strReturn, 1, 14)

    Return strReturn
}