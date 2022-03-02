--Exercicio 1	
DECLARE @num as INT 
DECLARE @result as VARCHAR(15)

SET @num = 30
SET @result = 'Multiplo de 2'

IF @num % 2 = 0
	BEGIN
		SELECT @result
END
ELSE
	BEGIN
		IF @num % 3 = 0
			BEGIN
				SET @result = 'Multiplo de 3'
				SELECT @result
		END
		ELSE 
			IF @num % 5 = 0
				BEGIN 
					SET @result = 'Multiplo de 5'
					SELECT @result
			END
			ELSE
				BEGIN
					SET @result = 'Não é multiplo de 2,3,5'
			END
		END 

--Exercicio 2
DECLARE @num1 AS INT, @num2 AS INT, @num3 AS INT, @maior as VARCHAR(20), @menor AS VARCHAR(20)

SET @num1 = 5
SET @num2 = 9
SET @num3 = 9

SET @menor = @num1
SET @maior = @num1


IF @maior < @num2
	BEGIN
		SET @maior = @num2
END
ELSE
	IF @maior < @num3
		BEGIN
			set @maior = @num3
	END
IF @menor > @num2
	BEGIN 
		SET @menor = @num2
END
ELSE
	IF @menor > @num3
		BEGIN
			SET @menor = @num3
	END

SELECT @maior + ' é o maior valor' AS Maior, @menor + ' é o menor valor' AS Menor
	

--Exercicio 3
DECLARE @a as INT, @b as INT, @soma AS INT, @cont AS INT, @aux as INT
SET @a = 0
SET @b = 1
SET @cont = 1
SET @soma = 1
SET @aux = 0
WHILE @cont < 15
	BEGIN
		SET @cont = @cont+1
		SET @aux = @a + @b
		SET @a = @b
		SET @b = @aux
		SET @soma = @soma + @aux
		SELECT @aux as Auxiliar, @a as Primeiro, @b as Segundo, @soma as Soma, @cont as Contador
END
SELECT 'A soma dos 15 primeros termos  = ' + CAST(@soma as VARCHAR(4)) as Resultado

--Exercicio 4
DECLARE @frase as VARCHAR(50), @tamanho as INT, @fraseU as VARCHAR(50), @fraseL as VARCHAR(50)
SET @tamanho = 1
SET @frase = 'sEpArARMaiusCULASdEmINUsculAS'
SET @fraseL = ''
SET @fraseU = ''

WHILE @tamanho <= LEN(@frase)
	BEGIN
		IF SUBSTRING(@frase, @tamanho, 1) = UPPER(SUBSTRING(@frase, @tamanho, 1)) COLLATE LATIN1_GENERAL_CS_AI
			BEGIN
				SET @fraseU = @fraseU + SUBSTRING(@frase,@tamanho,1)
		END
			ELSE
				IF SUBSTRING(@frase, @tamanho, 1) = LOWER(SUBSTRING(@frase, @tamanho, 1)) COLLATE LATIN1_GENERAL_CS_AI
				 BEGIN
					SET @fraseL = @fraseL + SUBSTRING(@frase,@tamanho,1)
				END
	SET @tamanho = @tamanho+1
END
SELECT 'Letras Maiusculas = ' + @fraseU as Maisculas
SELECT 'Letras Minusculas = ' + @fraseL as Minusculas

--Exercicio 5
DECLARE @palavra AS VARCHAR(50), @tamanhoPalavra AS INT, @palavraInvert as VARCHAR(50)
SET @palavraInvert = ''
SET @palavra = 'Inverter'
SET @tamanhoPalavra = LEN(@palavra)

WHILE @tamanhoPalavra >= 0
	BEGIN
		SET @palavraInvert = @palavraInvert + SUBSTRING(@palavra, @tamanhoPalavra, 1) 
	SET @tamanhoPalavra = @tamanhoPalavra - 1
END

SELECT 'Palavra = ' + @palavra as Palavra
SELECT 'Palavra Invertida = ' + @palavraInvert as Invertida