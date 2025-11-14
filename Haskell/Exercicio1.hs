-- Definição do tipo Bebida
data Bebida = Bebida {
    nome  :: String,
    tipo  :: String,
    preco :: Float
} deriving (Show)

-- Status do pedido
data Status = Aberto | Entregue | Cancelado
    deriving (Show)

-- Tipo Pedido com lista de bebidas + status
data Pedido = Pedido {
    bebidas :: [Bebida],
    status  :: Status
} deriving (Show)

-- Calcula o valor total do pedido
valorTotalPedido :: Pedido -> Float
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido bs _) =
    sum (map preco bs) + 5.0    -- soma preços + taxa fixa

-- Retorna o nome da primeira bebida ou mensagem
primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _)     = "A lista de bebidas está vazia"
primeiraBebida (Pedido (b:_) _)  = nome b

-- main para fazer o teste
main :: IO ()
main = do
    let cafe = Bebida "Expresso" "Café" 7.5
    let cha  = Bebida "Chá Verde" "Chá" 5.0

    let pedido1 = Pedido [cafe, cha] Aberto

    putStrLn ("Valor total: " ++ show (valorTotalPedido pedido1))
    putStrLn ("Primeira bebida: " ++ primeiraBebida pedido1)
