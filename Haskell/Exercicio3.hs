-- Definição de Tipo Banda
data Banda = Banda {
    nomeBanda :: String,
    genero    :: String,
    cache     :: Double
} deriving (Show)

-- Status do evento
data Status = Encerrado | Ativo | Cancelado
    deriving (Show)

-- Tipo Evento
data Evento = Evento {
    bandas :: [Banda],
    status :: Status
} deriving (Show)

-- Calcula o custo total do evento
custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0
custoTotalEvento (Evento bs _) =
    let somaCaches = sum (map cache bs)
        taxaProducao = somaCaches * 0.20
    in somaCaches + taxaProducao

-- Retorna a banda de abertura
bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "Nenhuma banda para abrir o evento"
bandaAbertura (Evento (b:_) _) = nomeBanda b

-- Retorna a última banda a tocar (fechando a noite)
bandaFechamento :: Evento -> String
bandaFechamento (Evento [] _) = "Nenhuma banda para fechar o evento"
bandaFechamento (Evento bs _) = nomeBanda (last bs)

-- MAIN com 3 exemplos de evento diferentes
main :: IO ()
main = do

    -- Bandas
    let rock    = Banda "Thunder Wolves" "Rock" 5000
    let jazz    = Banda "Blue Garden" "Jazz" 3000
    let popband = Banda "StarLight" "Pop" 7000
    let metal   = Banda "Iron Roar" "Metal" 6000

    -- Evento 1: Ativo
    let evento1 = Evento [rock, jazz, popband] Ativo

    -- Evento 2: Encerrado
    let evento2 = Evento [metal, rock] Encerrado

    -- Evento 3: Cancelado
    let evento3 = Evento [jazz, popband] Cancelado

    putStrLn "---------------- EVENTO 1 (Ativo) ----------------"
    putStrLn ("Custo total: " ++ show (custoTotalEvento evento1))
    putStrLn ("Banda de abertura: " ++ bandaAbertura evento1)
    putStrLn ("Banda de fechamento: " ++ bandaFechamento evento1)

    putStrLn "---------------- EVENTO 2 (Encerrado) ------------"
    putStrLn ("Custo total: " ++ show (custoTotalEvento evento2))
    putStrLn ("Banda de abertura: " ++ bandaAbertura evento2)
    putStrLn ("Banda de fechamento: " ++ bandaFechamento evento2)

    putStrLn "---------------- EVENTO 3 (Cancelado) ------------"
    putStrLn ("Custo total: " ++ show (custoTotalEvento evento3))
    putStrLn ("Banda de abertura: " ++ bandaAbertura evento3)
    putStrLn ("Banda de fechamento: " ++ bandaFechamento evento3)
