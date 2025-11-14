-- Definição do Tipo Item
data Item = Item {
    nomeItem :: String,
    categoria :: String,
    precoItem :: Double
} deriving (Show)

-- Tipo CompraZelda
data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving (Show)

-- Calcula 10% de desconto se total > 200
calculaDesconto :: [Item] -> Double
calculaDesconto listaItens =
    let total = sum (map precoItem listaItens)
    in if total > 200
       then total * 0.10
       else 0

-- Usa guards para calcular valor final
valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda lista)
    | total > 200 = total - desconto        -- aplica desconto
    | otherwise   = total + 15.0            -- adiciona frete
    where
        total = sum (map precoItem lista)
        desconto = calculaDesconto lista

-- Função main com exemplos pedidos
main :: IO ()
main = do
    let espada    = Item "Espada de Aço" "Arma" 150.0
    let pocao     = Item "Poção de Vida" "Poção" 30.0
    let escudo    = Item "Escudo Hyliano" "Equipamento" 180.0
    let arco      = Item "Arco Kokiri" "Arma" 90.0

    -- Compra 1 (total > 200 → aplica desconto)
    let compra1 = CompraZelda [espada, escudo]
    
    -- Compra 2 (total <= 200 → adiciona frete)
    let compra2 = CompraZelda [pocao, arco]

    putStrLn "----------------------------------------"
    putStrLn "COMPRA 1:"
    print compra1
    putStrLn ("Valor final: " ++ show (valorFinal compra1))

    putStrLn "----------------------------------------"
    putStrLn "COMPRA 2:"
    print compra2
    putStrLn ("Valor final: " ++ show (valorFinal compra2))
