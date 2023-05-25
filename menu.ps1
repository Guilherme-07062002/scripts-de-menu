# Função para exibir o menu
function ExibirMenu {
    $opcoes = @("Executar Script A", "Executar Script B", "Executar Script C", "Sair")
    
    # Loop para exibir as opções
    for ($i = 0; $i -lt $opcoes.Count; $i++) {
        if ($i -eq $posicaoCursor) {
            Write-Host ("-> " + $opcoes[$i]) -ForegroundColor Yellow
        } else {
            Write-Host ("   " + $opcoes[$i])
        }
    }
}

# Define a posição inicial do cursor
$posicaoCursor = 0

# Loop principal do menu
do {
    Clear-Host  # Limpa a tela
    
    ExibirMenu  # Exibe o menu

    # Obtém a entrada do teclado
    $tecla = $host.UI.RawUI.ReadKey("NoEcho, IncludeKeyDown").Key

    # Verifica a tecla pressionada
    switch ($tecla) {
        "UpArrow" {
            # Move o cursor para cima
            $posicaoCursor = [Math]::Max(0, $posicaoCursor - 1)
        }
        "DownArrow" {
            # Move o cursor para baixo
            $posicaoCursor = [Math]::Min($posicaoCursor + 1, $opcoes.Count - 1)
        }
        "Enter" {
            # Realiza a ação com base na opção selecionada
            switch ($posicaoCursor) {
                0 {
                    # Executar Script A
                    Write-Host "Executando Script A..."
                    # Insira aqui o código para executar o Script A
                    # Exemplo: .\scriptA.ps1
                }
                1 {
                    # Executar Script B
                    Write-Host "Executando Script B..."
                    # Insira aqui o código para executar o Script B
                    # Exemplo: .\scriptB.ps1
                }
                2 {
                    # Executar Script C
                    Write-Host "Executando Script C..."
                    # Insira aqui o código para executar o Script C
                    # Exemplo: .\scriptC.ps1
                }
                3 {
                    # Opção de saída
                    Write-Host "Encerrando o programa..."
                }
            }
            
            Pause  # Aguarda uma tecla ser pressionada para continuar
        }
    }
    
} while ($tecla -ne "Escape" -and $posicaoCursor -ne $opcoes.Count - 1)

