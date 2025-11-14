-- Definição dos tipos de dados

data Status = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

-- Tipo para um Serviço individual

data Servico = Servico
    { nome :: String
    , tipo :: String
    , precoBase :: Double
    } deriving (Show, Eq)

-- Tipo para o Atendimento completo

data Atendimento = Atendimento
    { servicos :: [Servico]
    , status :: Status
    } deriving (Show)

-- Funções de Cálculo e Regras

bonusEspiritual :: [Servico] -> Double
bonusEspiritual servicos_lista =
    let
        -- Soma de todos os preços base
        precoTotalBase = sum (map precoBase servicos_lista)

        -- Aplica bônus de 25% se houver mais de 3 serviços
        numServicos = length servicos_lista
        totalComBonus
            | numServicos > 3 = precoTotalBase * 1.25 -- Aplica 25% de bônus
            | otherwise       = precoTotalBase

        -- Aplica desconto de 10% se o total ultrapassar 500 (após o bônus)
        totalFinal
            | totalComBonus > 500.0 = totalComBonus * 0.90 -- Aplica 10% de desconto
            | otherwise             = totalComBonus
    in
        totalFinal
        
        
valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | status atendimento == Cancelado = 0.0 
    | otherwise                       = bonusEspiritual (servicos atendimento)

descricacaoPrimeiroServico :: Atendimento -> String
descricacaoPrimeiroServico atendimento =
    case servicos atendimento of
        [] -> "Nenhum serviço registrado." -- Caso especial: lista vazia
        (primeiroServico:_) ->
            (nome primeiroServico) ++ " (" ++ (tipo primeiroServico) ++ ")"

-- Demonstração de Atendimentos Variados

banhoSpirits :: Servico
banhoSpirits = Servico "Banho de Purificação" "Banho" 150.0

massagemSoul :: Servico
massagemSoul = Servico "Massagem de Alívio" "Massagem" 200.0

banqueteDragons :: Servico
banqueteDragons = Servico "Banquete Suntuoso" "Banquete" 450.0

penteadoGhost :: Servico
penteadoGhost = Servico "Penteado Espectral" "Serviço" 50.0


atendimento1 :: Atendimento
atendimento1 = Atendimento
    { servicos = [banhoSpirits, massagemSoul]
    , status = Cancelado
    }
    
atendimento2 :: Atendimento
atendimento2 = Atendimento
    { servicos = [banhoSpirits, massagemSoul]
    , status = Finalizado
    }
    
atendimento3 :: Atendimento
atendimento3 = Atendimento
    { servicos = [banhoSpirits, massagemSoul, banqueteDragons, penteadoGhost]
    , status = EmAndamento
    }
    
atendimento4 :: Atendimento
atendimento4 = Atendimento
    { servicos = [banhoSpirits, massagemSoul, banqueteDragons]
    , status = Finalizado
    }
    
main :: IO ()
main = do
    putStrLn "--- Demonstração de Atendimentos ---"
    putStrLn ""

    -- Atendimento 1
    putStrLn $ "**Atendimento 1** (Cancelado)"
    putStrLn $ "  - Status: " ++ show (status atendimento1)
    putStrLn $ "  - Primeiro Serviço: " ++ descricacaoPrimeiroServico atendimento1
    putStrLn $ "  - Valor Final: " ++ show (valorFinalAtendimento atendimento1)
    putStrLn "---"

    -- Atendimento 2
    putStrLn $ "**Atendimento 2** (2 Serviços, < 500)"
    putStrLn $ "  - Status: " ++ show (status atendimento2)
    putStrLn $ "  - Primeiro Serviço: " ++ descricacaoPrimeiroServico atendimento2
    putStrLn $ "  - Base: 350.0 (Sem bônus/desconto)"
    putStrLn $ "  - Valor Final: " ++ show (valorFinalAtendimento atendimento2)
    putStrLn "---"

    -- Atendimento 3
    putStrLn $ "**Atendimento 3** (4 Serviços, > 500)"
    putStrLn $ "  - Status: " ++ show (status atendimento3)
    putStrLn $ "  - Primeiro Serviço: " ++ descricacaoPrimeiroServico atendimento3
    putStrLn $ "  - Base: 850.0 -> Com Bônus (x1.25): 1062.5 -> Com Desconto (x0.90): 956.25"
    putStrLn $ "  - Valor Final: " ++ show (valorFinalAtendimento atendimento3)
    putStrLn "---"

    -- Atendimento 4
    putStrLn $ "**Atendimento 4** (3 Serviços, > 500)"
    putStrLn $ "  - Status: " ++ show (status atendimento4)
    putStrLn $ "  - Primeiro Serviço: " ++ descricacaoPrimeiroServico atendimento4
    putStrLn $ "  - Base: 800.0 -> Sem Bônus -> Com Desconto (x0.90): 720.0"
    putStrLn $ "  - Valor Final: " ++ show (valorFinalAtendimento atendimento4)
